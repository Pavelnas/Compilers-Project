# Generated from milestone_1.g4 by ANTLR 4.7.2
# encoding: utf-8
from antlr4 import *
from io import StringIO
from typing.io import TextIO
import sys


def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3H")
        buf.write("\7\4\2\t\2\3\2\3\2\3\2\2\2\3\2\2\3\3\2\4\5\2\5\2\4\3\2")
        buf.write("\2\2\4\5\t\2\2\2\5\3\3\2\2\2\2")
        return buf.getvalue()


class milestone_1Parser ( Parser ):

    grammarFileName = "milestone_1.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                     "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                     "'addr'", "'as'", "'asm'", "'bind'", "'block'", "'break'", 
                     "'case'", "'cast'", "'concept'", "'const'", "'continue'", 
                     "'converter'", "'defer'", "'discard'", "'distinct'", 
                     "'div'", "'do'", "'elif'", "'else'", "'end'", "'enum'", 
                     "'except'", "'export'", "'finally'", "'for'", "'from'", 
                     "'func'", "'if'", "'import'", "'in'", "'interface'", 
                     "'is'", "'isnot'", "'iterator'", "'let'", "'marco'", 
                     "'method'", "'mixin'", "'mod'", "'nil'", "'not'", "'notin'", 
                     "'object'", "'of'", "'or'", "'out'", "'proc'", "'ptr'", 
                     "'raise'", "'ref'", "'return'", "'shl'", "'shr'", "'static'", 
                     "'template'", "'try'", "'tuple'", "'type'", "'using'", 
                     "'when'", "'while'", "'xor'" ]

    symbolicNames = [ "<INVALID>", "SPACE", "Comment", "MultiLineComment", 
                      "LETTER", "DIGIT", "AND", "VARIABLE", "ADDR", "AS", 
                      "ASM", "BIND", "BLOCK", "BREAK", "CASE", "CAST", "CONCEPT", 
                      "CONST", "CONTINUE", "CONVERTER", "DEFER", "DISCARD", 
                      "DISTINCT", "DIV", "DO", "ELIF", "ELSE", "END", "ENUM", 
                      "EXCEPT", "EXPORT", "FINALLY", "FOR", "FROM", "FUNC", 
                      "IF", "IMPORT", "IN", "INTERFACE", "IS", "ISNOT", 
                      "ITERATOR", "LET", "MARCO", "METHOD", "MIXIN", "MOD", 
                      "NIL", "NOT", "NOTIN", "OBJECT", "OF", "OR", "OUT", 
                      "PROC", "PTR", "RAISE", "REF", "RETURN", "SHL", "SHR", 
                      "STATIC", "TEMPLATE", "TRY", "TUPLE", "TYPE", "USING", 
                      "WHEN", "WHILE", "XOR", "IDENTIFIER" ]

    RULE_start = 0

    ruleNames =  [ "start" ]

    EOF = Token.EOF
    SPACE=1
    Comment=2
    MultiLineComment=3
    LETTER=4
    DIGIT=5
    AND=6
    VARIABLE=7
    ADDR=8
    AS=9
    ASM=10
    BIND=11
    BLOCK=12
    BREAK=13
    CASE=14
    CAST=15
    CONCEPT=16
    CONST=17
    CONTINUE=18
    CONVERTER=19
    DEFER=20
    DISCARD=21
    DISTINCT=22
    DIV=23
    DO=24
    ELIF=25
    ELSE=26
    END=27
    ENUM=28
    EXCEPT=29
    EXPORT=30
    FINALLY=31
    FOR=32
    FROM=33
    FUNC=34
    IF=35
    IMPORT=36
    IN=37
    INTERFACE=38
    IS=39
    ISNOT=40
    ITERATOR=41
    LET=42
    MARCO=43
    METHOD=44
    MIXIN=45
    MOD=46
    NIL=47
    NOT=48
    NOTIN=49
    OBJECT=50
    OF=51
    OR=52
    OUT=53
    PROC=54
    PTR=55
    RAISE=56
    REF=57
    RETURN=58
    SHL=59
    SHR=60
    STATIC=61
    TEMPLATE=62
    TRY=63
    TUPLE=64
    TYPE=65
    USING=66
    WHEN=67
    WHILE=68
    XOR=69
    IDENTIFIER=70

    def __init__(self, input:TokenStream, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.7.2")
        self._interp = ParserATNSimulator(self, self.atn, self.decisionsToDFA, self.sharedContextCache)
        self._predicates = None




    class StartContext(ParserRuleContext):

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def Comment(self):
            return self.getToken(milestone_1Parser.Comment, 0)

        def MultiLineComment(self):
            return self.getToken(milestone_1Parser.MultiLineComment, 0)

        def getRuleIndex(self):
            return milestone_1Parser.RULE_start

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterStart" ):
                listener.enterStart(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitStart" ):
                listener.exitStart(self)




    def start(self):

        localctx = milestone_1Parser.StartContext(self, self._ctx, self.state)
        self.enterRule(localctx, 0, self.RULE_start)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 2
            _la = self._input.LA(1)
            if not(_la==milestone_1Parser.Comment or _la==milestone_1Parser.MultiLineComment):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx





