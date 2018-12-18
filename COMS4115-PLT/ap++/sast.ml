open Ast

type sexpr = typ * sx
and sx = 
    SILiteral of int
  | SBLiteral of bool
  | SSLiteral of string
  | SFLiteral of string
  | SId of string
  | SBinop of sexpr * op * sexpr
  | SUnop of uop * sexpr
  | SAssign of string * sexpr
  | SCall of string * sexpr list
  | SListGet of typ * string * sexpr
  | SListPop of typ * string
  | SListSize of typ * string
  | SListSlice of string * sexpr * sexpr
  | SNoexpr

type sstmt =
  SBlock of sstmt list
| SExpr of sexpr
| SReturn of sexpr
| SContinue
| SBreak
| SIf of sexpr * sstmt * sstmt
| SFor of sexpr * sexpr * sexpr * sstmt
| SWhile of sexpr * sstmt
| SListPush of string * sexpr
| SListSet of typ * string * sexpr * sexpr

type sfunc_decl = {
    styp : typ;
    sfname : string;
    sformals : bind list;
    slocals : bind list;
    sbody : sstmt list;
  }

type sprogram = bind list * sfunc_decl list