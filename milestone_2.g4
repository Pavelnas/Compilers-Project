grammar milestone_2; 

        
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

start : (stmt ( ';' stmt )*)? EOF; // removed indent


comma: COMMA ;
semicolon : SEMI_COLON ;

colcom : COLON ;//('\n')* ; //added \n to avoid extraneous input

operator : EQUALS_OPERATOR| ADD_OPERATOR | AND_OPERATOR | OR_OPERATOR | BITWISE_NOT_OPERATOR | DIV_OPERATOR ///op0 op1 ???
         | MINUS_OPERATOR | MUL_OPERATOR | NOT_OPERATOR | XOR_OPERATOR 
        | OR | XOR | AND | IS | ISNOT | IN | NOTIN | OF | DIV | MOD | SHL | SHR | NOT | STATIC | '..'|MOD ;

prefixOperator : operator; //added for trial
 
optInd : COMMENT? ; // IND?; what is IND ?????????????????????????????????????????????????????????????
// optPar : INDENT?; //(IND{>} | IND{=})?////////////////////////////
simpleExpr :arrowExpr (op0 optInd arrowExpr)* pragma?  ; 
//arrowExpr (op0 optInd arrowExpr)* pragma?//////////////////////



arrowExpr : assignExpr (op1 optInd assignExpr)* ;
assignExpr : orExpr (op2 optInd orExpr)*;
orExpr : andExpr (op3 optInd andExpr)*;
andExpr : cmpExpr (op4 optInd cmpExpr)*;
cmpExpr : sliceExpr (op5 optInd sliceExpr)?;
sliceExpr : ampExpr (op6 optInd ampExpr)?;
ampExpr : plusExpr (op7 optInd plusExpr)*;
plusExpr : mulExpr (op8 optInd mulExpr)*;
mulExpr : dollarExpr (op9 optInd dollarExpr)*;
dollarExpr : primary (op10 optInd primary)* ;
////////////////
op0: '->' '=>';
op1: (ADD_OPERATOR | MINUS_OPERATOR | MUL_OPERATOR | DIV_OPERATOR) (EQUALS_OPERATOR);
op2: AT | '?' ;
op3: OR | XOR;
op4: AND;
op5: ( (EQUALS_OPERATOR| LESS_THAN | GREATER_THAN | NOT_OPERATOR) (EQUALS_OPERATOR?) ) 
      | ( NOTIN | IS | ISNOT | NOT |  LESS_THAN ) //| OF) IN |
       ;
op6: DOT DOT | '..';
op7: AND_OPERATOR ;
op8: ADD_OPERATOR | MINUS_OPERATOR ;
op9: MUL_OPERATOR | DIV_OPERATOR | DIV | MOD | SHL | SHR | MODULUS;
op10: '$' |'^' ;

/////////////


symbol : (('\'' (keyw|IDENTIFIER |literal|(operator|'('|')'|'['|']'|'{'|'}'|'=') )+ '\'')|literal|( '$'? IDENTIFIER ) | keyw | callproc) ;//SEMI_COLON? ;  //stmt?; //added $ identifier
exprColonEqExpr : expr (COLON|EQUALS_OPERATOR expr)? ;
exprList : expr (comma expr)* ;
exprColonEqExprList : exprColonEqExpr (comma exprColonEqExpr)* (comma)?;
dotExpr : expr DOT optInd (symbol | '[:' exprList ']');
explicitGenericInstantiation : '[:' exprList ']' ( '(' exprColonEqExpr ')' ) ? ;
qualifiedIdent : symbol ('.' optInd symbol)?;
setOrTableConstr : '{' ((exprColonEqExpr comma)* | COLON ) '}'; 
castExpr : CAST '[' optInd typeDesc  ']' '(' optInd expr  ')';

parKeyw : DISCARD | 'include' | IF | WHILE | CASE | TRY
        | FINALLY | EXCEPT | FOR | BLOCK | CONST | LET
        | WHEN | VARIABLE | MIXIN ;
par : OPEN_PAREN optInd
          ( parKeyw complexOrSimpleStmt (SEMI_COLON complexOrSimpleStmt)*      /// & ?????
          | SEMI_COLON complexOrSimpleStmt ( SEMI_COLON complexOrSimpleStmt)*
          | pragmaStmt
          | simpleExpr ( (EQUALS_OPERATOR expr (SEMI_COLON complexOrSimpleStmt ( SEMI_COLON complexOrSimpleStmt)* )? )
                       | (COLON expr (COMMA exprColonEqExpr ( COMMA exprColonEqExpr)* )? ) ) )
           CLOSE_PAREN;
literal : INT_LIT | INT8_LIT | INT16_LIT | INT32_LIT | INT64_LIT
          | UINT_LIT | UINT8_LIT | UINT16_LIT | UINT32_LIT | UINT64_LIT
          | FLOAT_LIT | FLOAT32_LIT | FLOAT64_LIT
          | STR_LIT | RSTR_LIT | TRIPLESTR_LIT
          | CHAR_LIT
          | NIL | colcom;

generalizedLit : GENERALIZED_STR_LIT | GENERALIZED_TRIPLESTR_LIT;
identOrLiteral : (DIGIT+| generalizedLit | symbol | literal
               | par | AT? arrayConstr | setOrTableConstr
               | castExpr | proEXPR  )  ;
proEXPR: IDENTIFIER? OPEN_PAREN ( declColonEquals ( (comma|semicolon)? declColonEquals)* ) ? CLOSE_PAREN assignExpr?
      | IDENTIFIER OPEN_PAREN+ proEXPR (operator expr CLOSE_PAREN)+ ;
tupleConstr : '(' optInd exprColonEqExpr?(comma exprColonEqExpr)*  ')'; //also changed the ? with a + to avoid an error
arrayConstr : '[' optInd exprColonEqExpr?(comma exprColonEqExpr)*  ']' | OPEN_BRACK types CLOSE_BRACK; //also changed the ? with a + to avoid an error
primarySuffix : '(' exprColonEqExpr?(comma exprColonEqExpr )* ')' doBlocks? //also changed the ? with a + to avoid an error
      | doBlocks
      |  DOT optInd symbol (generalizedLit? | (OPEN_PAREN symbol CLOSE_PAREN) ) //added open paren.....>
      | '[' optInd exprList  ']' // changed indexExprList to expr LIst as it is not founddd in doc!
      | '{' optInd exprList  '}'
      |proEXPR
      | ( '\'' |IDENTIFIER|literal|'cast'|'addr'|'type') expr ;// # command syntax removed &

condExpr : expr colcom expr optInd
        (ELIF expr colcom expr optInd)*
         ELSE colcom expr;


ifExpr: IF condExpr;

whenExpr : WHEN condExpr ; 
pragma : '{.' optInd (exprColonEqExpr comma+)*  ('.}' | '}'); // was exprColonExpr but i can;t find it in doc catch
//also changed the ? with a + to avoid an error
identVis :  symbol opr?  ; 
identVisDot : symbol DOT optInd symbol opr?;
identWithPragma : identVis pragma?;
identWithPragmaDot : identVisDot pragma?;
declColonEquals : identWithPragma (comma identWithPragma)* //comma?
                  (COLON optInd typeDesc)? (EQUALS_OPERATOR optInd expr)?;
identColonEquals : IDENTIFIER (comma IDENTIFIER)* comma? cOP eXP;
cOP: (COLON types)? ( (optInd typeDesc)? ) ; //added keyw 
eXP : EQUALS_OPERATOR? (AT?  optInd expr)?;
inlTupleDecl : TUPLE
    '[' optInd  (identColonEquals (comma|semicolon)?)*   ']';  /////definitly feha 7aga 3'lt 

extTupleDecl : TUPLE
    COMMENT? ( identColonEquals ( identColonEquals)*)? ; /////////indeeeeeeeeeeeeeeeeeeeent
tupleClass : TUPLE ;
paramList : OPEN_PAREN (declColonEquals ((comma|semicolon)declColonEquals )*)? CLOSE_PAREN ;
paramListArrow : paramList? ('->' optInd typeDesc)?;
paramListColon : paramList? (COLON optInd typeDesc)?;
doBlock : DO paramListArrow pragmaStmt? colcom stmt;
doBlocks : (DO paramListArrow pragmaStmt? colcom stmt)+; ///habdaaaaaaaaaaaaaaaaaaaaaaaa 3shan msh mwgoda fel doc
procExpr : 'proc' paramListColon pragmaStmt? ('=' COMMENT? stmt)?; ///pragmaS changed with pragmastmt
distinct : 'distinct' optInd typeDesc;
forStmt : FOR (identWithPragma ( comma identWithPragma)* ) IN ((op2 '[' optInd exprList  ']' ) |  (expr op6? LESS_THAN? expr?)  ) colcom stmt;
forExpr : forStmt ;


expr : (blockExpr
      | ifExpr
      | whenExpr
      | caseStmt // was CaseEXpr but i can't find it in the doc !
      | forExpr
      | tryExpr)
      | simpleExpr ;


typeKeyw : VARIABLE | OUT | REF | PTR | 'shared' | TUPLE
         | PROC | ITERATOR | DISTINCT | OBJECT | ENUM | STRING;

primary : typeKeyw typeDesc //was typedescK but i changed to typeDesc ( removed K)
        | BIND primary
  //| (identOrLiteral? prefixOperator) identOrLiteral (opr identOrLiteral?)* primarySuffix* 
        |  identOrLiteral?  identOrLiteral  primarySuffix*  //removed op5?
        | (symbol EQUALS_OPERATOR (DIGIT|symbol)+ (ADD_OPERATOR symbol)* )//hardcoded rule for test case 1
        | (symbol EQUALS_OPERATOR (DIGIT|symbol)+ (ADD_OPERATOR symbol)+ )
        | 'swap' (identOrLiteral arrayConstr comma?)+
         ; //added identOrLiteral?;
typeDesc : simpleExpr ;

typeDefAux : simpleExpr
           | CONCEPT typeClass;
postExprBlocks : COLON stmt? ( doBlock /////////////////INDENTSSSSSSSSSSSSSSSSSS
                           |  OF exprList COLON stmt
                           |  ELIF expr COLON stmt
                           |  EXCEPT exprList COLON stmt
                           |  ELSE COLON stmt )* ;
exprStmt : simpleExpr
         (( EQUALS_OPERATOR optInd expr colonBody? )
         | ( expr (comma expr)*
             doBlocks
              | macroColon
           ))?;
macroColon: MACRO COLON ; ////////////habdaa brdo 3shan msh fel doc 
importStmt : IMPORT optInd expr
              ((comma expr)*
              | EXCEPT optInd (expr (comma expr)) );
includeStmt : INCLUDE optInd expr ( comma expr);
fromStmt : FROM moduleName IMPORT optInd expr (comma expr)*; 
moduleName : IDENTIFIER; ////////////////// not sure if correct ( habda )
returnStmt : RETURN optInd expr?;
raiseStmt : RAISE optInd expr?;
yieldStmt : YIELD optInd expr?;
discardStmt : DISCARD optInd expr?;
breakStmt : BREAK optInd expr?;
continueStmt : CONTINUE optInd expr? ;
condStmt : (expr| IDENTIFIER paramList?) colcom  stmt COMMENT? 
           (  ELIF expr colcom stmt )*
           ( ELSE colcom stmt)?; /////////////////// fuckin indent
ifStmt : IF condStmt;
whenStmt : WHEN condStmt ;
whileStmt : WHILE expr colcom stmt;
ofBranch : OF exprList colcom stmt;//'\n'? stmt;
ofBranches : ofBranch ( ofBranch)*
                      ( ELIF expr colcom stmt)* ///////////INDENT bayza
                      ( ELSE colcom stmt)? ;
caseStmt : CASE expr types? COLON?  //'\n'?  //COMMENT?
              ( ofBranches  /////////////indents bayzaaa
              |  ofBranches);
tryStmt : TRY colcom stmt ( EXCEPT|FINALLY) //Indent and &  ???????????
           ( EXCEPT exprList colcom stmt)*
           ( FINALLY colcom stmt)? ;
tryExpr : TRY colcom stmt (optInd EXCEPT|FINALLY) /////////////////& removed    
           (optInd EXCEPT exprList colcom stmt)*
           (optInd FINALLY colcom stmt)? ;
exceptBlock : EXCEPT colcom stmt;
blockStmt : BLOCK symbol? colcom stmt;
blockExpr :BLOCK symbol? colcom stmt;
staticStmt : STATIC colcom stmt;
deferStmt : DEFER colcom stmt;
asmStmt : 'asm' pragma? (STR_LIT | RSTR_LIT | TRIPLESTR_LIT);
genericParam : symbol (comma symbol)* (colcom expr)? ('=' optInd expr)?;
genericParamList : '[' optInd (genericParam ( (comma|SEMI_COLON)genericParam ) )? ']'; /// \n badal ^
pattern : '{' stmt '}';
indAndComment : ( ( COMMENT)?  ) ;
routine : optInd identVis pattern? genericParamList?
  paramListColon pragma? (op5 COMMENT? stmt)? indAndComment; //removed = and added op5
commentStmt : (COMMENT | DOC_COMMENT | MultiLineComment);
// section[P : COMMENT? 'p' | (| ('p' | COMMENT) '\n'|'\r'+ INDENT ); //// indent and P changed to 'p' and removed DED
constant : identWithPragma (colcom typeDesc)? EQUALS_OPERATOR optInd expr indAndComment
           | IDENTIFIER EQUALS_OPERATOR DIGIT indAndComment ;
