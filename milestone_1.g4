//milestone_1.g4 
grammar milestone_1; 
start : stmt;
        
        // VARIABLE | AND | ADDR | AS | ASM | BIND | BLOCK | BREAK | CASE | CAST | CONCEPT | CONST | CONTINUE | CONVERTER |
        // DEFER | DISCARD | DISTINCT | DIV | DO | ELIF | ELSE | END | ENUM | EXCEPT | EXPORT | FINALLY | FOR | FROM | FUNC |
        // IF | IMPORT | IN | INTERFACE | IS | ISNOT | ITERATOR | LET | MACRO | METHOD | MIXIN | MOD | NIL | NOT NOTIN |
        // OBJECT | OF | OR | OUT | PROC | PTR | RAISE | REF | RETURN | SHL | SHR | STATIC | TEMPLATE | TRY | TUPLE |
        // | TYPE | USING | WHEN | WHILE | XOR | INDENT |
        
        // DOC_COMMENT | COMMENT | MultiLineComment | SPACE| IDENTIFIER  | HEX_LIT | DEC_LIT | OCT_LIT |INT_LIT |DIGIT| INT8_LIT 
        // | INT16_LIT | INT32_LIT | INT64_LIT | UINT_LIT | UINT8_LIT | UINT16_LIT | UINT32_LIT | UINT64_LIT | EXP
        // | FLOAT_LIT | FLOAT32_SUFFIX | FLOAT32_LIT | FLOAT64_LIT | FLOAT64_SUFFIX | EQUALS_OPERATOR | MUL_OPERATOR
        // | ADD_OPERATOR | MINUS_OPERATOR | DIV_OPERATOR | BITWISE_NOT_OPERATOR | AND_OPERATOR | OR_OPERATOR | LESS_THAN 
        // |GREATER_THAN | AT | MODULUS | NOT_OPERATOR | XOR_OPERATOR | DOT | COLON | OPEN_PAREN | CLOSE_PAREN 
        // | OPEN_BRACE | CLOSE_BRACE | OPEN_BRACK | CLOSE_BRACK | COMMA | SEMI_COLON | STR_LIT | CHAR_LIT | TRIPLESTR_LIT
        // | RSTR_LIT | GENERALIZED_STR_LIT | GENERALIZED_TRIPLESTR_LIT
        // ;
//////////////
/////grammar related rules
//////////////////


module: stmt ;//[^* (';' / IND{=})];
comma: COMMA COMMENT?;
semicolon : SEMI_COLON COMMENT?;
colon : COLON COMMENT?;
colcom : ':' COMMENT?;

operator: ADD_OPERATOR | AND_OPERATOR | OR_OPERATOR | BITWISE_NOT_OPERATOR | DIV_OPERATOR ///OP0 op1 ???
        | EQUALS_OPERATOR | MINUS_OPERATOR | MUL_OPERATOR | NOT_OPERATOR | XOR_OPERATOR 
        | OR | XOR | AND | IS | ISNOT | IN | NOTIN | OF | DIV | MOD | SHL | SHR | NOT | STATIC | '..';

prefixOperator : operator;
 
optInd : COMMENT?; // IND?; what is IND ?????????????????????????????????????????????????????????????
optPar : 'eh da brdo ?'; //(IND{>} | IND{=})?////////////////////////////
simpleExpr : ; //arrowExpr (OP0 optInd arrowExpr)* pragma?//////////////////////



arrowExpr : assignExpr (OP1 optInd assignExpr)*;
assignExpr : orExpr (OP2 optInd orExpr)*;
orExpr : andExpr (OP3 optInd andExpr)*;
andExpr : cmpExpr (OP4 optInd cmpExpr)*;
cmpExpr : sliceExpr (OP5 optInd sliceExpr)*;
sliceExpr : ampExpr (OP6 optInd ampExpr)*;
ampExpr : plusExpr (OP7 optInd plusExpr)*;
plusExpr : mulExpr (OP8 optInd mulExpr)*;
mulExpr : dollarExpr (OP9 optInd dollarExpr)*;
dollarExpr : primary (OP10 optInd primary)*;
////////////////
OP1: ;
OP2: ;
OP3: ;
OP4: ;
OP5: ;
OP6: ;
OP7: ;
OP8: ;
OP9: ;
OP10: ;

/////////////



