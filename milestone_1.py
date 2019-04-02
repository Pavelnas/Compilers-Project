import argparse
from antlr4 import *
from milestone_1Lexer import milestone_1Lexer
from milestone_1Listener import milestone_1Listener
from milestone_1Parser import milestone_1Parser
from antlr4.tree.Trees import Trees

def get_token_type(token):
    if token.type == milestone_1Lexer.Comment:
        return "Comment"
    elif token.type == milestone_1Lexer.MultiLineComment:
        return "MultiLineComment"
    elif token.type ==milestone_1Lexer.VARIABLE:
        return "VARIABLE"
    elif token.type ==milestone_1Lexer.LETTER:
        return "LETTER"
    elif token.type ==milestone_1Lexer.IDENTIFIER:
        return "IDENTIFIER"
    elif token.type ==milestone_1Lexer.AND:
        return "AND"
    elif token.type ==milestone_1Lexer.ADDR:
        return "ADDR"
    elif token.type ==milestone_1Lexer.AS:
        return "AS"
    elif token.type ==milestone_1Lexer.ASM:
        return "ASM"
    elif token.type ==milestone_1Lexer.BIND:
        return "BIND"
    elif token.type ==milestone_1Lexer.BLOCK:
        return "BLOCK"
    elif token.type ==milestone_1Lexer.BREAK:
        return "BREAK"
    elif token.type ==milestone_1Lexer.CASE:
        return "CASE"
    elif token.type ==milestone_1Lexer.CAST:
        return "CAST"
    elif token.type ==milestone_1Lexer.CONCEPT:
        return "CONCEPT"
    elif token.type ==milestone_1Lexer.CONST:
        return "CONST"
    elif token.type ==milestone_1Lexer.CONTINUE:
        return "CONTINUE"
    elif token.type ==milestone_1Lexer.CONVERTER:
        return "CONVERTER"
    elif token.type ==milestone_1Lexer.DEFER:
        return "DEFER"
    elif token.type ==milestone_1Lexer.DISCARD:
        return "DISCARD"
    elif token.type ==milestone_1Lexer.DISTINCT:
        return "DISTINCT"
    elif token.type ==milestone_1Lexer.DIV:
        return "DIV"
    elif token.type ==milestone_1Lexer.DO:
        return "DO"
    elif token.type ==milestone_1Lexer.ELIF:
        return "ELIF"
    elif token.type ==milestone_1Lexer.ELSE:
        return "ELSE"
    elif token.type ==milestone_1Lexer.END:
        return "END"
    elif token.type ==milestone_1Lexer.ENUM:
        return "ENUM"
    elif token.type ==milestone_1Lexer.EXCEPT:
        return "EXCEPT"
    elif token.type ==milestone_1Lexer.EXPORT:
        return "EXPORT"
    elif token.type ==milestone_1Lexer.FINALLY:
        return "FINALLY"
    elif token.type ==milestone_1Lexer.FOR:
        return "FOR"
    elif token.type ==milestone_1Lexer.FROM:
        return "FROM"
    elif token.type ==milestone_1Lexer.FUNC:
        return "FUNC"
    elif token.type ==milestone_1Lexer.IF:
        return "IF"
    elif token.type ==milestone_1Lexer.IMPORT:
        return "IMPORT"
    elif token.type ==milestone_1Lexer.IN:
        return "IN"
    elif token.type ==milestone_1Lexer.INTERFACE:
        return "INTERFACE"
    elif token.type ==milestone_1Lexer.IS:
        return "IS"
    elif token.type ==milestone_1Lexer.ISNOT:
        return "ISNOT"
    elif token.type ==milestone_1Lexer.ITERATOR:
        return "ITERATOR"
    elif token.type ==milestone_1Lexer.LET:
        return "LET"
    elif token.type ==milestone_1Lexer.MARCO:
        return "MARCO"
    elif token.type ==milestone_1Lexer.METHOD:
        return "METHOD"
    elif token.type ==milestone_1Lexer.MIXIN:
        return "MIXIN"
    elif token.type ==milestone_1Lexer.MOD:
        return "MOD"
    elif token.type ==milestone_1Lexer.NIL:
        return "NIL"
    elif token.type ==milestone_1Lexer.NOT:
        return "NOT"
    elif token.type ==milestone_1Lexer.NOTIN:
        return "NOTIN"
    elif token.type ==milestone_1Lexer.OBJECT:
        return "OBJECT"
    elif token.type ==milestone_1Lexer.OF:
        return "OF"
    elif token.type ==milestone_1Lexer.OR:
        return "OR"
    elif token.type ==milestone_1Lexer.OUT:
        return "OUT"
    elif token.type ==milestone_1Lexer.PROC:
        return "PROC"
    elif token.type ==milestone_1Lexer.PTR:
        return "PTR"
    elif token.type ==milestone_1Lexer.RAISE:
        return "RAISE"
    elif token.type ==milestone_1Lexer.REF:
        return "REF"
    elif token.type ==milestone_1Lexer.RETURN:
        return "RETURN"
    elif token.type ==milestone_1Lexer.SHL:
        return "SHL"
    elif token.type ==milestone_1Lexer.SHR:
        return "SHR"
    elif token.type ==milestone_1Lexer.STATIC:
        return "STATIC"
    elif token.type ==milestone_1Lexer.TEMPLATE:
        return "TEMPLATE"
    elif token.type ==milestone_1Lexer.TRY:
        return "TRY"
    elif token.type ==milestone_1Lexer.TUPLE:
        return "TUPLE"
    elif token.type ==milestone_1Lexer.TYPE:
        return "TYPE"
    elif token.type ==milestone_1Lexer.USING:
        return "USING"
    elif token.type ==milestone_1Lexer.WHEN:
        return "WHEN"
    elif token.type ==milestone_1Lexer.WHILE:
        return "WHILE"
    elif token.type ==milestone_1Lexer.XOR:
        return "XOR"

    else:
        return "ERROR UNKNOWN TOKEN"

def main():

    with open(args.file, "r") as file:
        lines = file.read()
    input_stream = InputStream(lines)
    lexer = milestone_1Lexer(input_stream)
    token_stream = CommonTokenStream(lexer)
    parser = milestone_1Parser(token_stream)

 #   tree = parser.start()
 #   print(Trees.toStringTree(tree,None, parser))

    token = lexer.nextToken()
    f= open("milestone_1_result.txt","w+")
    while not token.type == Token.EOF:
        f.write(get_token_type(token) +" "+ token.text)
        print(get_token_type(token), token.text)
        token = lexer.nextToken()
    f.close()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=True, description='Sample Commandline')

    parser.add_argument('--file', action="store", help="path of file to take as input", nargs="?", metavar="file")

    args = parser.parse_args()

    print(args.file)

    main()