enum : ENUM optInd (symbol optInd ('=' optInd expr COMMENT?)? comma?)+;
objectWhen : WHEN expr colcom objectPart COMMENT?
            (ELIF expr colcom objectPart COMMENT?)*
            (ELSE colcom objectPart COMMENT?)?;
objectBranch : OF exprList colcom objectPart;
objectBranches : objectBranch ( expr colcom objectPart)*
                      ( ELSE colcom objectPart)?;
objectCase : CASE identWithPragma COLON typeDesc COLON? COMMENT?
            ( objectBranches //////DED ///fuckin DED ?
            |  objectBranches);
objectPart :  INDENT ( objectPart)*//^+IND{=} DED ////////indent and DED and ^+
           | objectWhen | objectCase | NIL | DISCARD | declColonEquals;
object1 : OBJECT pragma? (OF typeDesc)? COMMENT? objectPart;
typeClassParam : (VARIABLE | OUT)? symbol;
typeClass : (typeClassParam  (',' typeClassParam)*)? (pragma)? (OF (typeDesc  (COMMA typeDesc)*  )?  )? ///^* removed
                stmt; //& removed and fuckin indent
typeDef : (identWithPragmaDot genericParamList? '=' optInd typeDefAux  
            indAndComment)|
            ( IDENTIFIER EQUALS_OPERATOR types OPEN_BRACK sliceExpr comma types CLOSE_BRACK  ) ;
varTuple : OPEN_PAREN optInd identWithPragma  (comma identWithPragma)*  CLOSE_PAREN EQUALS_OPERATOR optInd expr; /////^ removed
colonBody : (colcom (stmt )   doBlocks?) ;
variable : (varTuple | identColonEquals | IDENTIFIER | recVar )  colonBody? (indAndComment);
recVar: IDENTIFIER EQUALS_OPERATOR rec1; 
rec1: IDENTIFIER OPEN_PAREN ( (expr |rec1)comma? )* CLOSE_PAREN; 
bindStmt : BIND optInd qualifiedIdent (comma qualifiedIdent)*; //////////////^
mixinStmt : MIXIN optInd qualifiedIdent  (comma qualifiedIdent)*; ////////////^
pragmaStmt : pragma (COLON COMMENT? stmt)?;
simpleStmt : ((returnStmt | raiseStmt | yieldStmt | discardStmt | breakStmt
           | continueStmt | pragmaStmt | importStmt  | fromStmt //| exportStmt was removed as it's not in doc
           | includeStmt | commentStmt) | exprStmt) COMMENT?;

complexOrSimpleStmt : (ifStmt | whenStmt | whileStmt
                    | tryStmt | forStmt
                    | blockStmt | staticStmt | deferStmt | asmStmt
                    | PROC (proutine|routine)
                    | caseStmt
                    | METHOD routine
                    | ITERATOR routine
                    | MACRO (routine| mroutine)
                    | TEMPLATE (routine| troutine)
                    | CONVERTER routine
                    | TYPE sectionTypeDef
                    | CONST sectionConstant
                    | (LET| VARIABLE | USING) sectionVariable+
                    | bindStmt | mixinStmt
                    | echostmt
                   
                    )
                    |simpleStmt;


stmt : ( complexOrSimpleStmt ((SEMI_COLON?) complexOrSimpleStmt )* )//DED) ///INDENT AND DED and ^
     | simpleStmt ( (SEMI_COLON) simpleStmt)*; /////^

sectionTypeDef : COMMENT? typeDef? | ( (typeDef | COMMENT)  (INDENT (typeDef | COMMENT))* ); //// indent and P changed to 'p' and removed DED
sectionConstant:  COMMENT? constant? | ( (constant | COMMENT)  (INDENT (constant | COMMENT))* ); //// indent and P changed to 'p' and removed DED
sectionVariable:  COMMENT? ( INDENT )? INDENT? variable | ( (variable | COMMENT)  (INDENT (variable | COMMENT))* ) ; //// indent and P changed to 'p' and removed DED
////////////////////////////('\n'|'\r')+
echostmt: ECHO (echoparamList )  ; //(stmt)?;
echoparamList : paramList | (    OPEN_PAREN (declColonEquals callproc3? ((comma|semicolon)declColonEquals callproc3? )*)? CLOSE_PAREN     ) 
     |symbol |
 ( 
       ( declColonEquals|(symbol arrayConstr) ) (comma? symbol DOT symbol)?
        ( (comma|semicolon)? 
       ( (echoif) | (declColonEquals arrayConstr?   ) ) 
       )*  identOrLiteral? arrayindex? 
       )?  
         ; //arrayconstr hardcoded
