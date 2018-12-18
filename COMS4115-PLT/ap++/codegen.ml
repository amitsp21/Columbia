(* Code generation: translate takes a semantically checked AST and
produces LLVM IR

LLVM tutorial: Make sure to read the OCaml version of the tutorial

http://llvm.org/docs/tutorial/index.html

Detailed documentation on the OCaml LLVM library:

http://llvm.moe/
http://llvm.moe/ocaml/

*)

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
  and list_t t   = L.struct_type context [| L.i32_type context; (L.pointer_type t) |]
  and ptr_list_t t = L.pointer_type (L.struct_type context [| L.i32_type context; (L.pointer_type t) |])
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
  (* ltype list_get(list, index) *)
  let list_get : L.llvalue StringMap.t = 
    let list_get_ty m typ = 
       let ltype = (ltype_of_typ typ) in 
       let defName = (type_str typ) in
       let def = L.define_function ("list_get" ^ defName) (L.function_type ltype [| L.pointer_type (list_t ltype); i32_t |]) the_module in
       let build = L.builder_at_end context (L.entry_block def) in
       let listPtr = L.build_alloca (L.pointer_type (list_t ltype)) "list_ptr_alloc" build in
       let _ = L.build_store (L.param def 0) listPtr build in
       let idxPtr = L.build_alloca i32_t "idx_alloc" build in
       let _ = L.build_store (L.param def 1) idxPtr build in
       let listLoad = L.build_load listPtr "list_load" build in
       let listArrayPtr = L.build_struct_gep listLoad 1 "list_array_ptr" build in
       let listArrayLoad = L.build_load listArrayPtr "array_load" build in
       let idx = L.build_load idxPtr "idx_load" build in
       let listArrayElementPtr = L.build_gep listArrayLoad [| idx |] "list_arry_element_ptr" build in
       let elementVal = L.build_load listArrayElementPtr "list_array_element_ptr" build in
       let _ = L.build_ret elementVal build in
       StringMap.add defName def m in
  List.fold_left list_get_ty StringMap.empty [ A.Bool; A.Int; A.Float ] in

  (* void list_set(list, int32 idx, typ value) *)
  let list_set : L.llvalue StringMap.t = 
    let list_set_ty m typ =
     let ltype = (ltype_of_typ typ) in 
     let defName = (type_str typ) in
     let def = L.define_function ("list_set" ^ defName) (L.function_type void_t [| L.pointer_type (list_t ltype); i32_t; ltype |]) the_module in
     let build = L.builder_at_end context (L.entry_block def) in
     let listPtr = L.build_alloca (L.pointer_type (list_t ltype)) "list_ptr_alloc" build in
     ignore(L.build_store (L.param def 0) listPtr build);
     let listLoad = L.build_load listPtr "list_load" build in
     let listArrayPtr = L.build_struct_gep listLoad 1 "list_array_ptr" build in
     let listArrayLoad = L.build_load listArrayPtr "list_array_load" build in
     let idxElementPtr = L.build_gep listArrayLoad [| L.param def 1 |] "list_arry_next_element_ptr" build in
     let _ = L.build_store (L.param def 2) idxElementPtr build in
     let _ = L.build_ret_void build in
     StringMap.add defName def m in 
  List.fold_left list_set_ty StringMap.empty [ A.Bool; A.Int; A.Float ] in

  (* void list_push(list, typ value) *)
  let list_push : L.llvalue StringMap.t = 
    let list_push_ty m typ =
     let ltype = (ltype_of_typ typ) in 
     let defName = (type_str typ) in
     let def = L.define_function ("list_push" ^ defName) (L.function_type void_t [| L.pointer_type (list_t ltype); ltype |]) the_module in
     let build = L.builder_at_end context (L.entry_block def) in
     (* listPtr = list** *)
     let listPtr = L.build_alloca (L.pointer_type (list_t ltype)) "list_ptr_alloc" build in
     (* store listPtr1*, listPtr2** *)
     ignore(L.build_store (L.param def 0) listPtr build);
     let valPtr = L.build_alloca ltype "val_alloc" build in
     (* store int32, int32* *)
     ignore(L.build_store (L.param def 1) valPtr build);
     (* load list**, listLoad = list* *)
     let listLoad = L.build_load listPtr "list_load" build in
     (* listArrayPtr = int32** *)
     let listArrayPtr = L.build_struct_gep listLoad 1 "list_array_ptr" build in
     (* listArrayLoad = int32* *)
     let listArrayLoad = L.build_load listArrayPtr "list_array_load" build in
     (* listSizePtr = int* *)
     let listSizePtr = L.build_struct_gep listLoad 0 "list_size" build in 
     (* listSize = int32 *)
     let listSize = L.build_load listSizePtr "list_size" build in
     (* nextIndex = int32 *)
     let nextIndex = listSize in
     (* nextElementPtr = int32** *)
     let nextElementPtr = L.build_gep listArrayLoad [| nextIndex |] "list_arry_next_element_ptr" build in
     let nextSize = L.build_add listSize (L.const_int i32_t 1) "inc_size" build in
     let _ = L.build_store nextSize listSizePtr build in
     let _ = L.build_store (L.build_load valPtr "val" build) nextElementPtr build in
     let _ = L.build_ret_void build in
     StringMap.add defName def m in 
  List.fold_left list_push_ty StringMap.empty [ A.Bool; A.Int; A.Float ] in

  (* ltype list_pop(list) *)
  let list_pop : L.llvalue StringMap.t = 
    let list_pop_ty m typ =
       let ltype = (ltype_of_typ typ) in 
       let defName = (type_str typ) in
       let def = L.define_function ("list_pop" ^ defName) (L.function_type ltype [| L.pointer_type (list_t ltype) |]) the_module in
       let build = L.builder_at_end context (L.entry_block def) in
       let listPtr = L.build_alloca (L.pointer_type (list_t ltype)) "list_ptr_alloc" build in
       ignore(L.build_store (L.param def 0) listPtr build);
       let listLoad = L.build_load listPtr "list_load" build in
       let listArrayPtr = L.build_struct_gep listLoad 1 "list_array_ptr" build in
       let listArrayLoad = L.build_load listArrayPtr "list_array_load" build in
       let listSizePtr = L.build_struct_gep listLoad 0 "list_size_ptr" build in 
       let listSize = L.build_load listSizePtr "list_size" build in
       let listSizeMin1 = L.build_sub listSize (L.const_int i32_t 1) "dec_size" build in
       let lastElementPtr = L.build_gep listArrayLoad [| listSizeMin1 |] "list_arry_next_element_ptr" build in
       let lastElementVal = L.build_load lastElementPtr "list_arry_next_element" build in
       let _ = L.build_store listSizeMin1 listSizePtr build in
       let _ = L.build_ret lastElementVal build in
    StringMap.add defName def m in
  List.fold_left list_pop_ty StringMap.empty [ A.Bool; A.Int; A.Float ] in

  (* int32 list_size(list) *)
  let list_size : L.llvalue StringMap.t = 
    let list_size_ty m typ =
     let ltype = (ltype_of_typ typ) in 
     let defName = (type_str typ) in
     let def = L.define_function ("list_size" ^ defName) (L.function_type i32_t [| L.pointer_type (list_t ltype) |]) the_module in
     let build = L.builder_at_end context (L.entry_block def) in
     let listPtr = L.build_alloca (L.pointer_type (list_t ltype)) "list_ptr_alloc" build in
     ignore(L.build_store (L.param def 0) listPtr build);
     let listLoad = L.build_load listPtr "list_load" build in
     let listSizePtr = L.build_struct_gep listLoad 0 "list_size" build in 
     let listSize = L.build_load listSizePtr "list_size" build in
     ignore(L.build_ret listSize build);
     StringMap.add defName def m in 
  List.fold_left list_size_ty StringMap.empty [ A.Bool; A.Int; A.Float ] in

  let init_list builder list_ptr list_type = 
    (* initialize size to 0 *)
    let sizePtr = L.build_struct_gep list_ptr 0 "list.size" builder in 
       ignore(L.build_store (L.const_int i32_t 0) sizePtr builder);
    (* initialize array *)
    let listArrayPtr = L.build_struct_gep list_ptr 1 "list.arry" builder in 
     (* TODO: allocate nothing and have list grow dynamically *)
      let p = L.build_array_alloca (ltype_of_typ list_type) (L.const_int i32_t 1000) "p" builder in
      ignore(L.build_store p listArrayPtr builder);
  in

  let list_slice : L.llvalue StringMap.t = 
     let list_slice_ty m typ = 
        let ltype = (ltype_of_typ typ) in 
        let defName = (type_str typ) in
        let def = L.define_function ("list_slice" ^ defName) (L.function_type void_t [| ptr_list_t ltype; ptr_list_t ltype; i32_t; i32_t |]) the_module in
        let build = L.builder_at_end context (L.entry_block def) in
 
        let listPtrPtr = L.build_alloca (ptr_list_t ltype) "list_ptr_alloc" build in
        let _ = L.build_store (L.param def 0) listPtrPtr build in
        let listPtr = L.build_load listPtrPtr "list_ptr_ptr" build in

        let listPtrPtr2 = L.build_alloca (ptr_list_t ltype) "list_ptr_alloc2" build in
        let _ = L.build_store (L.param def 1) listPtrPtr2 build in
        let listPtr2 = L.build_load listPtrPtr2 "list_ptr_ptr2" build in

        let idxPtr1 = L.build_alloca i32_t "idx_alloc" build in
        let _ = L.build_store (L.param def 2) idxPtr1 build in
        let idx1 = L.build_load idxPtr1 "idx_load" build in
 
        let idxPtr2 = L.build_alloca i32_t "idx_alloc" build in
        let _ = L.build_store (L.param def 3) idxPtr2 build in 
        let idx2 = L.build_load idxPtr2 "idx_load" build in
 
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
           let toIndex = L.build_load loop_cnt_ptr "to_idx" _builder in
           let fromIndex = L.build_add toIndex idx1 "from_idx" _builder in
           let get_val = L.build_call (StringMap.find (type_str typ) list_get) [| listPtr; fromIndex |] "list_get" _builder in
           let _ = L.build_call (StringMap.find (type_str typ) list_set) [| listPtr2; toIndex;  get_val |] "" _builder in
           let indexIncr = L.build_add (L.build_load loop_cnt_ptr "loop_cnt" _builder) (L.const_int i32_t 1) "loop_itr" _builder in
           let _ = L.build_store indexIncr loop_cnt_ptr _builder in 
           _builder
        in
        let while_builder = build_while build loop_cond loop_body def in
        ignore(L.build_ret_void while_builder);
        StringMap.add defName def m
     in 
     List.fold_left list_slice_ty StringMap.empty [ A.Bool; A.Int; A.Float ] in

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
      | SFLiteral l -> L.const_float_of_string float_t l
      | SSLiteral s -> L.build_global_stringptr (s^"\x00") "strptr" builder
      | SNoexpr     -> L.const_int i32_t 0
      | SId s       -> L.build_load (lookup s) s builder
      | SAssign (s, e) -> let e' = expr builder e in
                          ignore(L.build_store e' (lookup s) builder); e'
      | SBinop ((A.Float,_ ) as e1, op, e2) ->
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
    | A.And | A.Or ->
        raise (Failure "internal error: semant should have rejected and/or on float")
    ) e1' e2' "tmp" builder
      | SBinop (e1, op, e2) ->
    let e1' = expr builder e1
    and e2' = expr builder e2 in
    (match op with
      A.Add     -> L.build_add
    | A.Sub     -> L.build_sub
    | A.Mult    -> L.build_mul
    | A.Div     -> L.build_sdiv
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
        let newVal = (L.build_add e' (L.const_int i32_t 1)) "tmp" builder in
        let id = match (e'') with 
          SId s -> s
          | _ -> raise (Failure ("PlusPlus can only be applied to an Id type")) in
        let varPtr = (lookup id) in
        let _ = L.build_store newVal varPtr builder in newVal
      | A.MinusMinusPre ->
        let newVal = (L.build_sub e' (L.const_int i32_t 1)) "tmp" builder in
        let id = match (e'') with 
          SId s -> s
          | _ -> raise (Failure ("PlusPlus can only be applied to an Id type")) in
        let varPtr = (lookup id) in
        let _ = L.build_store newVal varPtr builder in newVal
      | A.PlusPlusPost -> 
        let newVal = (L.build_add e' (L.const_int i32_t 1)) "tmp" builder in
        let id = match (e'') with 
          SId s -> s
          | _ -> raise (Failure ("PlusPlus can only be applied to an Id type")) in
        let varPtr = (lookup id) in
        let _ = L.build_store newVal varPtr builder in e'
      | A.MinusMinusPost ->
        let newVal = (L.build_sub e' (L.const_int i32_t 1)) "tmp" builder in
        let id = match (e'') with 
          SId s -> s
          | _ -> raise (Failure ("PlusPlus can only be applied to an Id type")) in
        let varPtr = (lookup id) in
        let _ = L.build_store newVal varPtr builder in e')

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
       let _ = L.build_call ((StringMap.find (type_str list_type)) list_slice) [| (lookup id); new_list_ptr; (expr builder e1); (expr builder e2) |] "" builder in
       (L.build_load new_list_ptr "new_list" builder);
    | SCall ("prints", [e]) ->
      L.build_call printf_func [| str_format_str ; (expr builder e) |] 
      "printf" builder
    | SCall ("printi", [e]) ->
      L.build_call printf_func [| int_format_str ; (expr builder e) |] 
      "printf" builder
    | SCall ("printb", [e]) ->
      L.build_call printf_func [| int_format_str; (expr builder e) |]
      "printf" builder
    | SCall ("printf", [e]) ->
      L.build_call printf_func [| float_format_str ; (expr builder e) |] 
      "printf" builder
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