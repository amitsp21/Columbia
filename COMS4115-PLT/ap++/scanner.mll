(* Scanner for AP++ compiler *)

{ open Parser }

let digit = ['0' - '9']
let digits = digit+
let esc_regex = '\\' ['\\' ''' '"' 'n' 'r' 't']
let ascii_regex = ([' '-'!' '#'-'[' ']'-'~'])

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/*"    { comment lexbuf }            (* Multi-line Comment *)
| "//" { line_comment lexbuf }			(* Single-line Comment *)
| '('     { LPAREN }
| ')'     { RPAREN }
| '{'     { LBRACE }
| '}'     { RBRACE }
| '['     { LBRACK }
| ']'     { RBRACK }
| ':'     { COLON }
| ';'     { SEMICOLON }
| ','	  { COMMA }
| "++"    { PLUSPLUS }
| "--"    { MINUSMINUS }
| '+'     { PLUS }
| '-'     { MINUS }
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
| "while" { WHILE }
| "for"   { FOR }
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
| "list_slice" { LIST_SLICE }
| "list_clear" { LIST_CLEAR }
| "list_rev" { LIST_REVERSE }
| "list_insert" { LIST_INSERT }
| "list_remove" { LIST_REMOVE }
| "list_find" { LIST_FIND }
| "list" { LIST }
| digits as lit { ILITERAL(int_of_string lit) }
| "true"	{ BLITERAL(true) }
| "false"	{ BLITERAL(false) }
| digits '.'  digit* ( ['e' 'E'] ['+' '-']? digits )? as lit { FLITERAL(float_of_string lit) }
| '"' ((ascii_regex | esc_regex)* as lit)'"' { SLITERAL(lit) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as id_name { ID(id_name) }
| eof     { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and line_comment = parse
 '\n' { token lexbuf }
 | _ { line_comment lexbuf }

and comment = parse
  "*/"    { token lexbuf }
| _       { comment lexbuf }
