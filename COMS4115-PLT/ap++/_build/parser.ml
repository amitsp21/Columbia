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
  | LIST_SET
  | LIST_POP
  | LIST_SIZE
  | HASH
  | ILITERAL of (int)
  | BLITERAL of (bool)
  | SLITERAL of (string)
  | FLITERAL of (string)
  | ID of (string)
  | LIST
  | EOF

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
open Ast
# 59 "parser.ml"
let yytransl_const = [|
  257 (* COLON *);
  258 (* COMMA *);
  259 (* SEMICOLON *);
  260 (* LPAREN *);
  261 (* RPAREN *);
  262 (* LBRACE *);
  263 (* RBRACE *);
  264 (* LBRACK *);
  265 (* RBRACK *);
  266 (* PLUS *);
  267 (* MINUS *);
  268 (* TIMES *);
  269 (* DIVIDE *);
  270 (* ASSIGN *);
  271 (* MOD *);
  272 (* PLUSPLUS *);
  273 (* MINUSMINUS *);
  274 (* NOT *);
  275 (* AND *);
  276 (* OR *);
  277 (* EQ *);
  278 (* NEQ *);
  279 (* LT *);
  280 (* LEQ *);
  281 (* GT *);
  282 (* GEQ *);
  283 (* RETURN *);
  284 (* IF *);
  285 (* ELSE *);
  286 (* ELSEIF *);
  287 (* WHILE *);
  288 (* INT *);
  289 (* BOOL *);
  290 (* FLOAT *);
  291 (* STRING *);
  292 (* VOID *);
  293 (* BREAK *);
  294 (* CONTINUE *);
  295 (* LIST_PUSH *);
  296 (* LIST_GET *);
  297 (* LIST_SET *);
  298 (* LIST_POP *);
  299 (* LIST_SIZE *);
  300 (* HASH *);
  306 (* LIST *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  301 (* ILITERAL *);
  302 (* BLITERAL *);
  303 (* SLITERAL *);
  304 (* FLITERAL *);
  305 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\005\000\005\000\005\000\005\000\
\005\000\005\000\006\000\006\000\003\000\004\000\007\000\007\000\
\009\000\009\000\008\000\008\000\011\000\011\000\013\000\013\000\
\014\000\014\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\002\000\001\000\001\000\001\000\001\000\
\001\000\004\000\000\000\002\000\003\000\009\000\000\000\001\000\
\002\000\004\000\000\000\002\000\000\000\001\000\000\000\001\000\
\001\000\003\000\002\000\003\000\002\000\002\000\003\000\005\000\
\007\000\005\000\007\000\009\000\007\000\001\000\001\000\001\000\
\001\000\001\000\003\000\003\000\003\000\003\000\003\000\002\000\
\002\000\003\000\003\000\003\000\003\000\003\000\003\000\002\000\
\003\000\003\000\003\000\006\000\003\000\004\000\006\000\004\000\
\004\000\004\000\002\000\002\000"

let yydefred = "\000\000\
\002\000\000\000\068\000\000\000\005\000\006\000\007\000\008\000\
\009\000\000\000\001\000\003\000\004\000\000\000\000\000\000\000\
\000\000\013\000\000\000\010\000\000\000\000\000\000\000\017\000\
\000\000\000\000\011\000\000\000\000\000\018\000\012\000\000\000\
\000\000\000\000\000\000\019\000\014\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\038\000\039\000\040\000\041\000\000\000\
\020\000\000\000\000\000\000\000\000\000\048\000\049\000\056\000\
\000\000\000\000\000\000\000\000\029\000\030\000\000\000\000\000\
\000\000\000\000\000\000\067\000\000\000\000\000\000\000\027\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\059\000\031\000\
\028\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\045\000\046\000\047\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\065\000\066\000\062\000\000\000\000\000\000\000\064\000\
\000\000\034\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\063\000\000\000\060\000\000\000\033\000\035\000\
\000\000\037\000\000\000\036\000"

let yydgoto = "\002\000\
\003\000\004\000\012\000\013\000\014\000\029\000\022\000\033\000\
\023\000\057\000\108\000\058\000\106\000\107\000"

let yysindex = "\009\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\000\000\250\254\000\000\000\000\000\000\236\254\047\255\037\255\
\009\255\000\000\047\255\000\000\012\255\070\255\074\255\000\000\
\079\255\047\255\000\000\058\255\047\255\000\000\000\000\086\255\
\084\255\083\255\020\255\000\000\000\000\095\255\096\255\020\255\
\020\255\092\255\138\255\152\255\156\255\161\255\177\255\180\255\
\181\255\182\255\111\255\000\000\000\000\000\000\000\000\031\255\
\000\000\242\000\106\255\080\001\130\255\000\000\000\000\000\000\
\193\255\009\002\020\255\020\255\000\000\000\000\141\255\157\255\
\159\255\160\255\162\255\000\000\020\255\020\255\020\255\000\000\
\020\255\020\255\020\255\020\255\020\255\020\255\020\255\020\255\
\020\255\020\255\020\255\020\255\020\255\020\255\000\000\000\000\
\000\000\102\001\124\001\199\255\203\255\208\255\207\255\225\255\
\009\002\226\255\230\255\232\255\230\001\009\002\151\255\151\255\
\000\000\000\000\000\000\128\255\026\002\093\255\093\255\187\255\
\187\255\187\255\187\255\248\001\022\000\022\000\020\255\020\255\
\020\255\000\000\000\000\000\000\020\255\020\255\213\255\000\000\
\205\255\000\000\146\001\168\001\218\000\009\002\227\255\020\255\
\022\000\234\255\000\000\020\255\000\000\010\001\000\000\000\000\
\190\001\000\000\238\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\237\255\000\000\000\000\000\000\239\255\000\000\
\000\000\000\000\000\000\000\000\176\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\240\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\034\001\
\000\000\000\000\071\000\000\000\000\000\000\000\000\000\000\000\
\000\000\153\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\241\255\244\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\244\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\016\255\000\000\242\255\000\000\247\255\186\255\097\000\123\000\
\000\000\000\000\000\000\011\255\069\255\006\255\216\001\149\000\
\158\000\184\000\193\000\247\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\243\255\058\001\000\000\
\222\255\000\000\000\000\000\000\000\000\017\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\206\000\000\000\058\000\000\000\000\000\215\000\
\000\000\134\255\217\255\221\255\000\000\000\000"

let yytablesize = 820
let yytable = "\060\000\
\011\000\065\000\137\000\138\000\064\000\066\000\050\000\050\000\
\050\000\001\000\050\000\057\000\057\000\057\000\050\000\057\000\
\015\000\025\000\026\000\057\000\025\000\026\000\151\000\035\000\
\050\000\050\000\050\000\050\000\016\000\057\000\057\000\098\000\
\099\000\020\000\077\000\038\000\039\000\040\000\078\000\018\000\
\019\000\105\000\109\000\110\000\079\000\111\000\112\000\113\000\
\114\000\115\000\116\000\117\000\118\000\119\000\120\000\121\000\
\122\000\123\000\124\000\047\000\024\000\049\000\050\000\051\000\
\052\000\053\000\054\000\055\000\059\000\058\000\058\000\058\000\
\017\000\058\000\025\000\026\000\021\000\058\000\005\000\006\000\
\007\000\008\000\009\000\028\000\027\000\018\000\032\000\035\000\
\058\000\036\000\037\000\139\000\140\000\141\000\143\000\067\000\
\010\000\142\000\066\000\038\000\039\000\040\000\081\000\082\000\
\083\000\084\000\030\000\085\000\150\000\077\000\041\000\042\000\
\153\000\094\000\043\000\090\000\091\000\092\000\093\000\079\000\
\044\000\045\000\046\000\047\000\048\000\049\000\050\000\051\000\
\052\000\053\000\054\000\055\000\056\000\035\000\034\000\036\000\
\096\000\081\000\082\000\083\000\084\000\068\000\085\000\062\000\
\063\000\038\000\039\000\040\000\088\000\089\000\090\000\091\000\
\092\000\093\000\069\000\022\000\041\000\042\000\070\000\076\000\
\043\000\022\000\083\000\084\000\071\000\085\000\044\000\045\000\
\046\000\047\000\048\000\049\000\050\000\051\000\052\000\053\000\
\054\000\055\000\056\000\019\000\072\000\019\000\019\000\073\000\
\074\000\075\000\061\000\061\000\061\000\100\000\061\000\019\000\
\019\000\019\000\061\000\097\000\081\000\082\000\083\000\084\000\
\127\000\085\000\019\000\019\000\128\000\101\000\019\000\102\000\
\103\000\129\000\104\000\130\000\019\000\019\000\019\000\019\000\
\019\000\019\000\019\000\019\000\019\000\019\000\019\000\019\000\
\019\000\032\000\144\000\032\000\032\000\131\000\132\000\133\000\
\134\000\145\000\031\000\149\000\152\000\032\000\032\000\032\000\
\156\000\015\000\021\000\016\000\021\000\023\000\024\000\022\000\
\032\000\032\000\061\000\021\000\032\000\000\000\000\000\000\000\
\000\000\000\000\032\000\032\000\032\000\032\000\032\000\032\000\
\032\000\032\000\032\000\032\000\032\000\032\000\032\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\035\000\000\000\036\000\000\000\000\000\000\000\000\000\
\005\000\006\000\007\000\008\000\009\000\038\000\039\000\040\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\041\000\042\000\010\000\000\000\043\000\000\000\000\000\000\000\
\000\000\000\000\044\000\045\000\046\000\047\000\048\000\049\000\
\050\000\051\000\052\000\053\000\054\000\055\000\056\000\042\000\
\042\000\042\000\000\000\042\000\000\000\000\000\000\000\042\000\
\042\000\042\000\042\000\042\000\000\000\042\000\000\000\000\000\
\000\000\042\000\042\000\042\000\042\000\042\000\042\000\042\000\
\042\000\043\000\043\000\043\000\000\000\043\000\000\000\000\000\
\000\000\043\000\043\000\043\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\043\000\043\000\043\000\043\000\043\000\
\043\000\043\000\043\000\044\000\044\000\044\000\000\000\044\000\
\000\000\000\000\000\000\044\000\044\000\044\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\044\000\044\000\044\000\
\044\000\044\000\044\000\044\000\044\000\052\000\052\000\052\000\
\000\000\052\000\000\000\000\000\000\000\052\000\054\000\054\000\
\054\000\000\000\054\000\000\000\000\000\000\000\054\000\052\000\
\052\000\052\000\052\000\052\000\052\000\052\000\052\000\000\000\
\054\000\054\000\054\000\054\000\054\000\054\000\054\000\054\000\
\053\000\053\000\053\000\000\000\053\000\000\000\000\000\000\000\
\053\000\055\000\055\000\055\000\000\000\055\000\000\000\000\000\
\000\000\055\000\053\000\053\000\053\000\053\000\053\000\053\000\
\053\000\053\000\000\000\055\000\055\000\055\000\055\000\055\000\
\055\000\055\000\055\000\148\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\081\000\082\000\083\000\084\000\000\000\
\085\000\000\000\000\000\000\000\086\000\087\000\088\000\089\000\
\090\000\091\000\092\000\093\000\080\000\000\000\000\000\000\000\
\000\000\000\000\000\000\081\000\082\000\083\000\084\000\000\000\
\085\000\000\000\000\000\000\000\086\000\087\000\088\000\089\000\
\090\000\091\000\092\000\093\000\154\000\000\000\000\000\000\000\
\000\000\000\000\000\000\081\000\082\000\083\000\084\000\000\000\
\085\000\000\000\000\000\000\000\086\000\087\000\088\000\089\000\
\090\000\091\000\092\000\093\000\042\000\000\000\000\000\000\000\
\000\000\000\000\000\000\042\000\042\000\042\000\042\000\000\000\
\042\000\000\000\000\000\000\000\042\000\042\000\042\000\042\000\
\042\000\042\000\042\000\042\000\064\000\000\000\000\000\000\000\
\000\000\000\000\000\000\064\000\064\000\064\000\064\000\000\000\
\064\000\000\000\000\000\000\000\064\000\064\000\064\000\064\000\
\064\000\064\000\064\000\064\000\095\000\000\000\000\000\000\000\
\000\000\081\000\082\000\083\000\084\000\000\000\085\000\000\000\
\000\000\000\000\086\000\087\000\088\000\089\000\090\000\091\000\
\092\000\093\000\125\000\000\000\000\000\000\000\000\000\081\000\
\082\000\083\000\084\000\000\000\085\000\000\000\000\000\000\000\
\086\000\087\000\088\000\089\000\090\000\091\000\092\000\093\000\
\126\000\000\000\000\000\000\000\000\000\081\000\082\000\083\000\
\084\000\000\000\085\000\000\000\000\000\000\000\086\000\087\000\
\088\000\089\000\090\000\091\000\092\000\093\000\146\000\000\000\
\000\000\000\000\000\000\081\000\082\000\083\000\084\000\000\000\
\085\000\000\000\000\000\000\000\086\000\087\000\088\000\089\000\
\090\000\091\000\092\000\093\000\147\000\000\000\000\000\000\000\
\000\000\081\000\082\000\083\000\084\000\000\000\085\000\000\000\
\000\000\000\000\086\000\087\000\088\000\089\000\090\000\091\000\
\092\000\093\000\155\000\000\000\000\000\000\000\000\000\081\000\
\082\000\083\000\084\000\000\000\085\000\000\000\000\000\000\000\
\086\000\087\000\088\000\089\000\090\000\091\000\092\000\093\000\
\051\000\051\000\051\000\000\000\051\000\000\000\000\000\000\000\
\051\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\051\000\051\000\051\000\051\000\135\000\081\000\
\082\000\083\000\084\000\000\000\085\000\000\000\000\000\000\000\
\086\000\087\000\088\000\089\000\090\000\091\000\092\000\093\000\
\136\000\081\000\082\000\083\000\084\000\000\000\085\000\000\000\
\000\000\000\000\086\000\087\000\088\000\089\000\090\000\091\000\
\092\000\093\000\081\000\082\000\083\000\084\000\000\000\085\000\
\000\000\000\000\000\000\086\000\087\000\088\000\089\000\090\000\
\091\000\092\000\093\000\081\000\082\000\083\000\084\000\000\000\
\085\000\000\000\000\000\000\000\086\000\000\000\088\000\089\000\
\090\000\091\000\092\000\093\000"

let yycheck = "\035\000\
\000\000\041\000\125\000\126\000\040\000\041\000\001\001\002\001\
\003\001\001\000\005\001\001\001\002\001\003\001\009\001\005\001\
\023\001\002\001\002\001\009\001\005\001\005\001\145\000\004\001\
\019\001\020\001\021\001\022\001\049\001\019\001\020\001\067\000\
\068\000\025\001\004\001\016\001\017\001\018\001\008\001\003\001\
\004\001\077\000\078\000\079\000\014\001\081\000\082\000\083\000\
\084\000\085\000\086\000\087\000\088\000\089\000\090\000\091\000\
\092\000\093\000\094\000\040\001\049\001\042\001\043\001\044\001\
\045\001\046\001\047\001\048\001\049\001\001\001\002\001\003\001\
\015\000\005\001\005\001\002\001\019\000\009\001\032\001\033\001\
\034\001\035\001\036\001\026\000\006\001\003\001\029\000\004\001\
\020\001\006\001\007\001\127\000\128\000\129\000\134\000\004\001\
\050\001\133\000\134\000\016\001\017\001\018\001\010\001\011\001\
\012\001\013\001\049\001\015\001\144\000\004\001\027\001\028\001\
\148\000\008\001\031\001\023\001\024\001\025\001\026\001\014\001\
\037\001\038\001\039\001\040\001\041\001\042\001\043\001\044\001\
\045\001\046\001\047\001\048\001\049\001\004\001\049\001\006\001\
\007\001\010\001\011\001\012\001\013\001\004\001\015\001\049\001\
\049\001\016\001\017\001\018\001\021\001\022\001\023\001\024\001\
\025\001\026\001\003\001\003\001\027\001\028\001\003\001\049\001\
\031\001\009\001\012\001\013\001\004\001\015\001\037\001\038\001\
\039\001\040\001\041\001\042\001\043\001\044\001\045\001\046\001\
\047\001\048\001\049\001\004\001\004\001\006\001\007\001\004\001\
\004\001\004\001\001\001\002\001\003\001\049\001\005\001\016\001\
\017\001\018\001\009\001\003\001\010\001\011\001\012\001\013\001\
\002\001\015\001\027\001\028\001\002\001\049\001\031\001\049\001\
\049\001\002\001\049\001\005\001\037\001\038\001\039\001\040\001\
\041\001\042\001\043\001\044\001\045\001\046\001\047\001\048\001\
\049\001\004\001\014\001\006\001\007\001\005\001\005\001\002\001\
\001\001\029\001\029\000\009\001\003\001\016\001\017\001\018\001\
\003\001\005\001\003\001\005\001\001\001\005\001\005\001\001\001\
\027\001\028\001\036\000\009\001\031\001\255\255\255\255\255\255\
\255\255\255\255\037\001\038\001\039\001\040\001\041\001\042\001\
\043\001\044\001\045\001\046\001\047\001\048\001\049\001\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\004\001\255\255\006\001\255\255\255\255\255\255\255\255\
\032\001\033\001\034\001\035\001\036\001\016\001\017\001\018\001\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\027\001\028\001\050\001\255\255\031\001\255\255\255\255\255\255\
\255\255\255\255\037\001\038\001\039\001\040\001\041\001\042\001\
\043\001\044\001\045\001\046\001\047\001\048\001\049\001\001\001\
\002\001\003\001\255\255\005\001\255\255\255\255\255\255\009\001\
\010\001\011\001\012\001\013\001\255\255\015\001\255\255\255\255\
\255\255\019\001\020\001\021\001\022\001\023\001\024\001\025\001\
\026\001\001\001\002\001\003\001\255\255\005\001\255\255\255\255\
\255\255\009\001\010\001\011\001\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\019\001\020\001\021\001\022\001\023\001\
\024\001\025\001\026\001\001\001\002\001\003\001\255\255\005\001\
\255\255\255\255\255\255\009\001\010\001\011\001\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\019\001\020\001\021\001\
\022\001\023\001\024\001\025\001\026\001\001\001\002\001\003\001\
\255\255\005\001\255\255\255\255\255\255\009\001\001\001\002\001\
\003\001\255\255\005\001\255\255\255\255\255\255\009\001\019\001\
\020\001\021\001\022\001\023\001\024\001\025\001\026\001\255\255\
\019\001\020\001\021\001\022\001\023\001\024\001\025\001\026\001\
\001\001\002\001\003\001\255\255\005\001\255\255\255\255\255\255\
\009\001\001\001\002\001\003\001\255\255\005\001\255\255\255\255\
\255\255\009\001\019\001\020\001\021\001\022\001\023\001\024\001\
\025\001\026\001\255\255\019\001\020\001\021\001\022\001\023\001\
\024\001\025\001\026\001\002\001\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\010\001\011\001\012\001\013\001\255\255\
\015\001\255\255\255\255\255\255\019\001\020\001\021\001\022\001\
\023\001\024\001\025\001\026\001\003\001\255\255\255\255\255\255\
\255\255\255\255\255\255\010\001\011\001\012\001\013\001\255\255\
\015\001\255\255\255\255\255\255\019\001\020\001\021\001\022\001\
\023\001\024\001\025\001\026\001\003\001\255\255\255\255\255\255\
\255\255\255\255\255\255\010\001\011\001\012\001\013\001\255\255\
\015\001\255\255\255\255\255\255\019\001\020\001\021\001\022\001\
\023\001\024\001\025\001\026\001\003\001\255\255\255\255\255\255\
\255\255\255\255\255\255\010\001\011\001\012\001\013\001\255\255\
\015\001\255\255\255\255\255\255\019\001\020\001\021\001\022\001\
\023\001\024\001\025\001\026\001\003\001\255\255\255\255\255\255\
\255\255\255\255\255\255\010\001\011\001\012\001\013\001\255\255\
\015\001\255\255\255\255\255\255\019\001\020\001\021\001\022\001\
\023\001\024\001\025\001\026\001\005\001\255\255\255\255\255\255\
\255\255\010\001\011\001\012\001\013\001\255\255\015\001\255\255\
\255\255\255\255\019\001\020\001\021\001\022\001\023\001\024\001\
\025\001\026\001\005\001\255\255\255\255\255\255\255\255\010\001\
\011\001\012\001\013\001\255\255\015\001\255\255\255\255\255\255\
\019\001\020\001\021\001\022\001\023\001\024\001\025\001\026\001\
\005\001\255\255\255\255\255\255\255\255\010\001\011\001\012\001\
\013\001\255\255\015\001\255\255\255\255\255\255\019\001\020\001\
\021\001\022\001\023\001\024\001\025\001\026\001\005\001\255\255\
\255\255\255\255\255\255\010\001\011\001\012\001\013\001\255\255\
\015\001\255\255\255\255\255\255\019\001\020\001\021\001\022\001\
\023\001\024\001\025\001\026\001\005\001\255\255\255\255\255\255\
\255\255\010\001\011\001\012\001\013\001\255\255\015\001\255\255\
\255\255\255\255\019\001\020\001\021\001\022\001\023\001\024\001\
\025\001\026\001\005\001\255\255\255\255\255\255\255\255\010\001\
\011\001\012\001\013\001\255\255\015\001\255\255\255\255\255\255\
\019\001\020\001\021\001\022\001\023\001\024\001\025\001\026\001\
\001\001\002\001\003\001\255\255\005\001\255\255\255\255\255\255\
\009\001\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\019\001\020\001\021\001\022\001\009\001\010\001\
\011\001\012\001\013\001\255\255\015\001\255\255\255\255\255\255\
\019\001\020\001\021\001\022\001\023\001\024\001\025\001\026\001\
\009\001\010\001\011\001\012\001\013\001\255\255\015\001\255\255\
\255\255\255\255\019\001\020\001\021\001\022\001\023\001\024\001\
\025\001\026\001\010\001\011\001\012\001\013\001\255\255\015\001\
\255\255\255\255\255\255\019\001\020\001\021\001\022\001\023\001\
\024\001\025\001\026\001\010\001\011\001\012\001\013\001\255\255\
\015\001\255\255\255\255\255\255\019\001\255\255\021\001\022\001\
\023\001\024\001\025\001\026\001"

let yynames_const = "\
  COLON\000\
  COMMA\000\
  SEMICOLON\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  LBRACK\000\
  RBRACK\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  ASSIGN\000\
  MOD\000\
  PLUSPLUS\000\
  MINUSMINUS\000\
  NOT\000\
  AND\000\
  OR\000\
  EQ\000\
  NEQ\000\
  LT\000\
  LEQ\000\
  GT\000\
  GEQ\000\
  RETURN\000\
  IF\000\
  ELSE\000\
  ELSEIF\000\
  WHILE\000\
  INT\000\
  BOOL\000\
  FLOAT\000\
  STRING\000\
  VOID\000\
  BREAK\000\
  CONTINUE\000\
  LIST_PUSH\000\
  LIST_GET\000\
  LIST_SET\000\
  LIST_POP\000\
  LIST_SIZE\000\
  HASH\000\
  LIST\000\
  EOF\000\
  "

let yynames_block = "\
  ILITERAL\000\
  BLITERAL\000\
  SLITERAL\000\
  FLITERAL\000\
  ID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    Obj.repr(
# 38 "parser.mly"
            ( _1 )
# 488 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 41 "parser.mly"
                  ( ([], []))
# 494 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_decl) in
    Obj.repr(
# 42 "parser.mly"
                  ( ((_2 :: fst _1), snd _1) )
# 502 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'func_decl) in
    Obj.repr(
# 43 "parser.mly"
                  ( (fst _1, (_2 :: snd _1)) )
# 510 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    Obj.repr(
# 46 "parser.mly"
                  ( Int )
# 516 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 47 "parser.mly"
                  ( Bool )
# 522 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 48 "parser.mly"
                  ( Float )
# 528 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 49 "parser.mly"
                  ( String )
# 534 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 50 "parser.mly"
                  ( Void )
# 540 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    Obj.repr(
# 51 "parser.mly"
                  ( List(_3) )
# 547 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 55 "parser.mly"
                ( [] )
# 553 "parser.ml"
               : 'var_decl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'var_decl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_decl) in
    Obj.repr(
# 56 "parser.mly"
                          ( _2 :: _1 )
# 561 "parser.ml"
               : 'var_decl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 60 "parser.mly"
                   ( (_1, _2) )
# 569 "parser.ml"
               : 'var_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 8 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'func_formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'var_decl_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 66 "parser.mly"
( { typ     = _1;
    fname   = _2;
    formals = List.rev _4;
    locals  = List.rev _7;
    body    = List.rev _8 } )
# 584 "parser.ml"
               : 'func_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "parser.mly"
                    ( [] )
# 590 "parser.ml"
               : 'func_formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'func_formals_list) in
    Obj.repr(
# 74 "parser.mly"
                     ( List.rev _1 )
# 597 "parser.ml"
               : 'func_formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 78 "parser.mly"
              ( [(_1, _2)] )
# 605 "parser.ml"
               : 'func_formals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'func_formals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 79 "parser.mly"
                                 ( (_3, _4) :: _1 )
# 614 "parser.ml"
               : 'func_formals_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 82 "parser.mly"
                 ( [] )
# 620 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 83 "parser.mly"
                 ( _2 :: _1 )
# 628 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 86 "parser.mly"
                ( Noexpr )
# 634 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 87 "parser.mly"
                ( _1 )
# 641 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    Obj.repr(
# 90 "parser.mly"
                  ( [] )
# 647 "parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 91 "parser.mly"
               ( List.rev _1 )
# 654 "parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 95 "parser.mly"
                            ( [_1] )
# 661 "parser.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 96 "parser.mly"
                         ( _3 :: _1 )
# 669 "parser.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 100 "parser.mly"
                                            ( Expr _1 )
# 676 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_opt) in
    Obj.repr(
# 101 "parser.mly"
                                            ( Return _2 )
# 683 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 102 "parser.mly"
                                            ( Break )
# 689 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 103 "parser.mly"
                                           ( Continue )
# 695 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 104 "parser.mly"
                                            ( Block(List.rev _2) )
# 702 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 105 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 710 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 106 "parser.mly"
                                            ( If(_3, _5, _7) )
# 719 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 107 "parser.mly"
                                            ( While(_3, _5) )
# 727 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    Obj.repr(
# 108 "parser.mly"
                                                  ( ListPush(_3, _5) )
# 735 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    Obj.repr(
# 109 "parser.mly"
                                                            ( ListSet(_3, _5, _7) )
# 744 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 110 "parser.mly"
                                                      ( ListSet(_1, _3, _6) )
# 753 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 114 "parser.mly"
                                          ( ILiteral(_1) )
# 760 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 115 "parser.mly"
                                          ( BLiteral(_1) )
# 767 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 116 "parser.mly"
                                          ( SLiteral(_1) )
# 774 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 117 "parser.mly"
                                          ( FLiteral(_1) )
# 781 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 118 "parser.mly"
                                          ( Id(_1) )
# 788 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "parser.mly"
                                          ( Binop(_1, Add, _3) )
# 796 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 120 "parser.mly"
                                          ( Binop(_1, Sub, _3) )
# 804 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 121 "parser.mly"
                                          ( Binop(_1, Mult, _3) )
# 812 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 122 "parser.mly"
                                          ( Binop(_1, Div, _3) )
# 820 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 123 "parser.mly"
                                          ( Binop(_1, Mod, _3) )
# 828 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 124 "parser.mly"
                                          ( Unop(PlusPlus, Id(_2)) )
# 835 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 125 "parser.mly"
                                          ( Unop(MinusMinus, Id(_2)) )
# 842 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 126 "parser.mly"
                                          ( Binop(_1, Equal, _3) )
# 850 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 127 "parser.mly"
                                          ( Binop(_1, Neq, _3) )
# 858 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 128 "parser.mly"
                                          ( Binop(_1, Less, _3) )
# 866 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 129 "parser.mly"
                                          ( Binop(_1, Greater, _3) )
# 874 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 130 "parser.mly"
                                          ( Binop(_1, Leq, _3) )
# 882 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 131 "parser.mly"
                                          ( Binop(_1, Geq, _3) )
# 890 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 132 "parser.mly"
                                          ( Unop(Not, _2) )
# 897 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 133 "parser.mly"
                                          ( Binop(_1, And, _3) )
# 905 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 134 "parser.mly"
                                          ( Binop(_1, Or, _3) )
# 913 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 135 "parser.mly"
                                          ( _2 )
# 920 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'expr_opt) in
    Obj.repr(
# 136 "parser.mly"
                                           ( ListSlice(_1, _3, _5) )
# 929 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 137 "parser.mly"
                                          ( Assign(_1, _3) )
# 937 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args_opt) in
    Obj.repr(
# 138 "parser.mly"
                                         ( Call(_1, _3) )
# 945 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 139 "parser.mly"
                                          ( ListGet(_3, _5) )
# 953 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 140 "parser.mly"
                                          ( ListGet(_1, _3) )
# 961 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 141 "parser.mly"
                                          ( ListPop(_3) )
# 968 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 142 "parser.mly"
                                          ( ListSize(_3) )
# 975 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 143 "parser.mly"
                                          ( ListSize(_2) )
# 982 "parser.ml"
               : 'expr))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
