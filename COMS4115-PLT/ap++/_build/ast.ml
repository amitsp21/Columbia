type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq
          | And | Or 

type uop = PlusPlusPre | PlusPlusPost | MinusMinusPre | MinusMinusPost | Neg | Not

type typ = Int | Bool | Float | String | Void | List of typ

type bind = typ * string

type expr =
    ILiteral of int
  | BLiteral of bool
  | SLiteral of string
  | FLiteral of string
  | Id of string
  | Binop of expr * op * expr
  | Unop of uop * expr
  | Assign of string * expr
  | Call of string * expr list
  | ListGet of string * expr
  | ListPop of string
  | ListSize of string
  | ListSlice of string * expr * expr
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

type func_decl = {
    typ : typ;
    fname : string;
    formals : bind list;
    locals : bind list;
    body : stmt list;
  }

type program = bind list * func_decl list