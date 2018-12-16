{ open Parser }

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/*"    { comment lexbuf }            (* Comments *)
| '('     { LPAREN }
| ')'     { RPAREN }
| '{'     { LBRACE }
| '}'     { RBRACE }
| '['     { LBRACK }
| ']'     { RBRACK }
| ':'     { COLON }
| ';'     { SEMICOLON }
| ','	  { COMMA }
| '+'     { PLUS }
| "++"    { PLUSPLUS }
| '-'     { MINUS }
| "--"    { MINUSMINUS }
| '*'     { TIMES }
| '/'     { DIVIDE }
| '%'	  { MOD }
| '='     { ASSIGN }
| "=="    { EQ }
| "!="    { NEQ }
| "&&"    { AND }
| "||"    { OR }
| '!'     { NOT }
| "<="    { LEQ }
| ">="    { GEQ }
| "if"    { IF }
| "else"  { ELSE }
| "elseif" { ELSEIF }
| "while" { WHILE }
| "break" { BREAK }
| "continue" { CONTINUE }
| "return" { RETURN }
| "int"   { INT }
| "bool"  { BOOL }
| "float" { FLOAT }
| "void"  { VOID }
| "<"     { LT }
| ">"	  { GT }
| "#"     { HASH }
| "list_push" { LIST_PUSH }
| "list_get" { LIST_GET }
| "list_set" { LIST_SET }
| "list_pop" { LIST_POP }
| "list_size" { LIST_SIZE }
| "list" { LIST }
| ['0'-'9']+ as lit { ILITERAL(int_of_string lit) }
| "true"	{ BLITERAL(true) }
| "false"	{ BLITERAL(false) }
| ['0'-'9']+('.')['0'-'9']*(['e' 'E']['+' '-']?['0'-'9']+)? as lit { FLITERAL(lit) }
| '"'(_+ as lit)'"' { SLITERAL(lit) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as id_name { ID(id_name) }
| eof     { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/"    { token lexbuf }
| _       { comment lexbuf }

