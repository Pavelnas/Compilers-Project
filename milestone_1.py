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
        return "REG"
    # elif token.type == milestone_1Lexer.COMMAND:
    #     return "COMMAND"
    # elif token.type == milestone_1Lexer.MEMORY:
    #     return "MEMORY"
    # elif token.type == milestone_1Lexer.Space:
    #     return ""
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
