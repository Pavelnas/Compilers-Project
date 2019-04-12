import argparse
from antlr4 import *
from milestone_2Lexer import milestone_2Lexer
from milestone_2Listener import milestone_2Listener
from milestone_2Parser import milestone_2Parser
from antlr4.tree.Trees import Trees

def get_token_type(token):
    if token.type == milestone_2Lexer.COMMENT:
        return "Comment"
    elif token.type == milestone_2Lexer.MultiLineComment:
        return "MultiLineComment"
    elif token.type ==milestone_2Lexer.VARIABLE:
        return "VARIABLE"
    elif token.type ==milestone_2Lexer.DIGIT:
        return "DIGIT"
    elif token.type ==milestone_2Lexer.LETTER:
        return "LETTER"
    # ########################
    elif token.type ==milestone_2Lexer.AND:
        return "AND"
    elif token.type ==milestone_2Lexer.ADDR:
        return "ADDR"
    elif token.type ==milestone_2Lexer.AS:
        return "AS"
    elif token.type ==milestone_2Lexer.ASM:
        return "ASM"
    elif token.type ==milestone_2Lexer.BIND:
        return "BIND"
    elif token.type ==milestone_2Lexer.BLOCK:
        return "BLOCK"
    elif token.type ==milestone_2Lexer.BREAK:
        return "BREAK"
    elif token.type ==milestone_2Lexer.CASE:
        return "CASE"
    elif token.type ==milestone_2Lexer.CAST:
        return "CAST"
    elif token.type ==milestone_2Lexer.CONCEPT:
        return "CONCEPT"
    elif token.type ==milestone_2Lexer.CONST:
        return "CONST"
    elif token.type ==milestone_2Lexer.CONTINUE:
        return "CONTINUE"
    elif token.type ==milestone_2Lexer.CONVERTER:
        return "CONVERTER"
    elif token.type ==milestone_2Lexer.DEFER:
        return "DEFER"
    elif token.type ==milestone_2Lexer.DISCARD:
        return "DISCARD"
    elif token.type ==milestone_2Lexer.DISTINCT:
        return "DISTINCT"
    elif token.type ==milestone_2Lexer.DIV:
        return "DIV"
    elif token.type ==milestone_2Lexer.DO:
        return "DO"
    elif token.type ==milestone_2Lexer.ELIF:
        return "ELIF"
    elif token.type ==milestone_2Lexer.ELSE:
        return "ELSE"
    elif token.type ==milestone_2Lexer.END:
        return "END"
    elif token.type ==milestone_2Lexer.ENUM:
        return "ENUM"
    elif token.type ==milestone_2Lexer.EXCEPT:
        return "EXCEPT"
    elif token.type ==milestone_2Lexer.EXPORT:
        return "EXPORT"
    elif token.type ==milestone_2Lexer.FINALLY:
        return "FINALLY"
    elif token.type ==milestone_2Lexer.FOR:
        return "FOR"
    elif token.type ==milestone_2Lexer.FROM:
        return "FROM"
    elif token.type ==milestone_2Lexer.FUNC:
        return "FUNC"
    elif token.type ==milestone_2Lexer.IF:
        return "IF"
    elif token.type ==milestone_2Lexer.IMPORT:
        return "IMPORT"
    elif token.type ==milestone_2Lexer.IN:
        return "IN"
    elif token.type ==milestone_2Lexer.INTERFACE:
        return "INTERFACE"
    elif token.type ==milestone_2Lexer.IS:
        return "IS"
    elif token.type ==milestone_2Lexer.ISNOT:
        return "ISNOT"
    elif token.type ==milestone_2Lexer.ITERATOR:
        return "ITERATOR"
    elif token.type ==milestone_2Lexer.LET:
        return "LET"
    elif token.type ==milestone_2Lexer.MACRO:
        return "MACRO"
    elif token.type ==milestone_2Lexer.METHOD:
        return "METHOD"
    elif token.type ==milestone_2Lexer.MIXIN:
        return "MIXIN"
    elif token.type ==milestone_2Lexer.MOD:
        return "MOD"
    elif token.type ==milestone_2Lexer.NIL:
        return "NIL"
    elif token.type ==milestone_2Lexer.NOT:
        return "NOT"
    elif token.type ==milestone_2Lexer.NOTIN:
        return "NOTIN"
    elif token.type ==milestone_2Lexer.OBJECT:
        return "OBJECT"
    elif token.type ==milestone_2Lexer.OF:
        return "OF"
    elif token.type ==milestone_2Lexer.OR:
        return "OR"
    elif token.type ==milestone_2Lexer.OUT:
        return "OUT"
    elif token.type ==milestone_2Lexer.PROC:
        return "PROC"
    elif token.type ==milestone_2Lexer.PTR:
        return "PTR"
    elif token.type ==milestone_2Lexer.RAISE:
        return "RAISE"
    elif token.type ==milestone_2Lexer.REF:
        return "REF"
    elif token.type ==milestone_2Lexer.RETURN:
        return "RETURN"
    elif token.type ==milestone_2Lexer.SHL:
        return "SHL"
    elif token.type ==milestone_2Lexer.SHR:
        return "SHR"
    elif token.type ==milestone_2Lexer.STATIC:
        return "STATIC"
    elif token.type ==milestone_2Lexer.TEMPLATE:
        return "TEMPLATE"
    elif token.type ==milestone_2Lexer.TRY:
        return "TRY"
    elif token.type ==milestone_2Lexer.TUPLE:
        return "TUPLE"
    elif token.type ==milestone_2Lexer.TYPE:
        return "TYPE"
    elif token.type ==milestone_2Lexer.USING:
        return "USING"
    elif token.type ==milestone_2Lexer.WHEN:
        return "WHEN"
    elif token.type ==milestone_2Lexer.WHILE:
        return "WHILE"
    elif token.type ==milestone_2Lexer.XOR:
        return "XOR"

    ##################
    
    elif token.type ==milestone_2Lexer.IDENTIFIER:
        return "IDENTIFIER"
    elif token.type ==milestone_2Lexer.SPACE: #to be removed later 
        return "Space"
    elif token.type == milestone_2Lexer.YIELD:
        return "YIELD"
    elif token.type == milestone_2Lexer.INT_LIT:
        return "INT_LIT"
    elif token.type == milestone_2Lexer.HEX_LIT:
        return "HEX_LIT"
    elif token.type == milestone_2Lexer.DEC_LIT:
        return "DEC_LIT"
    elif token.type == milestone_2Lexer.OCT_LIT:
        return "OCT_LIT"
    elif token.type == milestone_2Lexer.BIN_LIT:
        return "BIN_LIT"
    elif token.type == milestone_2Lexer.INT8_LIT:
        return "INT8_LIT"
    elif token.type == milestone_2Lexer.INT16_LIT:
        return "INT16_LIT"
    elif token.type == milestone_2Lexer.INT32_LIT:
        return "INT32_LIT"
    elif token.type == milestone_2Lexer.INT64_LIT:
        return "INT64_LIT"
    elif token.type == milestone_2Lexer.UINT_LIT:
        return "UINT_LIT"
    elif token.type == milestone_2Lexer.UINT8_LIT:
        return "UINT8_LIT"
    elif token.type == milestone_2Lexer.UINT16_LIT:
        return "UINT16_LIT"
    elif token.type == milestone_2Lexer.UINT32_LIT:
        return "UINT32_LIT"
    elif token.type == milestone_2Lexer.UINT64_LIT:
        return "UINT64_LIT"
    elif token.type == milestone_2Lexer.EXP:
        return "EXP"
    elif token.type == milestone_2Lexer.FLOAT_LIT:
        return "FLOAT_LIT"
    elif token.type == milestone_2Lexer.FLOAT32_LIT:
        return "FLOAT32_LIT"
    elif token.type == milestone_2Lexer.FLOAT64_LIT:
        return "FLOAT64_LIT"
    elif token.type == milestone_2Lexer.FLOAT64_LIT:
        return "FLOAT64_LIT"
    elif token.type == milestone_2Lexer.FLOAT32_SUFFIX:
        return "FLOAT32_SUFFIX"
    elif token.type == milestone_2Lexer.FLOAT64_SUFFIX:
        return "FLOAT64_SUFFIX"
    elif token.type == milestone_2Lexer.EQUALS_OPERATOR:
        return "EQUALS_OPERATOR"
    elif token.type == milestone_2Lexer.MUL_OPERATOR:
        return "MUL_OPERATOR"
    elif token.type == milestone_2Lexer.ADD_OPERATOR:
        return "ADD_OPERATOR"
    elif token.type == milestone_2Lexer.MINUS_OPERATOR:
        return "MINUS_OPERATOR"
    elif token.type == milestone_2Lexer.DIV_OPERATOR:
        return "DIV_OPERATOR"
    elif token.type == milestone_2Lexer.BITWISE_NOT_OPERATOR:
        return "BITWISE_NOT_OPERATOR"
    elif token.type == milestone_2Lexer.AND_OPERATOR:
        return "AND_OPERATOR"
    elif token.type == milestone_2Lexer.LESS_THAN:
        return "LESS_THAN"
    elif token.type == milestone_2Lexer.GREATER_THAN:
        return "GREATER_THAN"
    elif token.type == milestone_2Lexer.OR_OPERATOR:
        return "OR_OPERATOR"
    elif token.type == milestone_2Lexer.AT:
        return "AT"
    elif token.type == milestone_2Lexer.MODULUS:
        return "MODULUS"
    elif token.type == milestone_2Lexer.NOT_OPERATOR:
        return "NOT_OPERATOR"
    elif token.type == milestone_2Lexer.XOR_OPERATOR:
        return "XOR_OPERATOR"
    elif token.type == milestone_2Lexer.DOT:
        return "DOT"
    elif token.type == milestone_2Lexer.COLON:
        return "COLON"
    elif token.type == milestone_2Lexer.OPEN_PAREN:
        return "OPEN_PAREN"
    elif token.type == milestone_2Lexer.CLOSE_PAREN:
        return "CLOSE_PAREN"
    elif token.type == milestone_2Lexer.OPEN_BRACE:
        return "OPEN_BRACE"
    elif token.type == milestone_2Lexer.CLOSE_BRACE:
        return "CLOSE_BRACE"
    elif token.type == milestone_2Lexer.OPEN_BRACK:
        return "OPEN_BRACK"
    elif token.type == milestone_2Lexer.CLOSE_BRACK:
        return "CLOSE_BRACK"
    elif token.type == milestone_2Lexer.COMMA:
        return "COMMA"
    elif token.type == milestone_2Lexer.SEMI_COLON:
        return "SEMI_COLON"
    elif token.type == milestone_2Lexer.STR_LIT:
        return "STR_LIT"
    elif token.type == milestone_2Lexer.CHAR_LIT:
        return "CHAR_LIT"
    elif token.type == milestone_2Lexer.TRIPLESTR_LIT:
        return "TRIPLESTR_LIT"
    elif token.type == milestone_2Lexer.RSTR_LIT:
        return "RSTR_LIT"
    elif token.type == milestone_2Lexer.GENERALIZED_STR_LIT:
        return "GENERALIZED_STR_LIT"
    elif token.type == milestone_2Lexer.GENERALIZED_TRIPLESTR_LIT:
        return "GENERALIZED_TRIPLESTR_LIT"
    elif token.type == milestone_2Lexer.INDENT:
        return "INDENT"

    else:
        return "ERROR UNKNOWN TOKEN"

def main():

    with open(args.file, "r") as file:
        lines = file.read()
    input_stream = InputStream(lines)
    lexer = milestone_2Lexer(input_stream)
    token_stream = CommonTokenStream(lexer)
    parser = milestone_2Parser(token_stream)

 #   tree = parser.start()
 #   print(Trees.toStringTree(tree,None, parser))

    token = lexer.nextToken()
    f= open("milestone_1_result.txt","w+")
    while not token.type == Token.EOF:
        f.write(get_token_type(token) +"  "+ token.text +"\n")
        print(token.text, get_token_type(token))
        token = lexer.nextToken()
    f.close()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=True, description='Sample Commandline')

    parser.add_argument('--file', action="store", help="path of file to take as input", nargs="?", metavar="file")

    args = parser.parse_args()

    print(args.file)
	
    main()	