symbol : ('\'' (KEYW|IDENTIFIER |LITERAL|(operator|'('|')'|'['|']'|'{'|'}'|'=') )+ '\'')| IDENTIFIER | KEYW ; 
exprColonEqExpr : expr (':'|'=' expr)? ;
exprList : expr ('\n')+ comma;
exprColonEqExprList : exprColonEqExpr (comma exprColonEqExpr)* (comma)?;
dotExpr : expr DOT optInd (symbol | '[:' exprList ']');
explicitGenericInstantiation : '[:' exprList ']' ( '(' exprColonEqExpr ')' )? ;
qualifiedIdent : symbol ('.' optInd symbol)?;
setOrTableConstr : '{' ((exprColonEqExpr comma)* | ':' ) '}';
castExpr : 'cast' '[' optInd typeDesc optPar ']' '(' optInd expr optPar ')';

parKeyw : DISCARD | 'include' | IF | WHILE | CASE | TRY
        | FINALLY | EXCEPT | FOR | BLOCK | CONST | LET
        | WHEN | VARIABLE | MIXIN ;
par : '(' optInd
          ( '&'parKeyw complexOrSimpleStmt ('\n')+ ';' /// & ?????
          | ';' complexOrSimpleStmt ('\n')+ ';'
          | pragmaStmt
          | simpleExpr ( ('=' expr (';' complexOrSimpleStmt ('\n')+ ';' )? )
                       | (':' expr (',' exprColonEqExpr     ('\n')+ ',' )? ) ) )
          optPar ')';
LITERAL : | INT_LIT | INT8_LIT | INT16_LIT | INT32_LIT | INT64_LIT
          | UINT_LIT | UINT8_LIT | UINT16_LIT | UINT32_LIT | UINT64_LIT
          | FLOAT_LIT | FLOAT32_LIT | FLOAT64_LIT
          | STR_LIT | RSTR_LIT | TRIPLESTR_LIT
          | CHAR_LIT
          | NIL ;

generalizedLit : GENERALIZED_STR_LIT | GENERALIZED_TRIPLESTR_LIT;
identOrLiteral : generalizedLit | symbol | LITERAL
               | par | arrayConstr | setOrTableConstr
               | castExpr;
tupleConstr : '(' optInd (exprColonEqExpr comma+)* optPar ')'; //also changed the ? with a + to avoid an error
arrayConstr : '[' optInd (exprColonEqExpr comma+)* optPar ']'; //also changed the ? with a + to avoid an error
primarySuffix : '(' (exprColonEqExpr comma+)* ')' doBlocks? //also changed the ? with a + to avoid an error
      | doBlocks
      | DOT optInd symbol generalizedLit?
      | '[' optInd exprList optPar ']' // changed indexExprList to expr LIst as it is not founddd in doc!
      | '{' optInd exprList optPar '}'
      | '&'( '\'' |IDENTIFIER|LITERAL|'cast'|'addr'|'type') expr ;// # command syntax

condExpr : expr colcom expr optInd
        (ELIF expr colcom expr optInd)*
         ELSE colcom expr;


ifExpr: IF condExpr;

whenExpr : WHEN condExpr ; 
pragma : '{.' optInd (exprColonEqExpr comma+)* optPar ('.}' | '}'); // was exprColonExpr but i can;t find it in doc catch
//also changed the ? with a + to avoid an error
identVis : symbol opr?  ; 
identVisDot : symbol '.' optInd symbol opr?;
identWithPragma : identVis pragma?;
identWithPragmaDot : identVisDot pragma?;
declColonEquals : identWithPragma (comma identWithPragma)* comma?
                  (COLON optInd typeDesc)? (EQUALS_OPERATOR optInd expr)?;
identColonEquals : IDENTIFIER (comma IDENTIFIER)* comma?  /// is ident == IDENTIFIER ?
     (COLON optInd typeDesc)? (EQUALS_OPERATOR optInd expr)? ;
inlTupleDecl : TUPLE
    '\'' optInd  (identColonEquals (comma|semicolon)?)*  optPar '\'';  /////definitly feha 7aga 3'lt 

extTupleDecl : TUPLE
    COMMENT? (INDENT identColonEquals (INDENT identColonEquals)*)? ; /////////indeeeeeeeeeeeeeeeeeeeent
