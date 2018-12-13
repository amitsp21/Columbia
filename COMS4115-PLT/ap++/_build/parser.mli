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
  | INT
  | BOOL
  | FLOAT
  | STRING
  | VOID
  | BREAK
  | CONTINUE
  | LIST_PUSH
  | LIST_GET
  | LIST_POP
  | LIST_SIZE
  | ILITERAL of (int)
  | BLITERAL of (bool)
  | SLITERAL of (string)
  | FLITERAL of (string)
  | ID of (string)
  | LIST
  | EOF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
