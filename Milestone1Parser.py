# Generated from Milestone1.g4 by ANTLR 4.7.2
# encoding: utf-8
from antlr4 import *
from io import StringIO
from typing.io import TextIO
import sys


def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\4")
        buf.write("\17\4\2\t\2\4\3\t\3\3\2\3\2\3\3\7\3\n\n\3\f\3\16\3\r\13")
        buf.write("\3\3\3\2\2\4\2\4\2\2\2\r\2\6\3\2\2\2\4\13\3\2\2\2\6\7")
        buf.write("\7\3\2\2\7\3\3\2\2\2\b\n\5\2\2\2\t\b\3\2\2\2\n\r\3\2\2")
        buf.write("\2\13\t\3\2\2\2\13\f\3\2\2\2\f\5\3\2\2\2\r\13\3\2\2\2")
        buf.write("\3\13")
        return buf.getvalue()


class Milestone1Parser ( Parser ):

    grammarFileName = "Milestone1.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [  ]

    symbolicNames = [ "<INVALID>", "NEWLINE", "SPACE" ]

    RULE_expr = 0
    RULE_start = 1

    ruleNames =  [ "expr", "start" ]

    EOF = Token.EOF
    NEWLINE=1
    SPACE=2

    def __init__(self, input:TokenStream, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.7.2")
        self._interp = ParserATNSimulator(self, self.atn, self.decisionsToDFA, self.sharedContextCache)
        self._predicates = None




    class ExprContext(ParserRuleContext):

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def NEWLINE(self):
            return self.getToken(Milestone1Parser.NEWLINE, 0)

        def getRuleIndex(self):
            return Milestone1Parser.RULE_expr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterExpr" ):
                listener.enterExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitExpr" ):
                listener.exitExpr(self)




    def expr(self):

        localctx = Milestone1Parser.ExprContext(self, self._ctx, self.state)
        self.enterRule(localctx, 0, self.RULE_expr)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 4
            self.match(Milestone1Parser.NEWLINE)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class StartContext(ParserRuleContext):

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def expr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(Milestone1Parser.ExprContext)
            else:
                return self.getTypedRuleContext(Milestone1Parser.ExprContext,i)


        def getRuleIndex(self):
            return Milestone1Parser.RULE_start

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterStart" ):
                listener.enterStart(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitStart" ):
                listener.exitStart(self)




    def start(self):

        localctx = Milestone1Parser.StartContext(self, self._ctx, self.state)
        self.enterRule(localctx, 2, self.RULE_start)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 9
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==Milestone1Parser.NEWLINE:
                self.state = 6
                self.expr()
                self.state = 11
                self._errHandler.sync(self)
                _la = self._input.LA(1)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx





