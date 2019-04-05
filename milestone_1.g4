//milestone_1.g4 
grammar milestone_1; 
start : 
        
        VARIABLE | AND | ADDR | AS | ASM | BIND | BLOCK | BREAK | CASE | CAST | CONCEPT | CONST | CONTINUE | CONVERTER |
        DEFER | DISCARD | DISTINCT | DIV | DO | ELIF | ELSE | END | ENUM | EXCEPT | EXPORT | FINALLY | FOR | FROM | FUNC |
        IF | IMPORT | IN | INTERFACE | IS | ISNOT | ITERATOR | LET | MACRO | METHOD | MIXIN | MOD | NIL | NOT NOTIN |
        OBJECT | OF | OR | OUT | PROC | PTR | RAISE | REF | RETURN | SHL | SHR | STATIC | TEMPLATE | TRY | TUPLE |
        | TYPE | USING | WHEN | WHILE | XOR | INDENT |
        
        DOC_COMMENT | COMMENT | MultiLineComment | SPACE| IDENTIFIER  | HEX_LIT | DEC_LIT | OCT_LIT |INT_LIT |DIGIT| INT8_LIT 
        | INT16_LIT | INT32_LIT | INT64_LIT | UINT_LIT | UINT8_LIT | UINT16_LIT | UINT32_LIT | UINT64_LIT | EXP
        | FLOAT_LIT | FLOAT32_SUFFIX | FLOAT32_LIT | FLOAT64_LIT | FLOAT64_SUFFIX | EQUALS_OPERATOR | MUL_OPERATOR
        | ADD_OPERATOR | MINUS_OPERATOR | DIV_OPERATOR | BITWISE_NOT_OPERATOR | AND_OPERATOR | OR_OPERATOR | LESS_THAN 
        |GREATER_THAN | AT | MODULUS | NOT_OPERATOR | XOR_OPERATOR | DOT | COLON | OPEN_PAREN | CLOSE_PAREN 
        | OPEN_BRACE | CLOSE_BRACE | OPEN_BRACK | CLOSE_BRACK | COMMA | SEMI_COLON | STR_LIT | CHAR_LIT | TRIPLESTR_LIT
        | RSTR_LIT | GENERALIZED_STR_LIT | GENERALIZED_TRIPLESTR_LIT
        ;


INDENT:  '    '+  ;
// ///////////////////////////////////////

AND: 'and';
VARIABLE: 'var'; //to be checked
ADDR: 'addr';
AS: 'as';
ASM: 'asm';
BIND: 'bind';
BLOCK: 'block';
BREAK: 'break';
CASE: 'case';
CAST: 'cast';
CONCEPT: 'concept';
CONST:'const';
CONTINUE:'continue';
CONVERTER:'converter';
DEFER: 'defer';
DISCARD: 'discard';
DISTINCT: 'distinct';
DIV: 'div';
DO: 'do';
ELIF: 'elif';
ELSE: 'else';
END: 'end';
ENUM: 'enum';
EXCEPT: 'except';
EXPORT: 'export';
FINALLY: 'finally';
FOR: 'for';
FROM: 'from';
FUNC: 'func';
IF: 'if';
IMPORT: 'import';
IN: 'in';
INTERFACE: 'interface';
IS: 'is';
ISNOT: 'isnot';
ITERATOR: 'iterator';
LET: 'let';
MACRO: 'macro';
METHOD: 'method';
MIXIN: 'mixin';
MOD: 'mod';
NIL: 'nil';
NOT: 'not';
NOTIN: 'notin';
OBJECT: 'object';
OF: 'of';
OR: 'or';
OUT: 'out';
PROC: 'proc';
PTR: 'ptr';
RAISE: 'raise';
REF: 'ref';
RETURN: 'return';
SHL: 'shl';
SHR: 'shr';
STATIC: 'static';
TEMPLATE: 'template';
TRY: 'try';
TUPLE: 'tuple';
TYPE: 'type';
USING: 'using';
WHEN: 'when';
WHILE: 'while';
XOR: 'xor';


////////////////////////////////////
YIELD: 'yield';
IDENTIFIER: LETTER  ( ( [_] (LETTER | DIGIT) ) | (LETTER|DIGIT) )* [_]?; //handle if underscore is at the end of the identifier
LETTER: ( [A-Z] | [a-z] | [\u0080-\u00ff] ); //ask about unicode!
DIGIT:  [0-9] ;

INT8_LIT : INT_LIT ['] ('i' | 'I') '8';
INT16_LIT : INT_LIT ['] ('i' | 'I') '16';
INT32_LIT : INT_LIT ['] ('i' | 'I') '32';
INT64_LIT : INT_LIT ['] ('i' | 'I') '64';

UINT_LIT : INT_LIT ['] ('u' | 'U');
UINT8_LIT : INT_LIT ['] ('u' | 'U') '8';
UINT16_LIT : INT_LIT ['] ('u' | 'U') '16';
UINT32_LIT : INT_LIT ['] ('u' | 'U') '32';
UINT64_LIT : INT_LIT ['] ('u' | 'U') '64';
FLOAT_LIT : DIGIT ([_] DIGIT | DIGIT)* ( ('.' DIGIT ([_] DIGIT | DIGIT)*) | ('.' DIGIT ([_] DIGIT | DIGIT)* EXP) |EXP);
FLOAT32_SUFFIX : ('f' | 'F') '32';
FLOAT32_LIT : HEX_LIT ['] FLOAT32_SUFFIX
            | (FLOAT_LIT | DEC_LIT | OCT_LIT | BIN_LIT) ['] FLOAT32_SUFFIX;
FLOAT64_SUFFIX : ( ('f' | 'F') '64' ) | 'd' | 'D';
FLOAT64_LIT : HEX_LIT ['] FLOAT64_SUFFIX
            | (FLOAT_LIT | DEC_LIT | OCT_LIT | BIN_LIT) ['] FLOAT64_SUFFIX;
EXP:  ('e' | 'E' ) [+|-] DIGIT ( [_] DIGIT | DIGIT )*;
INT_LIT : HEX_LIT | DEC_LIT | OCT_LIT | BIN_LIT ;
HEX_LIT: '0' ('x' | 'X' )  HEXDIGIT  ( ([_] HEXDIGIT)* | HEXDIGIT* ); //ask about 0xf_f or 0xff
DEC_LIT: DIGIT ( [_] DIGIT | DIGIT)*;
OCT_LIT: '0' 'o' OCTDIGIT ( [_] OCTDIGIT | OCTDIGIT )*;
BIN_LIT: '0' ('b' | 'B' ) BINDIGIT ( [_] BINDIGIT | BINDIGIT)*;
HEXDIGIT: DIGIT | [A-F] | [a-f];
OCTDIGIT: [0-7];
BINDIGIT: [0|1];
EQUALS_OPERATOR: '=' | '==';
ADD_OPERATOR : '+';
MUL_OPERATOR: '*';
MINUS_OPERATOR: '-';
DIV_OPERATOR: '/' ;
BITWISE_NOT_OPERATOR: '~';
AND_OPERATOR : '&' ;
OR_OPERATOR : '|' ;
LESS_THAN : '<';
GREATER_THAN: '>';
AT: '@';
MODULUS: '%' ;
NOT_OPERATOR :  '!' ;
XOR_OPERATOR: '^' ;
DOT: '.';
COLON: ':';
OPEN_PAREN : '(';
CLOSE_PAREN : ')';
OPEN_BRACE : '{';
CLOSE_BRACE: '}';
OPEN_BRACK : '[';
CLOSE_BRACK: ']';
COMMA: ',';
SEMI_COLON : ';';
STR_LIT: '"' ( .*? ) '"' ; //should i handle escape characters tokenizations ?
CHAR_LIT: ['] (.?) ['] | ['] ESCAPE ['] ;
ESCAPE: '\\' ('p'| 'r' | 'c' | 'n' | 'l' | 'f' | 't' | 'v' | '\\' | '"' | ['] | ([']DIGIT ['])+ | 'a' | 'b' | 'e' | '\'x' HEXDIGIT HEXDIGIT ) ;
TRIPLESTR_LIT : '"""' TRIPLESTR_ITEM '"""';
TRIPLESTR_ITEM : (.*?);
RSTR_LIT: ('r'| 'R') ('"') (.*?) '"'; //do i need to handle "" in middle ?
GENERALIZED_STR_LIT : IDENTIFIER  STR_LIT ;
GENERALIZED_TRIPLESTR_LIT: IDENTIFIER TRIPLESTR_LIT;



SPACE:( ('\n') | ' ' | '\t' ) ->skip;
COMMENT : '#' .*? ('\n'|EOF)				->skip ;
MultiLineComment: '#[' (MultiLineComment|.)*? ']#'	-> skip ;
DOC_COMMENT: '##[' .*? ']##' -> skip; 
