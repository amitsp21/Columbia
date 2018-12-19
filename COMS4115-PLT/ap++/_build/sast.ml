(* Semantic Abstract Syntax Tree (SAST) Definitions for AP++ compiler *)

open Ast

type sexpr = typ * sx
and sx = 
    SILiteral of int
  | SBLiteral of bool
  | SSLiteral of string
  | SFLiteral of float
  | SId of string
  | SBinop of sexpr * op * sexpr
  | SUnop of uop * sexpr
  | SAssign of string * sexpr
  | SCall of string * sexpr list
  | SListGet of typ * string * sexpr
  | SListPop of typ * string
  | SListSize of typ * string
  | SListSlice of typ * string * sexpr * sexpr
  | SListFind of typ * string * sexpr
  | SListLiteral of typ * sexpr list
  | SNoexpr

type sstmt =
  SBlock of sstmt list
| SExpr of sexpr
| SReturn of sexpr
| SIf of sexpr * sstmt * sstmt
| SFor of sexpr * sexpr * sexpr * sstmt
| SWhile of sexpr * sstmt
| SListPush of string * sexpr
| SListSet of typ * string * sexpr * sexpr
| SListClear of typ * string
| SListRemove of string * sexpr
| SListInsert of string * sexpr * sexpr
| SListReverse of typ * string

type sfunc_decl = {
    styp : typ;
    sfname : string;
    sformals : bind list;
    slocals : bind list;
    sbody : sstmt list;
  }

type sprogram = bind list * sfunc_decl list


(* Pretty-printing functions *)

let rec string_of_sexpr (t, e) =
  "(" ^ string_of_typ t ^ " : " ^ (match e with
    SILiteral(l) -> string_of_int l
  | SFLiteral(l) -> string_of_float l
  | SBLiteral(true) -> "true"
  | SBLiteral(false) -> "false"
  | SSLiteral(l) -> l
  | SListGet(_, id, e) -> "list_get " ^ id ^ ", " ^ (string_of_sexpr e)
  | SListPop (_, id) -> "list_pop " ^ id
  | SListSize(_, id) -> "list_size " ^ id
  | SListSlice(_, id, e1, e2) -> "list_slice " ^ id ^ ", " ^ (string_of_sexpr e1) ^ ", " ^ (string_of_sexpr e2)
  | SListFind(_, id, e) -> "list_find " ^ id ^ ", " ^ (string_of_sexpr e)
  | SListLiteral(_) -> "list_literal"
  | SId(s) -> s
  | SBinop(e1, o, e2) ->
      string_of_sexpr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_sexpr e2
  | SUnop(o, e) -> string_of_uop o ^ string_of_sexpr e
  | SAssign(v, e) -> v ^ " = " ^ string_of_sexpr e
  | SCall(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_sexpr el) ^ ")"
  | SNoexpr -> ""
          ) ^ ")"            

let rec string_of_sstmt = function
    SBlock(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_sstmt stmts) ^ "}\n"
  | SExpr(expr) -> string_of_sexpr expr ^ ";\n";
  | SReturn(expr) -> "return " ^ string_of_sexpr expr ^ ";\n";
  | SIf(e, s, SBlock([])) ->
      "if (" ^ string_of_sexpr e ^ ")\n" ^ string_of_sstmt s
  | SIf(e, s1, s2) ->  "if (" ^ string_of_sexpr e ^ ")\n" ^
      string_of_sstmt s1 ^ "else\n" ^ string_of_sstmt s2
  | SFor(e1, e2, e3, s) ->
      "for (" ^ string_of_sexpr e1  ^ " ; " ^ string_of_sexpr e2 ^ " ; " ^
      string_of_sexpr e3  ^ ") " ^ string_of_sstmt s
  | SWhile(e, s) -> "while (" ^ string_of_sexpr e ^ ") " ^ string_of_sstmt s
  | SListPush(id, e) -> "list_push " ^ id ^ ", " ^ string_of_sexpr e
  | SListSet(_, id, e1, e2) -> "list_set " ^ id ^ ", " ^ (string_of_sexpr e1) ^ ", " ^ (string_of_sexpr e2)
  | SListClear(_, id) -> "list_clear " ^ id
  | SListRemove(id, e) -> "list remove " ^ id ^ ", " ^ (string_of_sexpr e)
  | SListInsert(id, e1, e2) -> "list_insert " ^ id ^ ", " ^ (string_of_sexpr e1) ^ ", " ^ (string_of_sexpr e2)
  | SListReverse(_, id) -> "list_rev " ^ id

let string_of_sfdecl fdecl =
  string_of_typ fdecl.styp ^ " " ^
  fdecl.sfname ^ "(" ^ String.concat ", " (List.map snd fdecl.sformals) ^
  ")\n{\n" ^
  String.concat "" (List.map string_of_vdecl fdecl.slocals) ^
  String.concat "" (List.map string_of_sstmt fdecl.sbody) ^
  "}\n"

let string_of_sprogram (vars, funcs) =
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_sfdecl funcs)
