//milestone_1.g4 
grammar milestone_1; 
start : Comment | MultiLineComment | IDENTIFIER | DIGIT | Space | HEX_LIT | DEC_LIT | OCT_LIT |INT_LIT | INT8_LIT 
        | INT16_LIT | INT32_LIT | INT64_LIT | UINT_LIT | UINT8_LIT | UINT16_LIT | UINT32_LIT | UINT64_LIT | EXP
        | FLOAT_LIT | FLOAT32_SUFFIX | FLOAT32_LIT | FLOAT64_LIT | FLOAT64_SUFFIX | EQUALS_OPERATOR | MUL_OPERATOR
        | ADD_OPERATOR | MINUS_OPERATOR | DIV_OPERATOR | BITWISE_NOT_OPERATOR | AND_OPERATOR | OR_OPERATOR | LESS_THAN 
        |GREATER_THAN | AT | MODULUS | NOT_OPERATOR | XOR_OPERATOR | DOT | COLON | OPEN_PAREN | CLOSE_PAREN 
        | OPEN_BRACE | CLOSE_BRACE | OPEN_BRACK | CLOSE_BRACK | COMMA | SEMI_COLON | STR_LIT | CHAR_LIT | TRIPLESTR_LIT
        | RSTR_LIT | GENERALIZED_STR_LIT | GENERALIZED_TRIPLESTR_LIT;

Comment : '#' .*? ('\n'|EOF)				-> channel(HIDDEN) ;
MultiLineComment: '#[' (MultiLineComment|.)*? ']#'	-> channel(HIDDEN) ;

YIELD: 'yield';
IDENTIFIER: LETTER  ( ( [\_] (LETTER | DIGIT) ) | (LETTER|DIGIT) )* [\_]?; //handle if underscore is at the end of the identifier
LETTER: ( [A-Z] | [a-z] | [\u0080-\u00ff] ); //ask about unicode!
DIGIT:  [0-9] ;

INT8_LIT : INT_LIT [\'] ('i' | 'I') '8';
INT16_LIT : INT_LIT ['\''] ('i' | 'I') '16';
INT32_LIT : INT_LIT ['\''] ('i' | 'I') '32';
INT64_LIT : INT_LIT ['\''] ('i' | 'I') '64';

UINT_LIT : INT_LIT ['\''] ('u' | 'U');
UINT8_LIT : INT_LIT ['\''] ('u' | 'U') '8';
UINT16_LIT : INT_LIT ['\''] ('u' | 'U') '16';
UINT32_LIT : INT_LIT ['\''] ('u' | 'U') '32';
UINT64_LIT : INT_LIT ['\''] ('u' | 'U') '64';

FLOAT_LIT : DIGIT (['_'] DIGIT)* (('.' DIGIT (['_'] DIGIT)* [EXP]) |EXP);
FLOAT32_SUFFIX : ('f' | 'F') ['32'];
FLOAT32_LIT : HEX_LIT '\'' FLOAT32_SUFFIX
            | (FLOAT_LIT | DEC_LIT | OCT_LIT | BIN_LIT) ['\''] FLOAT32_SUFFIX;
FLOAT64_SUFFIX : ( ('f' | 'F') '64' ) | 'd' | 'D';
FLOAT64_LIT : HEX_LIT '\'' FLOAT64_SUFFIX
            | (FLOAT_LIT | DEC_LIT | OCT_LIT | BIN_LIT) ['\''] FLOAT64_SUFFIX;

EXP:  ('e' | 'E' ) ['+' | '-'] DIGIT ( ['_'] DIGIT )*;

INT_LIT : HEX_LIT | DEC_LIT | OCT_LIT | BIN_LIT ;

HEX_LIT: '0' ('x' | 'X' ) HEXDIGIT ( ([\_] HEXDIGIT) | HEXDIGIT )*; //ask about 0xf_f or 0xff
DEC_LIT: DIGIT ( [\_] DIGIT )*;
OCT_LIT: '0' 'o' OCTDIGIT ( [\_] OCTDIGIT )*;
BIN_LIT: '0' ('b' | 'B' ) BINDIGIT ( [\_] BINDIGIT )*;

HEXDIGIT: DIGIT | [A-F] | [a-f];
OCTDIGIT: [0-7];
BINDIGIT: [0|1];

EQUALS_OPERATOR: '=';
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
NOT_OPERATOR :  '!' ; //ask about !
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

STR_LIT: '"' ( .*? ) '"'; //should i handle escape characters tokenizations ?
CHAR_LIT: '\'' (.?) '\'';
TRIPLESTR_LIT : '"""' (.*?) '"""';

RSTR_LIT: ('r'| 'R') ('"') (.*?) '"'; //do i need to handle "" in middle ? 
GENERALIZED_STR_LIT : IDENTIFIER  STR_LIT ;
GENERALIZED_TRIPLESTR_LIT: IDENTIFIER TRIPLESTR_LIT;



Space : ([ \t\r\n]+) ;



// NEWLINE : [\r\n ]+ -> skip; 
// Space : ([ \t\r\n]+ | ',') -> skip;
// IMMEDIATE :  [0-9]+ ; 
// REG : ('AX' | 'BX' | 'CX' | 'DX');
// COMMAND : ('AAA' | 'ADD' | 'INC'); 
// MEMORY : ('[AX]');
// expr: expr expr ','expr
//     | INT
//     | IMMEDIATE
//     | REG
//     | COMMAND
//     | MEMORY
//  expr : COMMAND REG REG 
//     | COMMAND  
//     | COMMAND REG IMMEDIATE
//     | COMMAND REG MEMORY
//     | COMMAND MEMORY REG
//     | COMMAND MEMORY IMMEDIATE
//     | COMMAND REG
//     | COMMAND MEMORY;
