//milestone_1.g4 
grammar milestone_1; 
start : Comment | MultiLineComment ;

Comment : '#' .*? ('\n'|EOF)				-> channel(HIDDEN) ;
MultiLineComment: '#[' (MultiLineComment|.)*? ']#'	-> channel(HIDDEN) ;
 Letter: [A-Z]+ | [a-z]+ | [\u0080-\u00ff]+;

// NEWLINE : [\r\n ]+ -> skip; 
// Space : ([ \t\r\n]+ | ',') -> skip;
// IMMEDIATE : [0|1]+[b] | [0-9]+ ; 
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
