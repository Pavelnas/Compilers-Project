# Generated from milestone_1.g4 by ANTLR 4.5.3
from antlr4 import *
from io import StringIO


def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\2\5")
        buf.write("\65\b\1\4\2\t\2\4\3\t\3\4\4\t\4\3\2\3\2\7\2\f\n\2\f\2")
        buf.write("\16\2\17\13\2\3\2\5\2\22\n\2\3\2\3\2\3\3\3\3\3\3\3\3\3")
        buf.write("\3\7\3\33\n\3\f\3\16\3\36\13\3\3\3\3\3\3\3\3\3\3\3\3\4")
        buf.write("\6\4&\n\4\r\4\16\4\'\3\4\6\4+\n\4\r\4\16\4,\3\4\6\4\60")
        buf.write("\n\4\r\4\16\4\61\5\4\64\n\4\4\r\34\2\5\3\3\5\4\7\5\3\2")
        buf.write("\6\3\3\f\f\3\2C\\\3\2c|\3\2\u0082\u0101<\2\3\3\2\2\2\2")
        buf.write("\5\3\2\2\2\2\7\3\2\2\2\3\t\3\2\2\2\5\25\3\2\2\2\7\63\3")
        buf.write("\2\2\2\t\r\7%\2\2\n\f\13\2\2\2\13\n\3\2\2\2\f\17\3\2\2")
        buf.write("\2\r\16\3\2\2\2\r\13\3\2\2\2\16\21\3\2\2\2\17\r\3\2\2")
        buf.write("\2\20\22\t\2\2\2\21\20\3\2\2\2\22\23\3\2\2\2\23\24\b\2")
        buf.write("\2\2\24\4\3\2\2\2\25\26\7%\2\2\26\27\7]\2\2\27\34\3\2")
        buf.write("\2\2\30\33\5\5\3\2\31\33\13\2\2\2\32\30\3\2\2\2\32\31")
        buf.write("\3\2\2\2\33\36\3\2\2\2\34\35\3\2\2\2\34\32\3\2\2\2\35")
        buf.write("\37\3\2\2\2\36\34\3\2\2\2\37 \7_\2\2 !\7%\2\2!\"\3\2\2")
        buf.write("\2\"#\b\3\2\2#\6\3\2\2\2$&\t\3\2\2%$\3\2\2\2&\'\3\2\2")
        buf.write("\2\'%\3\2\2\2\'(\3\2\2\2(\64\3\2\2\2)+\t\4\2\2*)\3\2\2")
        buf.write("\2+,\3\2\2\2,*\3\2\2\2,-\3\2\2\2-\64\3\2\2\2.\60\t\5\2")
        buf.write("\2/.\3\2\2\2\60\61\3\2\2\2\61/\3\2\2\2\61\62\3\2\2\2\62")
        buf.write("\64\3\2\2\2\63%\3\2\2\2\63*\3\2\2\2\63/\3\2\2\2\64\b\3")
        buf.write("\2\2\2\13\2\r\21\32\34\',\61\63\3\2\3\2")
        return buf.getvalue()


class milestone_1Lexer(Lexer):

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]


    Comment = 1
    MultiLineComment = 2
    Letter = 3

    modeNames = [ "DEFAULT_MODE" ]

    literalNames = [ "<INVALID>",
 ]

    symbolicNames = [ "<INVALID>",
            "Comment", "MultiLineComment", "Letter" ]

    ruleNames = [ "Comment", "MultiLineComment", "Letter" ]

    grammarFileName = "milestone_1.g4"

    def __init__(self, input=None):
        super().__init__(input)
        self.checkVersion("4.5.3")
        self._interp = LexerATNSimulator(self, self.atn, self.decisionsToDFA, PredictionContextCache())
        self._actions = None
        self._predicates = None