tupleClass : TUPLE ;
paramList : '(' declColonEquals ('\n')* (comma|semicolon) ')' ;
paramListArrow : paramList? ('->' optInd typeDesc)?;
paramListColon : paramList? (COLON optInd typeDesc)?;
doBlock : DO paramListArrow pragmaStmt? colcom stmt;
doBlocks : (DO paramListArrow pragmaStmt? colcom stmt)+; ///habdaaaaaaaaaaaaaaaaaaaaaaaa 3shan msh mwgoda fel doc
procExpr : 'proc' paramListColon pragmaStmt? ('=' COMMENT? stmt)?; ///pragmaS changed with pragmastmt
distinct : 'distinct' optInd typeDesc;
forStmt : FOR (identWithPragma ('\n')+ comma) 'in' expr colcom stmt;
forExpr : forStmt ;


expr : (blockExpr
      | ifExpr
      | whenExpr
      | caseStmt // was CaseEXpr but i can't find it in the doc !
      | forExpr
      | tryExpr)
      | simpleExpr ;


typeKeyw : VARIABLE | OUT | REF | PTR | 'shared' | TUPLE
         | PROC | ITERATOR | DISTINCT | OBJECT | ENUM ;

primary : typeKeyw typeDesc //was typedescK but i changed to typeDesc ( removed K)
        |  prefixOperator* identOrLiteral primarySuffix*
        | BIND primary;
typeDesc : simpleExpr;

typeDefAux : simpleExpr
           | 'concept' typeClass;
postExprBlocks : ':' stmt? ( INDENT doBlock /////////////////INDENTSSSSSSSSSSSSSSSSSS
                           | INDENT 'of' exprList ':' stmt
                           | INDENT 'elif' expr ':' stmt
                           | INDENT 'except' exprList ':' stmt
                           | INDENT 'else' ':' stmt )* ;
exprStmt : simpleExpr
         (( '=' optInd expr colonBody? )
         | ( expr ('\n')+ comma
             doBlocks
              | macroColon
           ))?;
macroColon: MACRO COLON ; ////////////habdaa brdo 3shan msh fel doc 
importStmt : IMPORT optInd expr
              ((comma expr)*
              | EXCEPT optInd (expr ('\n')+ comma)) ;
includeStmt : 'include' optInd expr ('\n')+ comma;
fromStmt : FROM moduleName IMPORT optInd expr (comma expr)*; 
moduleName : IDENTIFIER; ////////////////// not sure if correct ( habda )
returnStmt : RETURN optInd expr?;
raiseStmt : RAISE optInd expr?;
yieldStmt : YIELD optInd expr?;
discardStmt : DISCARD optInd expr?;
breakStmt : BREAK optInd expr?;
continueStmt : BREAK optInd expr? ;
condStmt : expr colcom stmt COMMENT?
           (INDENT ELIF expr colcom stmt)*
           (INDENT ELSE colcom stmt)?; /////////////////// fuckin indent
ifStmt : IF condStmt;
whenStmt : WHEN condStmt ;
whileStmt : WHILE expr colcom stmt;
ofBranch : OF exprList colcom stmt;
ofBranches : ofBranch (INDENT ofBranch)*
                      (INDENT ELIF expr colcom stmt)* ///////////INDENT bayza
                      (INDENT ELSE colcom stmt)? ;
caseStmt : CASE expr ':'? COMMENT?
            (INDENT ofBranches INDENT /////////////indents bayzaaa
            | INDENT ofBranches);
tryStmt : TRY colcom stmt (INDENT? EXCEPT|FINALLY) //Indent and &  ???????????
           (INDENT? EXCEPT exprList colcom stmt)*
           (INDENT? FINALLY colcom stmt)? ;
tryExpr : TRY colcom stmt (optInd EXCEPT|FINALLY) /////////////////& removed    
           (optInd EXCEPT exprList colcom stmt)*
           (optInd FINALLY colcom stmt)? ;
exceptBlock : EXCEPT colcom stmt;
blockStmt : BLOCK symbol? colcom stmt;
blockExpr :BLOCK symbol? colcom stmt;
staticStmt : STATIC colcom stmt;
deferStmt : DEFER colcom stmt;
asmStmt : 'asm' pragma? (STR_LIT | RSTR_LIT | TRIPLESTR_LIT);
genericParam : symbol (comma symbol)* (colon expr)? ('=' optInd expr)?;
genericParamList : '[' optInd genericParam '\n'* (comma|SEMI_COLON) optPar ']'; /// \n badal ^
pattern : '{' stmt '}';
indAndComment : (INDENT COMMENT)? | COMMENT?;
routine : optInd identVis pattern? genericParamList?
  paramListColon pragma? ('=' COMMENT? stmt)? indAndComment;
