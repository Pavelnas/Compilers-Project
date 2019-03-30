# Generated from Milestone1.g4 by ANTLR 4.7.2
from antlr4 import *
from io import StringIO
from typing.io import TextIO
import sys



def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\4")
        buf.write("\20\b\1\4\2\t\2\4\3\t\3\3\2\6\2\t\n\2\r\2\16\2\n\3\3\3")
        buf.write("\3\3\3\3\3\2\2\4\3\3\5\4\3\2\3\4\2\f\f\17\17\2\20\2\3")
        buf.write("\3\2\2\2\2\5\3\2\2\2\3\b\3\2\2\2\5\f\3\2\2\2\7\t\t\2\2")
        buf.write("\2\b\7\3\2\2\2\t\n\3\2\2\2\n\b\3\2\2\2\n\13\3\2\2\2\13")
        buf.write("\4\3\2\2\2\f\r\7\"\2\2\r\16\3\2\2\2\16\17\b\3\2\2\17\6")
        buf.write("\3\2\2\2\4\2\n\3\b\2\2")
        return buf.getvalue()


class Milestone1Lexer(Lexer):

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    NEWLINE = 1
    SPACE = 2

    channelNames = [ u"DEFAULT_TOKEN_CHANNEL", u"HIDDEN" ]

    modeNames = [ "DEFAULT_MODE" ]

    literalNames = [ "<INVALID>",
 ]

    symbolicNames = [ "<INVALID>",
            "NEWLINE", "SPACE" ]

    ruleNames = [ "NEWLINE", "SPACE" ]

    grammarFileName = "Milestone1.g4"

    def __init__(self, input=None, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.7.2")
        self._interp = LexerATNSimulator(self, self.atn, self.decisionsToDFA, PredictionContextCache())
        self._actions = None
        self._predicates = None


