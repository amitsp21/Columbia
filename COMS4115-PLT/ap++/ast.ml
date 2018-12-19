(* Abstract Syntax Tree (AST) Definitions for AP++ compiler *)

type op = Add | Sub | Mult | Div | Mod | Equal | Neq | Less | Leq | Greater | Geq
          | And | Or

type uop = PlusPlusPre | PlusPlusPost | MinusMinusPre | MinusMinusPost | Neg | Not

type typ = Int | Bool | Float | String | Void | List of typ

type bind = typ * string

type expr =
    ILiteral of int
  | BLiteral of bool
  | SLiteral of string
  | FLiteral of float
  | Id of string
  | Binop of expr * op * expr
  | Unop of uop * expr
  | Assign of string * expr
  | Call of string * expr list
  | ListGet of string * expr
  | ListPop of string
  | ListSize of string
  | ListSlice of string * expr * expr
  | ListFind of string * expr
  | ListLiteral of expr list
  | Noexpr

type stmt =
  Block of stmt list
| Expr of expr
| Return of expr
| If of expr * stmt * stmt
| For of expr * expr * expr * stmt
| While of expr * stmt
| ListPush of string * expr
| ListSet of string * expr * expr
| ListClear of string
| ListRemove of string * expr
| ListInsert of string * expr * expr
| ListReverse of string

type func_decl = {
    typ : typ;
    fname : string;
    formals : bind list;
    locals : bind list;
    body : stmt list;
  }

type program = bind list * func_decl list

(* Pretty-printing functions *)

let string_of_op = function
    Add -> "+"
  | Sub -> "-"
  | Mult -> "*"
  | Div -> "/"
  | Equal -> "=="
  | Neq -> "!="
  | Less -> "<"
  | Leq -> "<="
  | Greater -> ">"
  | Geq -> ">="
  | And -> "&&"
  | Or -> "||"
  | _ -> "?"

let string_of_uop = function
    Neg -> "-"
  | Not -> "!"
  | PlusPlusPre -> "++x" 
  | PlusPlusPost -> "x++" 
  | MinusMinusPre -> "--x" 
  | MinusMinusPost -> "x++"

let rec string_of_expr = function
    ILiteral(l) -> string_of_int l
  | FLiteral(l) -> string_of_float l
  | BLiteral(true) -> "true"
  | BLiteral(false) -> "false"
  | SLiteral(l) -> l
  | ListGet(id, e) -> "list_get " ^ id ^ ", " ^ (string_of_expr e)
  | ListPop (id) -> "list_pop " ^ id
  | ListSize(id) -> "list_size " ^ id
  | ListSlice(id, e1, e2) -> "list_slice " ^ id ^ ", " ^ (string_of_expr e1) ^ ", " ^ (string_of_expr e2)
  | ListFind(id, e) -> "list_find " ^ id ^ ", " ^ (string_of_expr e)
  | ListLiteral(_) -> "list_literal"
  | Id(s) -> s
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Unop(o, e) -> string_of_uop o ^ string_of_expr e
  | Assign(v, e) -> v ^ " = " ^ string_of_expr e
  | Call(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Noexpr -> ""

let rec string_of_stmt = function
    Block(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_stmt stmts) ^ "}\n"
  | Expr(expr) -> string_of_expr expr ^ ";\n";
  | Return(expr) -> "return " ^ string_of_expr expr ^ ";\n";
  | If(e, s, Block([])) -> "if (" ^ string_of_expr e ^ ")\n" ^ string_of_stmt s
  | If(e, s1, s2) ->  "if (" ^ string_of_expr e ^ ")\n" ^
      string_of_stmt s1 ^ "else\n" ^ string_of_stmt s2
  | For(e1, e2, e3, s) ->
      "for (" ^ string_of_expr e1  ^ " ; " ^ string_of_expr e2 ^ " ; " ^
      string_of_expr e3  ^ ") " ^ string_of_stmt s
  | While(e, s) -> "while (" ^ string_of_expr e ^ ") " ^ string_of_stmt s
  | ListPush(id, e) -> "list_push " ^ id ^ ", " ^ string_of_expr e
  | ListSet(id, e1, e2) -> "list_set " ^ id ^ ", " ^ (string_of_expr e1) ^ ", " ^ (string_of_expr e2)
  | ListClear(id) -> "list_clear " ^ id
  | ListRemove(id, e) -> "list remove " ^ id ^ ", " ^ (string_of_expr e)
  | ListInsert(id, e1, e2) -> "list_insert " ^ id ^ ", " ^ (string_of_expr e1) ^ ", " ^ (string_of_expr e2)
  | ListReverse(id) -> "list_rev " ^ id

let rec string_of_typ = function
    Int -> "int"
  | Bool -> "bool"
  | Float -> "float"
  | Void -> "void"
  | String -> "string"
  | List x -> "list<" ^ (string_of_typ x) ^ ">"

let string_of_vdecl (t, id) = string_of_typ t ^ " " ^ id ^ ";\n"

let string_of_fdecl fdecl =
  string_of_typ fdecl.typ ^ " " ^
  fdecl.fname ^ "(" ^ String.concat ", " (List.map snd fdecl.formals) ^
  ")\n{\n" ^
  String.concat "" (List.map string_of_vdecl fdecl.locals) ^
  String.concat "" (List.map string_of_stmt fdecl.body) ^
  "}\n"

let string_of_program (vars, funcs) =
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_fdecl funcs)