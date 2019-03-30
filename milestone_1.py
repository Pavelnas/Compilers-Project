import argparse
from antlr4 import *
from Milestone1Lexer import Milestone1Lexer
from Milestone1Listener import Milestone1Listener
from Milestone1Parser import Milestone1Parser
from antlr4.tree.Trees import Trees


def get_token_type(token):
    if token.type == Milestone1Lexer.NEWLINE:
        return "NEWLINE"
    else:
        return "ERROR UNKNOWN TOKEN"


def main():
    with open("expr.txt", "r") as file:
        lines = file.read()
    input_stream = InputStream(lines)
    lexer = Milestone1Lexer(input_stream)
    token_stream = CommonTokenStream(lexer)
    parser = Milestone1Parser(token_stream)
    token = lexer.nextToken()

    while not token.type == Token.EOF:
        print(get_token_type(token), token.text)
        token = lexer.nextToken()


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=True, description='Sample Commandline')

    parser.add_argument('--file', action="store", help="path of file to take as input", nargs="?", metavar="file")

    args = parser.parse_args()

    print(args.file)

    main()