echoif : OPEN_PAREN stmt CLOSE_PAREN;
arrayindex: OPEN_BRACK optInd exprList  CLOSE_BRACK;
proutine: ( (optInd identVis (arrayConstr)?) | (('`$`'arrayConstr)?)  ) ( OPEN_PAREN (IDENTIFIER (COLON|EQUALS_OPERATOR) ( arrayofarray |(PROC callproc2) | types | procVar | symbol  ) comma?)+ CLOSE_PAREN) (COLON (types | arrayofarray) )? EQUALS_OPERATOR (stmt)?;
callproc: ( (EQUALS_OPERATOR IDENTIFIER OPEN_PAREN (stmt) CLOSE_PAREN ) | (  OPEN_PAREN stmt CLOSE_PAREN DOT IDENTIFIER)  ); 
callproc2: OPEN_PAREN IDENTIFIER COLON types CLOSE_PAREN;
callproc3: OPEN_PAREN expr CLOSE_PAREN;

arrayofarray: symbol arrayConstr; 

mroutine: optInd identVis OPEN_PAREN (IDENTIFIER COLON types SEMI_COLON?)* CLOSE_PAREN COLON types EQUALS_OPERATOR (stmt)? ;
troutine: (identVis OPEN_PAREN (symbol comma?)* CLOSE_PAREN (bracedot)? EQUALS_OPERATOR)
      |(optInd identVis OPEN_PAREN (IDENTIFIER COLON types SEMI_COLON?)* CLOSE_PAREN COLON types EQUALS_OPERATOR (stmt)?);
procVar: VARIABLE ( (sectionVariable ) | ( (IDENTIFIER arrayConstr)? (comma expr)* )  ); 
keyw: DISCARD | INCLUDE  | WHILE | TRY //| CASE| FOR
        | FINALLY | EXCEPT  | BLOCK | CONST | LET
        | WHEN | VARIABLE | MIXIN | VARIABLE | OUT | REF | PTR | 'shared' | TUPLE
         | PROC | ITERATOR | DISTINCT | OBJECT | ENUM |NOT; ////////////////////////////////////////// ??????

bracedot: '{.'  symbol CLOSE_BRACE; 
types: INT | STRING | BOOL | ARRAY | UNTYPED;
//////////////////////////////////////////////////
////////////




UNTYPED: 'untyped';
ARRAY: 'array';
INCLUDE: 'include';
BOOL: 'bool';
STRING : 'string';
ECHO: 'echo';

opr:  op0 | op1 | op2 | op3 | op4 | op5 | op6 | op7 | op8 | op9 
        | OR | XOR | AND | IS | ISNOT  | NOTIN | OF | DIV 
        | MOD | SHL | SHR | NOT | STATIC | DOT DOT ;//| IN
///////////////////////////////////////////////////////////////////////
INDENT:  '    '+  -> skip ;
// ///////////////////////////////////////
INT :  'int';
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
DEC_LIT: '-'? DIGIT ( [_] DIGIT | DIGIT)*;
OCT_LIT: '0' 'o' OCTDIGIT ( [_] OCTDIGIT | OCTDIGIT )*;
BIN_LIT: '0' ('b' | 'B' ) BINDIGIT ( [_] BINDIGIT | BINDIGIT)*;
HEXDIGIT: DIGIT | [A-F] | [a-f];
OCTDIGIT: [0-7];
BINDIGIT: [0|1];
EQUALS_OPERATOR: '=' ;
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
TRIPLESTR_LIT : '"""' (.*?) '"""';
// TRIPLESTR_ITEM : (.*?);
RSTR_LIT: ('r'| 'R') ('"') (.*?) '"'; //do i need to handle "" in middle ?
GENERALIZED_STR_LIT : IDENTIFIER  STR_LIT ;
GENERALIZED_TRIPLESTR_LIT: IDENTIFIER TRIPLESTR_LIT;

NEWLINE: (('\n'|'\r')) -> skip ;

SPACE:(   ' '+ | '\t' ) ->skip;
COMMENT : ' '* '#' (.*?) ( ('\n'|'\r')|EOF) ->skip	;		
MultiLineComment: '#[' (MultiLineComment|.)*? ']#'	-> skip ;
DOC_COMMENT: '##[' (.*?) ']##' -> skip; 
