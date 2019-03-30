grammar Milestone1;

NEWLINE: [\r\n]+;

SPACE: (' ')->skip;

expr: NEWLINE;

start: (expr)*;
