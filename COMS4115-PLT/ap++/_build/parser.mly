/* Ocamlyacc Parser for AP++ compiler */

%{
open Ast
%}

%token COLON COMMA SEMICOLON LPAREN RPAREN LBRACE RBRACE LBRACK RBRACK
%token PLUS MINUS TIMES DIVIDE ASSIGN MOD
%token PLUSPLUS MINUSMINUS
%token NOT AND OR
%token EQ NEQ LT LEQ GT GEQ
%token RETURN IF ELSE WHILE FOR INT BOOL FLOAT STRING VOID
%token LIST_PUSH LIST_GET LIST_SET LIST_POP LIST_SIZE HASH LIST_SLICE LIST_CLEAR LIST_REVERSE LIST_INSERT LIST_REMOVE LIST_FIND 
%token <int> ILITERAL
%token <bool> BLITERAL
%token <string> SLITERAL
%token <float> FLITERAL
%token <string> ID
%token LIST
%token EOF

%start program
%type <Ast.program> program

%nonassoc NOELSE
%nonassoc ELSEIF
%nonassoc ELSE
%right ASSIGN
%left OR
%left AND
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE MOD
%right NOT PLUSPLUS MINUSMINUS

%%

program: 
  decls EOF { $1 }

decls:
  /* nothing */   { ([], [])}
| decls var_decl  { (($2 :: fst $1), snd $1) }
| decls func_decl { (fst $1, ($2 :: snd $1)) }

/* e.g. int foo(int x, int y) {} */
func_decl:
  typ ID LPAREN func_formals_opt RPAREN LBRACE var_decl_list stmt_list RBRACE 
  { { typ     = $1;
      fname   = $2;
      formals = List.rev $4;
      locals  = List.rev $7;
      body    = List.rev $8 } }

func_formals_opt:
   /* nothing */    { [] }
|  func_formals_list { $1 }

/* int x, bool y */
func_formals_list:
  typ ID                         { [($1, $2)] }
| func_formals_list COMMA typ ID { ($3, $4) :: $1 }

typ:
  INT             { Int }
| BOOL            { Bool }
| FLOAT           { Float }
| STRING          { String }
| VOID            { Void }
| LIST LT typ GT  { List($3) }

/* e.g. int x; int y; */
var_decl_list:
  /* nothing */ { [] }
|  var_decl_list var_decl { $2 :: $1 }

/* e.g. int x; */
var_decl:
  typ ID SEMICOLON { ($1, $2) }

stmt_list:
  /* nothing */  { [] }
| stmt_list stmt { $2 :: $1 }

/* executes code logic but do not evaluate to any value */
stmt:
  expr SEMICOLON                            { Expr $1 }
| RETURN expr_opt SEMICOLON                 { Return $2 }
| LBRACE stmt_list RBRACE                   { Block(List.rev $2) }
| IF LPAREN expr RPAREN stmt %prec NOELSE   { If($3, $5, Block([])) }
| IF LPAREN expr RPAREN stmt ELSE stmt      { If($3, $5, $7) }
| FOR LPAREN expr_opt SEMICOLON expr SEMICOLON expr_opt RPAREN stmt
                                            { For($3, $5, $7, $9) }
| WHILE LPAREN expr RPAREN stmt             { While($3, $5) }
| LIST_PUSH LPAREN ID COMMA expr RPAREN SEMICOLON { ListPush($3, $5) }
| LIST_SET LPAREN ID COMMA expr COMMA expr RPAREN SEMICOLON { ListSet($3, $5, $7) }
| ID LBRACK expr RBRACK ASSIGN expr SEMICOLON         { ListSet($1, $3, $6) }
| LIST_CLEAR LPAREN ID RPAREN SEMICOLON     { ListClear($3) }
| LIST_REMOVE LPAREN ID COMMA expr RPAREN SEMICOLON { ListRemove($3, $5) }  
| LIST_INSERT LPAREN ID COMMA expr COMMA expr RPAREN SEMICOLON { ListInsert($3, $5, $7) }
| LIST_REVERSE LPAREN ID RPAREN SEMICOLON       { ListReverse($3) }

expr_opt:
  /* nothing */ { Noexpr }
| expr          { $1 }

/* executes code logic and evaluates to a value */
expr:
  ILITERAL                                { ILiteral($1) }
| BLITERAL                                { BLiteral($1) }
| SLITERAL                                { SLiteral($1) }
| FLITERAL                                { FLiteral($1) }
| ID                                      { Id($1) }
| expr PLUS   expr                        { Binop($1, Add, $3) }
| expr MINUS  expr                        { Binop($1, Sub, $3) }
| expr TIMES  expr                        { Binop($1, Mult, $3) }
| expr DIVIDE expr                        { Binop($1, Div, $3) }
| expr MOD expr                           { Binop($1, Mod, $3) }
| PLUSPLUS ID                             { Unop(PlusPlusPre, Id($2)) }
| MINUSMINUS ID                           { Unop(MinusMinusPre, Id($2)) }
| ID PLUSPLUS                             { Unop(PlusPlusPost, Id($1)) }
| ID MINUSMINUS                           { Unop(MinusMinusPost, Id($1)) }
| expr EQ expr                            { Binop($1, Equal, $3) }
| expr NEQ expr                           { Binop($1, Neq, $3) }
| expr LT expr                            { Binop($1, Less, $3) }
| expr GT expr                            { Binop($1, Greater, $3) }
| expr LEQ expr                           { Binop($1, Leq, $3) }
| expr GEQ expr                           { Binop($1, Geq, $3) }
| MINUS expr %prec NOT                    { Unop(Neg, $2)      }
| NOT expr                                { Unop(Not, $2) }
| expr AND expr                           { Binop($1, And, $3) }
| expr OR expr                            { Binop($1, Or, $3) }
| LPAREN expr RPAREN                      { $2 }
| ID ASSIGN expr                          { Assign($1, $3) }
| ID LPAREN args_opt RPAREN		            { Call($1, $3) }
| LIST_GET LPAREN ID COMMA expr RPAREN    { ListGet($3, $5) }
| ID LBRACK expr RBRACK                   { ListGet($1, $3) }
| LIST_POP LPAREN ID RPAREN               { ListPop($3) }
| LIST_SIZE LPAREN ID RPAREN              { ListSize($3) }
| HASH ID                                 { ListSize($2) }
| LIST_SLICE LPAREN ID COMMA expr COMMA expr RPAREN { ListSlice($3, $5, $7) }
| ID LBRACK expr_opt COLON expr_opt RBRACK        { ListSlice($1, $3, $5) }
| LIST_FIND LPAREN ID COMMA expr RPAREN   { ListFind($3, $5) }
| LBRACK args_opt RBRACK                  { ListLiteral($2) }

args_opt:
    /* nothing */ { [] }
  | args_list  { List.rev $1 }

/* args used for function calls */
args_list:
    expr                    { [$1] }
  | args_list COMMA expr { $3 :: $1 }

