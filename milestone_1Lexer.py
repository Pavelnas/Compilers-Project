# Generated from milestone_1.g4 by ANTLR 4.7.2
from antlr4 import *
from io import StringIO
from typing.io import TextIO
import sys



def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\n")
        buf.write("\\\b\1\4\2\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7")
        buf.write("\4\b\t\b\4\t\t\t\3\2\3\2\3\2\3\2\3\3\3\3\7\3\32\n\3\f")
        buf.write("\3\16\3\35\13\3\3\3\5\3 \n\3\3\3\3\3\3\4\3\4\3\4\3\4\3")
        buf.write("\4\7\4)\n\4\f\4\16\4,\13\4\3\4\3\4\3\4\3\4\3\4\3\5\6\5")
        buf.write("\64\n\5\r\5\16\5\65\3\5\6\59\n\5\r\5\16\5:\3\5\6\5>\n")
        buf.write("\5\r\5\16\5?\5\5B\n\5\3\6\3\6\3\7\3\7\3\7\3\7\5\7J\n\7")
        buf.write("\7\7L\n\7\f\7\16\7O\13\7\3\b\3\b\3\b\3\b\5\bU\n\b\3\t")
        buf.write("\3\t\3\t\3\t\3\t\3\t\4\33*\2\n\3\3\5\4\7\5\t\6\13\7\r")
        buf.write("\b\17\t\21\n\3\2\t\3\3\f\f\3\2C\\\3\2c|\3\2\u0082\u0101")
        buf.write("\3\2\62;\3\2aa\3\2((\2f\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3")
        buf.write("\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2")
        buf.write("\2\2\21\3\2\2\2\3\23\3\2\2\2\5\27\3\2\2\2\7#\3\2\2\2\t")
        buf.write("A\3\2\2\2\13C\3\2\2\2\rE\3\2\2\2\17T\3\2\2\2\21V\3\2\2")
        buf.write("\2\23\24\7\"\2\2\24\25\3\2\2\2\25\26\b\2\2\2\26\4\3\2")
        buf.write("\2\2\27\33\7%\2\2\30\32\13\2\2\2\31\30\3\2\2\2\32\35\3")
        buf.write("\2\2\2\33\34\3\2\2\2\33\31\3\2\2\2\34\37\3\2\2\2\35\33")
        buf.write("\3\2\2\2\36 \t\2\2\2\37\36\3\2\2\2 !\3\2\2\2!\"\b\3\3")
        buf.write("\2\"\6\3\2\2\2#$\7%\2\2$%\7]\2\2%*\3\2\2\2&)\5\7\4\2\'")
        buf.write(")\13\2\2\2(&\3\2\2\2(\'\3\2\2\2),\3\2\2\2*+\3\2\2\2*(")
        buf.write("\3\2\2\2+-\3\2\2\2,*\3\2\2\2-.\7_\2\2./\7%\2\2/\60\3\2")
        buf.write("\2\2\60\61\b\4\3\2\61\b\3\2\2\2\62\64\t\3\2\2\63\62\3")
        buf.write("\2\2\2\64\65\3\2\2\2\65\63\3\2\2\2\65\66\3\2\2\2\66B\3")
        buf.write("\2\2\2\679\t\4\2\28\67\3\2\2\29:\3\2\2\2:8\3\2\2\2:;\3")
        buf.write("\2\2\2;B\3\2\2\2<>\t\5\2\2=<\3\2\2\2>?\3\2\2\2?=\3\2\2")
        buf.write("\2?@\3\2\2\2@B\3\2\2\2A\63\3\2\2\2A8\3\2\2\2A=\3\2\2\2")
        buf.write("B\n\3\2\2\2CD\t\6\2\2D\f\3\2\2\2EM\5\t\5\2FI\t\7\2\2G")
        buf.write("J\5\t\5\2HJ\5\13\6\2IG\3\2\2\2IH\3\2\2\2JL\3\2\2\2KF\3")
        buf.write("\2\2\2LO\3\2\2\2MK\3\2\2\2MN\3\2\2\2N\16\3\2\2\2OM\3\2")
        buf.write("\2\2PU\t\b\2\2QR\7c\2\2RS\7p\2\2SU\7f\2\2TP\3\2\2\2TQ")
        buf.write("\3\2\2\2U\20\3\2\2\2VW\7x\2\2WX\7c\2\2XY\7t\2\2YZ\3\2")
        buf.write("\2\2Z[\5\r\7\2[\22\3\2\2\2\16\2\33\37(*\65:?AIMT\4\b\2")
        buf.write("\2\2\3\2")
        return buf.getvalue()


class milestone_1Lexer(Lexer):

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    SPACE = 1
    Comment = 2
    MultiLineComment = 3
    LETTER = 4
    DIGIT = 5
    IDENTIFIER = 6
    AND = 7
    VARIABLE = 8

    channelNames = [ u"DEFAULT_TOKEN_CHANNEL", u"HIDDEN" ]

    modeNames = [ "DEFAULT_MODE" ]

    literalNames = [ "<INVALID>",
 ]

    symbolicNames = [ "<INVALID>",
            "SPACE", "Comment", "MultiLineComment", "LETTER", "DIGIT", "IDENTIFIER", 
            "AND", "VARIABLE" ]

    ruleNames = [ "SPACE", "Comment", "MultiLineComment", "LETTER", "DIGIT", 
                  "IDENTIFIER", "AND", "VARIABLE" ]

    grammarFileName = "milestone_1.g4"

    def __init__(self, input=None, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.7.2")
        self._interp = LexerATNSimulator(self, self.atn, self.decisionsToDFA, PredictionContextCache())
        self._actions = None
        self._predicates = None