commentStmt : COMMENT;
// section[P : COMMENT? 'p' | (| ('p' | COMMENT) '\n'+ INDENT ); //// indent and P changed to 'p' and removed DED
constant : identWithPragma (colon typeDesc)? '=' optInd expr indAndComment;
enum : ENUM optInd (symbol optInd ('=' optInd expr COMMENT?)? comma?)+;
objectWhen : WHEN expr colcom objectPart COMMENT?
            (ELIF expr colcom objectPart COMMENT?)*
            (ELSE colcom objectPart COMMENT?)?;
objectBranch : OF exprList colcom objectPart;
objectBranches : objectBranch (INDENT expr colcom objectPart)*
                      (INDENT ELSE colcom objectPart)?;
objectCase : CASE identWithPragma ':' typeDesc ':'? COMMENT?
            (INDENT objectBranches //////DED ///fuckin DED ?
            | INDENT objectBranches);
objectPart : INDENT objectPart ('\n')+ INDENT//^+IND{=} DED ////////indent and DED and ^+
           | objectWhen | objectCase | NIL | DISCARD | declColonEquals;
object1 : OBJECT pragma? (OF typeDesc)? COMMENT? objectPart;
typeClassParam : ('var' | 'out')? symbol;
typeClass : typeClassParam ('\n')* ',' (pragma)? ('of' typeDesc ('\n')* ',')? ///^* removed
              '&' INDENT stmt; //& and fuckin indent
typeDef : identWithPragmaDot genericParamList? '=' optInd typeDefAux
            indAndComment?;
varTuple : '(' optInd identWithPragma ('\n')+ comma optPar ')' '=' optInd expr; /////^ removed
colonBody : colcom stmt doBlocks?;
variable : (varTuple | identColonEquals) colonBody? indAndComment;
bindStmt : 'bind' optInd qualifiedIdent ('\n')+ comma; //////////////^
mixinStmt : 'mixin' optInd qualifiedIdent ('\n')+ comma; ////////////^
pragmaStmt : pragma (':' COMMENT? stmt)?;
simpleStmt : ((returnStmt | raiseStmt | yieldStmt | discardStmt | breakStmt
           | continueStmt | pragmaStmt | importStmt  | fromStmt //| exportStmt was removed as it's not in doc
           | includeStmt | commentStmt) | exprStmt) COMMENT?;

complexOrSimpleStmt : (ifStmt | whenStmt | whileStmt
                    | tryStmt | forStmt
                    | blockStmt | staticStmt | deferStmt | asmStmt
                    | 'proc' routine
                    | 'method' routine
                    | 'iterator' routine
                    | 'macro' routine
                    | 'template' routine
                    | 'converter' routine
                    | 'type' sectionTypeDef
                    | 'const' sectionConstant
                    | ('let' | 'var' | 'using') sectionVariable
                    | bindStmt | mixinStmt)
                    | simpleStmt;


stmt : (INDENT complexOrSimpleStmt ('\n')+(INDENT | ';') )//DED) ///INDENT AND DED and ^
     | simpleStmt ('\n')+ ';'; /////^


sectionTypeDef : COMMENT? typeDef | (| (typeDef | COMMENT) '\n'+ INDENT ); //// indent and P changed to 'p' and removed DED
sectionConstant:  COMMENT? constant | (| (constant | COMMENT) '\n'+ INDENT ); //// indent and P changed to 'p' and removed DED
sectionVariable:  COMMENT? variable | (| (variable | COMMENT) '\n'+ INDENT ); //// indent and P changed to 'p' and removed DED



KEYW : 'EH DA ?' ; ////////////////////////////////////////// ??????





opr:  ADD_OPERATOR | AND_OPERATOR | OR_OPERATOR | BITWISE_NOT_OPERATOR | DIV_OPERATOR ///OP0 op1 ???
        | EQUALS_OPERATOR | MINUS_OPERATOR | MUL_OPERATOR | NOT_OPERATOR | XOR_OPERATOR ;
///////////////////////////////////////////////////////////////////////
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
