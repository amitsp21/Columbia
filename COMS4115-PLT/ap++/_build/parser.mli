type token =
  | COLON
  | COMMA
  | SEMICOLON
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | LBRACK
  | RBRACK
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | ASSIGN
  | MOD
  | PLUSPLUS
  | MINUSMINUS
  | NOT
  | AND
  | OR
  | EQ
  | NEQ
  | LT
  | LEQ
  | GT
  | GEQ
  | RETURN
  | IF
  | ELSE
  | ELSEIF
  | WHILE
  | FOR
  | INT
  | BOOL
  | FLOAT
  | STRING
  | VOID
  | LIST_PUSH
  | LIST_GET
  | LIST_SET
  | LIST_POP
  | LIST_SIZE
  | HASH
  | LIST_SLICE
  | ILITERAL of (int)
  | BLITERAL of (bool)
  | SLITERAL of (string)
  | FLITERAL of (string)
  | ID of (string)
  | LIST
  | EOF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
