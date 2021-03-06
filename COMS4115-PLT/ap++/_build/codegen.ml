(* generates LLVM IR from AP++ source code *)

module L = Llvm
module A = Ast
open Sast 

module StringMap = Map.Make(String)

(* translate : Sast.program -> Llvm.module *)
let translate (globals, functions) =
  let context    = L.global_context () in
  
  (* Create the LLVM compilation module into which
     we will generate code *)
  let the_module = L.create_module context "AP_PlusPlus" in

  (* Get types from the context *)
  let i32_t      = L.i32_type    context
  and i8_t       = L.i8_type     context
  and i1_t       = L.i1_type     context
  and float_t    = L.double_type context
  and str_t      = L.pointer_type (L.i8_type context)
  and void_t     = L.void_type   context 
  and list_t t   = L.struct_type context [| L.pointer_type (L.i32_type context); (L.pointer_type t) |]
  and ptr_list_t t = L.pointer_type (L.struct_type context [| L.pointer_type (L.i32_type context); (L.pointer_type t) |])
  in

  (* Return the LLVM type for a AP++ type *)
  let rec ltype_of_typ = function
      A.Int   -> i32_t
    | A.Bool  -> i1_t
    | A.Float -> float_t
    | A.String -> str_t
    | A.Void  -> void_t
    | A.List t -> list_t (ltype_of_typ t)
  in
  let type_str t = match t with
       A.Int -> "int"
     | A.Bool -> "bool"
     | A.Float -> "float"
     | A.String -> "str"
     | _ -> raise (Failure "Invalid string map key type")
  in
  (* Create a map of global variables after creating each *)
  let global_vars : L.llvalue StringMap.t =
    let global_var m (t, n) = 
      let init = match t with
         A.Float -> L.const_float (ltype_of_typ t) 0.0
       | _ -> L.const_int (ltype_of_typ t) 0
      in StringMap.add n (L.define_global n init the_module) m in
    List.fold_left global_var StringMap.empty globals in

  let printf_t : L.lltype = 
      L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
  let printf_func : L.llvalue = 
      L.declare_function "printf" printf_t the_module in

   (* LLVM insists each basic block end with exactly one "terminator" 
    instruction that transfers control.  This function runs "instr builder"
    if the current block does not already have a terminator.  Used,
    e.g., to handle the "fall off the end of the function" case. *)
   let add_terminal builder instr =
     match L.block_terminator (L.insertion_block builder) with 
       Some _ -> ()
     | None -> ignore (instr builder) in
 
    let build_while builder build_predicate build_body func_def =
       let pred_bb = L.append_block context "while" func_def in
       ignore(L.build_br pred_bb builder);
 
       let body_bb = L.append_block context "while_body" func_def in
       add_terminal (build_body (L.builder_at_end context body_bb)) (L.build_br pred_bb);
 
       let pred_builder = L.builder_at_end context pred_bb in
       let bool_val = build_predicate pred_builder in
 
       let merge_bb = L.append_block context "merge" func_def in
       ignore(L.build_cond_br bool_val body_bb merge_bb pred_builder);
       L.builder_at_end context merge_bb
   in

   let build_if builder build_predicate build_then_stmt build_else_stmt func_def =
       let bool_val = build_predicate builder in
       let merge_bb = L.append_block context "merge" func_def in
       let build_br_merge = L.build_br merge_bb in (* partial function *)

       let then_bb = L.append_block context "then" func_def in
       add_terminal (build_then_stmt (L.builder_at_end context then_bb)) 
       build_br_merge;

       let else_bb = L.append_block context "else" func_def in
       add_terminal (build_else_stmt (L.builder_at_end context else_bb)) 
       build_br_merge;

       ignore(L.build_cond_br bool_val then_bb else_bb builder);
       L.builder_at_end context merge_bb
  in
  (* ltype list_get(list a, i32_t index) *)
  let list_get : L.llvalue StringMap.t = 
    let list_get_ty m typ = 
       let ltype = (ltype_of_typ typ) in 
       let def_name = (type_str typ) in
       let def = L.define_function ("list_get" ^ def_name) (L.function_type ltype [| L.pointer_type (list_t ltype); i32_t |]) the_module in
       let build = L.builder_at_end context (L.entry_block def) in
       let list_ptr = L.build_alloca (L.pointer_type (list_t ltype)) "list_ptr_alloc" build in
       let _ = L.build_store (L.param def 0) list_ptr build in
       let idx_ptr = L.build_alloca i32_t "idx_alloc" build in
       let _ = L.build_store (L.param def 1) idx_ptr build in
       let list_load = L.build_load list_ptr "list_load" build in
       let list_array_ptr = L.build_struct_gep list_load 1 "list_array_ptr" build in
       let list_array_load = L.build_load list_array_ptr "array_load" build in
       let idx = L.build_load idx_ptr "idx_load" build in
       let list_array_element_ptr = L.build_gep list_array_load [| idx |] "list_arry_element_ptr" build in
       let element_val = L.build_load list_array_element_ptr "list_array_element_ptr" build in
       let _ = L.build_ret element_val build in
       StringMap.add def_name def m in
  List.fold_left list_get_ty StringMap.empty [ A.Bool; A.Int; A.Float; A.String ] in

  (* void list_set(list a, i32_t idx, ltype value) *)
  let list_set : L.llvalue StringMap.t = 
    let list_set_ty m typ =
     let ltype = (ltype_of_typ typ) in 
     let def_name = (type_str typ) in
     let def = L.define_function ("list_set" ^ def_name) (L.function_type void_t [| L.pointer_type (list_t ltype); i32_t; ltype |]) the_module in
     let build = L.builder_at_end context (L.entry_block def) in
     let list_ptr = L.build_alloca (L.pointer_type (list_t ltype)) "list_ptr_alloc" build in
     ignore(L.build_store (L.param def 0) list_ptr build);
     let list_load = L.build_load list_ptr "list_load" build in
     let list_array_ptr = L.build_struct_gep list_load 1 "list_array_ptr" build in
     let list_array_load = L.build_load list_array_ptr "list_array_load" build in
     let idx_element_ptr = L.build_gep list_array_load [| L.param def 1 |] "list_arry_next_element_ptr" build in
     let _ = L.build_store (L.param def 2) idx_element_ptr build in
     let _ = L.build_ret_void build in
     StringMap.add def_name def m in 
  List.fold_left list_set_ty StringMap.empty [ A.Bool; A.Int; A.Float; A.String ] in

  (* void list_push(list, ltype value) *)
  let list_push : L.llvalue StringMap.t = 
    let list_push_ty m typ =
     let ltype = (ltype_of_typ typ) in 
     let def_name = (type_str typ) in
     let def = L.define_function ("list_push" ^ def_name) (L.function_type void_t [| L.pointer_type (list_t ltype); ltype |]) the_module in
     let build = L.builder_at_end context (L.entry_block def) in
     let list_ptr = L.build_alloca (L.pointer_type (list_t ltype)) "list_ptr_alloc" build in
     ignore(L.build_store (L.param def 0) list_ptr build);
     let valPtr = L.build_alloca ltype "val_alloc" build in
     ignore(L.build_store (L.param def 1) valPtr build);
     let list_load = L.build_load list_ptr "list_load" build in
     let list_array_ptr = L.build_struct_gep list_load 1 "list_array_ptr" build in
     let list_array_load = L.build_load list_array_ptr "list_array_load" build in
     let list_size_ptr_ptr = L.build_struct_gep list_load 0 "list_size_ptr_ptr" build in 
     let list_size_ptr = L.build_load list_size_ptr_ptr "list_size_ptr" build in
     let list_size = L.build_load list_size_ptr "list_size" build in
     let next_index = list_size in
     let next_element_ptr = L.build_gep list_array_load [| next_index |] "list_arry_next_element_ptr" build in
     let next_size = L.build_add list_size (L.const_int i32_t 1) "inc_size" build in
     let _ = L.build_store next_size list_size_ptr build in
     let _ = L.build_store (L.build_load valPtr "val" build) next_element_ptr build in
     let _ = L.build_ret_void build in
     StringMap.add def_name def m in 
  List.fold_left list_push_ty StringMap.empty [ A.Bool; A.Int; A.Float; A.String ] in

  (* ltype list_pop(list a) *)
  let list_pop : L.llvalue StringMap.t = 
    let list_pop_ty m typ =
       let ltype = (ltype_of_typ typ) in 
       let def_name = (type_str typ) in
       let def = L.define_function ("list_pop" ^ def_name) (L.function_type ltype [| L.pointer_type (list_t ltype) |]) the_module in
       let build = L.builder_at_end context (L.entry_block def) in
       let list_ptr = L.build_alloca (L.pointer_type (list_t ltype)) "list_ptr_alloc" build in
       ignore(L.build_store (L.param def 0) list_ptr build);
       let list_load = L.build_load list_ptr "list_load" build in
       let list_array_ptr = L.build_struct_gep list_load 1 "list_array_ptr" build in
       let list_array_load = L.build_load list_array_ptr "list_array_load" build in
       let list_size_ptr_ptr = L.build_struct_gep list_load 0 "list_size_ptr_ptr" build in 
       let list_size_ptr = L.build_load list_size_ptr_ptr "list_size_ptr" build in
       let list_size = L.build_load list_size_ptr "list_size" build in
       let list_sizeMin1 = L.build_sub list_size (L.const_int i32_t 1) "dec_size" build in
       let last_element_ptr = L.build_gep list_array_load [| list_sizeMin1 |] "list_arry_next_element_ptr" build in
       let last_element_val = L.build_load last_element_ptr "list_arry_next_element" build in
       let _ = L.build_store list_sizeMin1 list_size_ptr build in
       let _ = L.build_ret last_element_val build in
    StringMap.add def_name def m in
  List.fold_left list_pop_ty StringMap.empty [ A.Bool; A.Int; A.Float; A.String ] in

  (* i32_t list_size(list a) *)
  let list_size : L.llvalue StringMap.t = 
    let list_size_ty m typ =
     let ltype = (ltype_of_typ typ) in 
     let def_name = (type_str typ) in
     let def = L.define_function ("list_size" ^ def_name) (L.function_type i32_t [| L.pointer_type (list_t ltype) |]) the_module in
     let build = L.builder_at_end context (L.entry_block def) in
     let list_ptr = L.build_alloca (L.pointer_type (list_t ltype)) "list_ptr_alloc" build in
     ignore(L.build_store (L.param def 0) list_ptr build);
     let list_load = L.build_load list_ptr "list_load" build in
     let list_size_ptr_ptr = L.build_struct_gep list_load 0 "list_size_ptr_ptr" build in 
     let list_size_ptr = L.build_load list_size_ptr_ptr "list_size_ptr" build in
     let list_size = L.build_load list_size_ptr "list_size" build in
     ignore(L.build_ret list_size build);
     StringMap.add def_name def m in 
  List.fold_left list_size_ty StringMap.empty [ A.Bool; A.Int; A.Float; A.String ] in

  let init_list builder list_ptr list_type = 
    (* initialize size to 0 *)
    let sizePtrPtr = L.build_struct_gep list_ptr 0 "list_size_ptr" builder in 
       let sizePtr = L.build_alloca i32_t "list_size" builder in
       let _ = L.build_store (L.const_int i32_t 0) sizePtr builder in
       ignore(L.build_store sizePtr sizePtrPtr builder);
    (* initialize array *)
    let list_array_ptr = L.build_struct_gep list_ptr 1 "list.arry" builder in 
     (* TODO: allocate nothing and have list grow dynamically as necessary when pushing into the list *)
      let p = L.build_array_alloca (ltype_of_typ list_type) (L.const_int i32_t 1028) "p" builder in
      ignore(L.build_store p list_array_ptr builder);
  in

  let list_slice : L.llvalue StringMap.t = 
     let list_slice_ty m typ = 
        let ltype = (ltype_of_typ typ) in 
        let def_name = (type_str typ) in
        let def = L.define_function ("list_slice" ^ def_name) (L.function_type void_t [| ptr_list_t ltype; ptr_list_t ltype; i32_t; i32_t |]) the_module in
        let build = L.builder_at_end context (L.entry_block def) in
 
        let list_ptr_ptr = L.build_alloca (ptr_list_t ltype) "list_ptr_alloc" build in
        let _ = L.build_store (L.param def 0) list_ptr_ptr build in
        let list_ptr = L.build_load list_ptr_ptr "list_ptr_ptr" build in

        let list_ptr_ptr2 = L.build_alloca (ptr_list_t ltype) "list_ptr_alloc2" build in
        let _ = L.build_store (L.param def 1) list_ptr_ptr2 build in
        let list_ptr2 = L.build_load list_ptr_ptr2 "list_ptr_ptr2" build in

        let idx_ptr1 = L.build_alloca i32_t "idx_alloc" build in
        let _ = L.build_store (L.param def 2) idx_ptr1 build in
        let idx1 = L.build_load idx_ptr1 "idx_load" build in
 
        let idx_ptr2 = L.build_alloca i32_t "idx_alloc" build in
        let _ = L.build_store (L.param def 3) idx_ptr2 build in 
        let idx2 = L.build_load idx_ptr2 "idx_load" build in
 
        (* loop counter init: 0 *)
        let loop_cnt_ptr = L.build_alloca i32_t "loop_cnt" build in
        let _ = L.build_store (L.const_int i32_t 0) loop_cnt_ptr build in
        (* loop upper bound: j-i *)
        let loop_upper_bound = L.build_sub idx2 idx1 "loop_upper_bound" build in
        (* loop condition: cnt <= j-i *)
        let loop_cond _builder = 
            L.build_icmp L.Icmp.Sle (L.build_load loop_cnt_ptr "loop_cnt" _builder) loop_upper_bound "loop_cond" _builder
        in
        (* assignment: b[cnt] = a[cnt + i] *)
        let loop_body _builder = 
           let to_index = L.build_load loop_cnt_ptr "to_idx" _builder in
           let from_index = L.build_add to_index idx1 "from_idx" _builder in
           let get_val = L.build_call (StringMap.find (type_str typ) list_get) [| list_ptr; from_index |] "list_get" _builder in
           let _ = L.build_call (StringMap.find (type_str typ) list_push) [| list_ptr2; get_val |] "" _builder in
           let index_incr = L.build_add (L.build_load loop_cnt_ptr "loop_cnt" _builder) (L.const_int i32_t 1) "loop_itr" _builder in
           let _ = L.build_store index_incr loop_cnt_ptr _builder in 
           _builder
        in
        let while_builder = build_while build loop_cond loop_body def in
        ignore(L.build_ret_void while_builder);
        StringMap.add def_name def m
     in 
     List.fold_left list_slice_ty StringMap.empty [ A.Bool; A.Int; A.Float; A.String ] in

  (* i32_t list_find(list, val) *)
  let list_find : L.llvalue StringMap.t = 
    let list_find_ty m typ =
       let ltype = (ltype_of_typ typ) in 
       let def_name = (type_str typ) in
       let def = L.define_function ("list_find" ^ def_name) (L.function_type i32_t [| L.pointer_type (list_t ltype); ltype |]) the_module in
       let build = L.builder_at_end context (L.entry_block def) in
       let list_ptr = L.build_alloca (L.pointer_type (list_t ltype)) "list_ptr_alloc" build in
       ignore(L.build_store (L.param def 0) list_ptr build);
       let find_value_ptr = L.build_alloca ltype "find_val_alloc" build in
       ignore(L.build_store (L.param def 1) find_value_ptr build);
       let find_value = L.build_load find_value_ptr "find_val" build in
       let list_load = L.build_load list_ptr "list_load" build in
       let list_size_ptr_ptr = L.build_struct_gep list_load 0 "list_size_ptr_ptr" build in 
       let list_size_ptr = L.build_load list_size_ptr_ptr "list_size_ptr" build in
       let list_size = L.build_load list_size_ptr "list_size" build in
       let loop_idx_ptr = L.build_alloca i32_t "loop_cnt" build in
       let _ = L.build_store (L.const_int i32_t 0) loop_idx_ptr build in
       let loop_upper_bound = list_size in
       let loop_cond _builder = 
          L.build_icmp L.Icmp.Slt (L.build_load loop_idx_ptr "loop_iter_cnt" _builder) loop_upper_bound "loop_cond" _builder
       in
       let loop_body _builder = 
         let index = L.build_load loop_idx_ptr "to_idx" _builder in
         let get_val = L.build_call (StringMap.find (type_str typ) list_get) [| list_load; index |] "list_get" _builder in
         let if_cond _builder2 = 
            (match typ with
                A.Int | A.Bool -> L.build_icmp L.Icmp.Eq 
              | A.Float -> L.build_fcmp L.Fcmp.Oeq
              | _ -> raise (Failure ("list_find does not support this list type"))
            ) get_val find_value "if_cond" _builder2 
         in
         let if_body _builder2 = ignore(L.build_ret index _builder2); _builder2 in
         let else_body _builder2 = ignore(L.const_int i32_t 0); _builder2 in
         let if_builder = build_if _builder if_cond if_body else_body def in
         let index_incr = L.build_add (L.build_load loop_idx_ptr "loop_idx" if_builder) (L.const_int i32_t 1) "loop_itr" if_builder in
         let _ = L.build_store index_incr loop_idx_ptr if_builder in 
         if_builder
       in
       let while_builder = build_while build loop_cond loop_body def in
       ignore(L.build_ret (L.const_int i32_t (-1)) while_builder);
       StringMap.add def_name def m in 
     List.fold_left list_find_ty StringMap.empty [ A.Bool; A.Int; A.Float ] in
 
  (* void list_remove(list, typ value) *)
  let list_remove : L.llvalue StringMap.t = 
    let list_remove_ty m typ =
     let ltype = (ltype_of_typ typ) in 
     let def_name = (type_str typ) in
     let def = L.define_function ("list_remove" ^ def_name) (L.function_type void_t [| L.pointer_type (list_t ltype); ltype |]) the_module in
     let build = L.builder_at_end context (L.entry_block def) in
     let list_ptr = L.build_alloca (L.pointer_type (list_t ltype)) "list_ptr_alloc" build in
     ignore(L.build_store (L.param def 0) list_ptr build);
     let remove_value_ptr = L.build_alloca ltype "rem_val_ptr" build in
     ignore(L.build_store (L.param def 1) remove_value_ptr build);
     let remove_value = L.build_load remove_value_ptr "rem_val" build in
     let list_load = L.build_load list_ptr "list_load" build in
     let list_size_ptr_ptr = L.build_struct_gep list_load 0 "list_size_ptr_ptr" build in 
     let list_size_ptr = L.build_load list_size_ptr_ptr "list_size_ptr" build in
     let list_size = L.build_load list_size_ptr "list_size" build in
     let listFindIndex = L.build_call (StringMap.find (type_str typ) list_find) [| list_load; remove_value |] "list_find" build in
     let list_find_if_cond _builder = 
         L.build_icmp L.Icmp.Sge listFindIndex (L.const_int i32_t 0) "loop_cond" _builder in
     let list_else_body _builder = ignore(L.const_int i32_t 0); _builder in
     let list_find_if_body _builder = 
        let loop_idx_ptr = L.build_alloca i32_t "loop_cnt_ptr" _builder in
        let loop_start_idx = L.build_add listFindIndex (L.const_int i32_t 1) "loop_start_idx" _builder in
        let _ = L.build_store loop_start_idx loop_idx_ptr _builder in
        let loop_upper_bound = list_size in
        let loop_cond _builder = 
           L.build_icmp L.Icmp.Slt (L.build_load loop_idx_ptr "loop_cnt" _builder) loop_upper_bound "loop_cond" _builder 
        in
        let loop_body _builder = 
          let cur_index = L.build_load loop_idx_ptr "cur_idx" _builder in
          let shiftto_index = L.build_sub cur_index (L.const_int i32_t 1) "shift_to_idx" _builder in
          let get_val = L.build_call (StringMap.find (type_str typ) list_get) [| list_load; cur_index |] "list_get" _builder in
          let _ = L.build_call (StringMap.find (type_str typ) list_set) [| list_load; shiftto_index; get_val |] "" _builder in
          let index_incr = L.build_add cur_index (L.const_int i32_t 1) "loop_itr" _builder in
          let _ = L.build_store index_incr loop_idx_ptr _builder in 
          _builder
        in
        let while_builder = build_while _builder loop_cond loop_body def in
        let size_dec = L.build_sub list_size (L.const_int i32_t 1) "size_dec" while_builder in
        let _ = L.build_store size_dec list_size_ptr while_builder in
        ignore(L.build_ret_void while_builder); while_builder 
     in
     let if_builder = build_if build list_find_if_cond list_find_if_body list_else_body def in
     let _ = L.build_ret_void if_builder in
     StringMap.add def_name def m in 
  List.fold_left list_remove_ty StringMap.empty [ A.Bool; A.Int; A.Float ] in

  (* void list_insert(list, int idx, typ value) *)
  let list_insert : L.llvalue StringMap.t = 
    let list_insert_ty m typ =
     let ltype = (ltype_of_typ typ) in 
     let def_name = (type_str typ) in
     let def = L.define_function ("list_insert" ^ def_name) (L.function_type void_t [| L.pointer_type (list_t ltype); i32_t; ltype |]) the_module in
     let build = L.builder_at_end context (L.entry_block def) in

     let list_ptr = L.build_alloca (L.pointer_type (list_t ltype)) "list_ptr_alloc" build in
     ignore(L.build_store (L.param def 0) list_ptr build);
     let list_load = L.build_load list_ptr "list_load" build in

     let insertidx_ptr = L.build_alloca i32_t "insert_idx_ptr" build in
     ignore(L.build_store (L.param def 1) insertidx_ptr build);
     let insertIdx = L.build_load insertidx_ptr "insert_idx" build in
     
     let insertValPtr = L.build_alloca ltype "insert_val_ptr" build in
     ignore(L.build_store (L.param def 2) insertValPtr build);
     let insertVal = L.build_load insertValPtr "insert_val" build in

     let list_size_ptr_ptr = L.build_struct_gep list_load 0 "list_size_ptr_ptr" build in 
     let list_size_ptr = L.build_load list_size_ptr_ptr "list_size_ptr" build in
     let list_size = L.build_load list_size_ptr "list_size" build in
     let loop_idx_ptr = L.build_alloca i32_t "loop_cnt_ptr" build in
     let lastIndex = L.build_sub list_size (L.const_int i32_t 1) "last_index" build in
     let _ = L.build_store lastIndex loop_idx_ptr build in
     let decto_index = insertIdx in
     let loop_cond _builder = 
        L.build_icmp L.Icmp.Sge (L.build_load loop_idx_ptr "loop_cnt" _builder) decto_index "loop_cond" _builder 
     in
     let loop_body _builder = 
       let cur_index = L.build_load loop_idx_ptr "cur_idx" _builder in
       let shiftto_index = L.build_add cur_index (L.const_int i32_t 1) "shift_to_idx" _builder in
       let get_val = L.build_call (StringMap.find (type_str typ) list_get) [| list_load; cur_index |] "list_get" _builder in
       let _ = L.build_call (StringMap.find (type_str typ) list_set) [| list_load; shiftto_index; get_val |] "" _builder in
       let indexDec = L.build_sub cur_index (L.const_int i32_t 1) "loop_itr" _builder in
       let _ = L.build_store indexDec loop_idx_ptr _builder in 
       _builder
     in
     let while_builder = build_while build loop_cond loop_body def in
     let _ = L.build_call (StringMap.find (type_str typ) list_set) [| list_load; insertIdx; insertVal |] "" while_builder in
     let sizeInc = L.build_add list_size (L.const_int i32_t 1) "size_inc" while_builder in
     let _ = L.build_store sizeInc list_size_ptr while_builder in
     ignore(L.build_ret_void while_builder);
     StringMap.add def_name def m in 
  List.fold_left list_insert_ty StringMap.empty [ A.Bool; A.Int; A.Float ] in

 (* void list_insert(list, int idx, typ value) *)
  let list_reverse : L.llvalue StringMap.t = 
    let list_reverse_ty m typ =
     let ltype = (ltype_of_typ typ) in 
     let def_name = (type_str typ) in
     let def = L.define_function ("list_reverse" ^ def_name) (L.function_type void_t [| L.pointer_type (list_t ltype) |]) the_module in
     let build = L.builder_at_end context (L.entry_block def) in

     let list_ptr = L.build_alloca (L.pointer_type (list_t ltype)) "list_ptr_alloc" build in
     ignore(L.build_store (L.param def 0) list_ptr build);
     let list_load = L.build_load list_ptr "list_load" build in

     let list_size_ptr_ptr = L.build_struct_gep list_load 0 "list_size_ptr_ptr" build in 
     let list_size_ptr = L.build_load list_size_ptr_ptr "list_size_ptr" build in
     let list_size = L.build_load list_size_ptr "list_size" build in

     let leftPtr = L.build_alloca i32_t "left_idx" build in 
     let _ = L.build_store (L.const_int i32_t 0) leftPtr build in
     let rightPtr = L.build_alloca i32_t "right_idx" build in
     let _ = L.build_store (L.build_sub list_size (L.const_int i32_t 1) "tmp" build) rightPtr build in

     let while_cond _builder = L.build_icmp L.Icmp.Slt 
        (L.build_load leftPtr "left_idx" _builder) 
        (L.build_load rightPtr "right_idx" _builder) "while_cond" _builder 
     in
     let while_body _builder = 
        let left_idx = (L.build_load leftPtr "left_idx" _builder) in
        let right_idx = (L.build_load rightPtr "right_idx" _builder) in
        let get_left_val = L.build_call (StringMap.find (type_str typ) list_get) [| list_load; left_idx |] "list_get" _builder in
        let get_right_val = L.build_call (StringMap.find (type_str typ) list_get) [| list_load; right_idx |] "list_get" _builder in
        let _ = L.build_call (StringMap.find (type_str typ) list_set) [| list_load; left_idx; get_right_val |] "" _builder in
        let _ = L.build_call (StringMap.find (type_str typ) list_set) [| list_load; right_idx; get_left_val |] "" _builder in
        let _ = L.build_store (L.build_add left_idx (L.const_int i32_t 1) "tmp" _builder) leftPtr _builder in
        let _ = L.build_store (L.build_sub right_idx (L.const_int i32_t 1) "tmp" _builder) rightPtr _builder in
        _builder
      in
      let while_builder = build_while build while_cond while_body def in
      ignore(L.build_ret_void while_builder);
      StringMap.add def_name def m in 
  List.fold_left list_reverse_ty StringMap.empty [ A.Bool; A.Int; A.Float ] in

  (* Define each function (arguments and return type) so we can 
     call it even before we've created its body *)
  let function_decls : (L.llvalue * sfunc_decl) StringMap.t =
    let function_decl m fdecl =
      let name = fdecl.sfname
      and formal_types = Array.of_list (List.map (fun (t,_) -> ltype_of_typ t) fdecl.sformals)
      in let ftype = L.function_type (ltype_of_typ fdecl.styp) formal_types in
      StringMap.add name (L.define_function name ftype the_module, fdecl) m in
      List.fold_left function_decl StringMap.empty functions in

  (* Fill in the body of the given function *)
  let build_function_body fdecl =
    let (the_function, _) = StringMap.find fdecl.sfname function_decls in
    let builder = L.builder_at_end context (L.entry_block the_function) in

    let int_format_str = L.build_global_stringptr "%d\n" "fmt" builder in
    let float_format_str = L.build_global_stringptr "%g\n" "fmt" builder in
    let str_format_str = L.build_global_stringptr "%s\n" "fmt" builder in

    (* Construct the function's "locals": formal arguments and locally
       declared variables.  Allocate each on the stack, initialize their
       value, if appropriate, and remember their values in the "locals" map *)
    let local_vars =
      let add_formal m (t, n) p = 
        L.set_value_name n p;
    let local = L.build_alloca (ltype_of_typ t) n builder in
    ignore(
      match t with 
        A.List list_type -> init_list builder local list_type
      | _ -> ()
    );
    ignore (L.build_store p local builder);
    StringMap.add n local m 

      (* Allocate space for any locally declared variables and add the
       * resulting registers to our map *)
      and add_local m (t, n) =
  let local_var = L.build_alloca (ltype_of_typ t) n builder in 
  ignore(
    match t with 
      A.List list_type -> init_list builder local_var list_type
    | _ -> ()
  );
  StringMap.add n local_var m 
      in
      let formals = List.fold_left2 add_formal StringMap.empty fdecl.sformals
          (Array.to_list (L.params the_function)) in
      List.fold_left add_local formals fdecl.slocals 
    in

    (* Return the value for a variable or formal argument.
       Check local names first, then global names *)
    let lookup n = try StringMap.find n local_vars
                   with Not_found -> StringMap.find n global_vars

    in
    (* Construct code for an expression; return its value *)
    let rec expr builder ((_, e) : sexpr) = match e with
        SILiteral i  -> L.const_int i32_t i
      | SBLiteral b  -> L.const_int i1_t (if b then 1 else 0)
      | SFLiteral l -> L.const_float float_t l
      | SSLiteral s -> L.build_global_stringptr (s^"\x00") "strptr" builder
      | SNoexpr     -> L.const_int i32_t 0
      | SId s       -> L.build_load (lookup s) s builder
      | SAssign (s, e) -> let e' = expr builder e in
                          ignore(L.build_store e' (lookup s) builder); e'
      | SBinop ((A.Float, _ ) as e1, op, e2) ->
        let e1' = expr builder e1
        and e2' = expr builder e2 in
        (match op with 
          A.Add     -> L.build_fadd
        | A.Sub     -> L.build_fsub
        | A.Mult    -> L.build_fmul
        | A.Div     -> L.build_fdiv 
        | A.Equal   -> L.build_fcmp L.Fcmp.Oeq
        | A.Neq     -> L.build_fcmp L.Fcmp.One
        | A.Less    -> L.build_fcmp L.Fcmp.Olt
        | A.Leq     -> L.build_fcmp L.Fcmp.Ole
        | A.Greater -> L.build_fcmp L.Fcmp.Ogt
        | A.Geq     -> L.build_fcmp L.Fcmp.Oge
        | A.And | A.Or | A.Mod ->
            raise (Failure "internal error: semant should have rejected and/or on float")
        ) e1' e2' "tmp" builder
       (* TODO: list equality check *)
       (* | SBinop ((A.List, _) as e1, op, e2) ->
        let e1' = expr builder e1
        and e2' = expr builder e2 in
        (match op with 
          A.Equal   -> 
        | A.Neq     -> 
        | _ -> raise (Failure "internal error: semant should have rejected and/or on float")
        ) e1' e2' "tmp" builder *)
      | SBinop (e1, op, e2) ->
        let e1' = expr builder e1
        and e2' = expr builder e2 in
        (match op with
          A.Add     -> L.build_add
        | A.Sub     -> L.build_sub
        | A.Mult    -> L.build_mul
        | A.Div     -> L.build_sdiv
        | A.Mod     -> L.build_srem
        | A.And     -> L.build_and
        | A.Or      -> L.build_or
        | A.Equal   -> L.build_icmp L.Icmp.Eq
        | A.Neq     -> L.build_icmp L.Icmp.Ne
        | A.Less    -> L.build_icmp L.Icmp.Slt
        | A.Leq     -> L.build_icmp L.Icmp.Sle
        | A.Greater -> L.build_icmp L.Icmp.Sgt
        | A.Geq     -> L.build_icmp L.Icmp.Sge
        ) e1' e2' "tmp" builder
    | SUnop(op, ((t, e'') as e)) ->
          let e' = expr builder e in
      (match op with
        A.Neg when t = A.Float -> L.build_fneg e' "tmp" builder
      | A.Neg                  -> L.build_neg e' "tmp" builder
      | A.Not                  -> L.build_not e' "tmp" builder
      | A.PlusPlusPre -> 
        let new_val = (L.build_add e' (L.const_int i32_t 1)) "tmp" builder in
        let id = match (e'') with 
          SId s -> s
          | _ -> raise (Failure ("++ operand must be an ID")) in
        let var_ptr = (lookup id) in
        let _ = L.build_store new_val var_ptr builder in new_val
      | A.MinusMinusPre ->
        let new_val = (L.build_sub e' (L.const_int i32_t 1)) "tmp" builder in
        let id = match (e'') with 
          SId s -> s
          | _ -> raise (Failure ("-- operand must be an ID")) in
        let var_ptr = (lookup id) in
        let _ = L.build_store new_val var_ptr builder in new_val
      | A.PlusPlusPost -> 
        let new_val = (L.build_add e' (L.const_int i32_t 1)) "tmp" builder in
        let id = match (e'') with 
          SId s -> s
          | _ -> raise (Failure ("++ operand must be an ID")) in
        let var_ptr = (lookup id) in
        let _ = L.build_store new_val var_ptr builder in e'
      | A.MinusMinusPost ->
        let new_val = (L.build_sub e' (L.const_int i32_t 1)) "tmp" builder in
        let id = match (e'') with 
          SId s -> s
          | _ -> raise (Failure ("-- operand must be an ID")) in
        let var_ptr = (lookup id) in
        let _ = L.build_store new_val var_ptr builder in e')

    | SListGet (list_type, id, e) ->
      L.build_call (StringMap.find (type_str list_type) list_get) [| (lookup id); (expr builder e) |] "list_get" builder
    | SListSize (list_type, id) -> 
      L.build_call ((StringMap.find (type_str list_type)) list_size) [| (lookup id) |] "list_size" builder
    | SListPop (list_type, id) -> 
      L.build_call ((StringMap.find (type_str list_type)) list_pop) [| (lookup id) |] "list_pop" builder
    | SListSlice (list_type, id, e1, e2) ->
       let ltype = (ltype_of_typ list_type) in
       let new_list_ptr = L.build_alloca (list_t ltype) "new_list_ptr" builder in
       let _ = init_list builder new_list_ptr list_type in
       let e' = match (fst e1, fst e2) with
           (A.Int, A.Int) -> (expr builder e1, expr builder e2)
          | (A.Void, A.Int) -> (L.const_int i32_t 0, expr builder e2)
          | (A.Int, A.Void) ->  (expr builder e1, L.build_sub (expr builder (A.Int, SListSize(list_type, id))) (L.const_int i32_t 1) "size_min_one" builder)
          | (A.Void, A.Void) -> (L.const_int i32_t 0, L.build_sub (expr builder (A.Int, SListSize(list_type, id))) (L.const_int i32_t 1) "size_min_one" builder)
          | _ -> raise (Failure ("illegal list slice arguments")) 
       in
       let _ = L.build_call ((StringMap.find (type_str list_type)) list_slice) [| (lookup id); new_list_ptr; fst e'; snd e' |] "" builder in
       L.build_load new_list_ptr "new_list" builder
    | SListFind (list_type, id, e) ->
      L.build_call (StringMap.find (type_str list_type) list_find) [| (lookup id); (expr builder e) |] "list_find" builder
    | SListLiteral (list_type, literals) ->
       let ltype = (ltype_of_typ list_type) in
       let new_list_ptr = L.build_alloca (list_t ltype) "new_list_ptr" builder in
       let _ = init_list builder new_list_ptr list_type in
       let map_func literal = 
          ignore(L.build_call (StringMap.find (type_str list_type) list_push) [| new_list_ptr; (expr builder literal) |] "" builder);
       in
       let _ = List.rev (List.map map_func literals) in
       L.build_load new_list_ptr "new_list" builder
    | SCall ("prints", [e]) ->
      L.build_call printf_func [| str_format_str ; (expr builder e) |] "printf" builder
    | SCall ("printi", [e]) ->
      L.build_call printf_func [| int_format_str ; (expr builder e) |] "printf" builder
    | SCall ("printb", [e]) ->
      L.build_call printf_func [| int_format_str; (expr builder e) |] "printf" builder
    | SCall ("printf", [e]) ->
      L.build_call printf_func [| float_format_str ; (expr builder e) |] "printf" builder
    | SCall (f, args) ->
         let (fdef, fdecl) = StringMap.find f function_decls in
         let llargs = List.rev (List.map (expr builder) (List.rev args)) in
         let result = (match fdecl.styp with 
                              A.Void -> ""
                            | _ -> f ^ "_result") in
               L.build_call fdef (Array.of_list llargs) result builder
         in

    (* Build the code for the given statement; return the builder for
       the statement's successor (i.e., the next instruction will be built
       after the one generated by this call) *)

    let rec stmt builder = function
        SBlock sl -> List.fold_left stmt builder sl
      | SListPush (id, e) -> 
          ignore(L.build_call (StringMap.find (type_str (fst e)) list_push) [| (lookup id); (expr builder e) |] "" builder); builder 
      | SListSet (list_type, id, e1, e2) ->
          ignore(L.build_call (StringMap.find (type_str list_type) list_set) [| (lookup id); (expr builder e1); (expr builder e2) |] "" builder); builder
      | SListClear (list_type, id) ->
          ignore(init_list builder (lookup id) list_type); builder
      | SListRemove (id, e) ->
          ignore(L.build_call (StringMap.find (type_str (fst e)) list_remove) [| (lookup id); (expr builder e) |] "" builder); builder
      | SListInsert (id, e1, e2) ->
          ignore(L.build_call (StringMap.find (type_str (fst e2)) list_insert) [| (lookup id); (expr builder e1); (expr builder e2) |] "" builder); builder
      | SListReverse (list_type, id) ->
          ignore(L.build_call (StringMap.find (type_str list_type) list_reverse) [| (lookup id) |] "" builder); builder
      | SExpr e -> ignore(expr builder e); builder 
      | SReturn e -> ignore(match fdecl.styp with
                              (* Special "return nothing" instr *)
                              A.Void -> L.build_ret_void builder 
                              (* Build return statement *)
                            | _ -> L.build_ret (expr builder e) builder );
                     builder
      | SIf (predicate, then_stmt, else_stmt) ->
         let bool_val = expr builder predicate in
         let merge_bb = L.append_block context "merge" the_function in
         let build_br_merge = L.build_br merge_bb in (* partial function *)

         let then_bb = L.append_block context "then" the_function in
         add_terminal (stmt (L.builder_at_end context then_bb) then_stmt)
         build_br_merge;

         let else_bb = L.append_block context "else" the_function in
         add_terminal (stmt (L.builder_at_end context else_bb) else_stmt)
         build_br_merge;

         ignore(L.build_cond_br bool_val then_bb else_bb builder);
         L.builder_at_end context merge_bb

      | SWhile (predicate, body) ->
        let pred_bb = L.append_block context "while" the_function in
        ignore(L.build_br pred_bb builder);

        let body_bb = L.append_block context "while_body" the_function in
        add_terminal (stmt (L.builder_at_end context body_bb) body)
          (L.build_br pred_bb);

        let pred_builder = L.builder_at_end context pred_bb in
        let bool_val = expr pred_builder predicate in

        let merge_bb = L.append_block context "merge" the_function in
        ignore(L.build_cond_br bool_val body_bb merge_bb pred_builder);
        L.builder_at_end context merge_bb

      (* Implement for loops as while loops *)
      | SFor (e1, e2, e3, body) -> stmt builder
        ( SBlock [SExpr e1 ; SWhile (e2, SBlock [body ; SExpr e3]) ] )
      
      in

    (* Build the code for each statement in the function *)
    let builder = stmt builder (SBlock fdecl.sbody) in

    (* Add a return if the last block falls off the end *)
    add_terminal builder (match fdecl.styp with
        A.Void -> L.build_ret_void
      | A.Float -> L.build_ret (L.const_float float_t 0.0)
      | t -> L.build_ret (L.const_int (ltype_of_typ t) 0))
  in

  List.iter build_function_body functions;
  the_module