# Generated from milestone_1.g4 by ANTLR 4.5.3
# encoding: utf-8
from antlr4 import *
from io import StringIO

def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\3>")
        buf.write("\7\4\2\t\2\3\2\3\2\3\2\2\2\3\2\2\3\7\2\3\4\6\6\b\33 ;")
        buf.write(">>\5\2\4\3\2\2\2\4\5\t\2\2\2\5\3\3\2\2\2\2")
        return buf.getvalue()


class milestone_1Parser ( Parser ):

    grammarFileName = "milestone_1.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "<INVALID>", "<INVALID>", "'yield'", "<INVALID>", 
                     "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                     "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                     "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                     "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                     "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                     "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                     "<INVALID>", "'='", "'+'", "'*'", "'-'", "'/'", "'~'", 
                     "'&'", "'|'", "'<'", "'>'", "'@'", "'%'", "'!'", "'^'", 
                     "'.'", "':'", "'('", "')'", "'{'", "'}'", "'['", "']'", 
                     "','", "';'" ]

    symbolicNames = [ "<INVALID>", "Comment", "MultiLineComment", "YIELD", 
                      "IDENTIFIER", "LETTER", "DIGIT", "INT8_LIT", "INT16_LIT", 
                      "INT32_LIT", "INT64_LIT", "UINT_LIT", "UINT8_LIT", 
                      "UINT16_LIT", "UINT32_LIT", "UINT64_LIT", "FLOAT_LIT", 
                      "FLOAT32_SUFFIX", "FLOAT32_LIT", "FLOAT64_SUFFIX", 
                      "FLOAT64_LIT", "EXP", "INT_LIT", "HEX_LIT", "DEC_LIT", 
                      "OCT_LIT", "BIN_LIT", "HEXDIGIT", "OCTDIGIT", "BINDIGIT", 
                      "EQUALS_OPERATOR", "ADD_OPERATOR", "MUL_OPERATOR", 
                      "MINUS_OPERATOR", "DIV_OPERATOR", "BITWISE_NOT_OPERATOR", 
                      "AND_OPERATOR", "OR_OPERATOR", "LESS_THAN", "GREATER_THAN", 
                      "AT", "MODULUS", "NOT_OPERATOR", "XOR_OPERATOR", "DOT", 
                      "COLON", "OPEN_PAREN", "CLOSE_PAREN", "OPEN_BRACE", 
                      "CLOSE_BRACE", "OPEN_BRACK", "CLOSE_BRACK", "COMMA", 
                      "SEMI_COLON", "STR_LIT", "CHAR_LIT", "TRIPLESTR_LIT", 
                      "RSTR_LIT", "GENERALIZED_STR_LIT", "GENERALIZED_TRIPLESTR_LIT", 
                      "Space" ]

    RULE_start = 0

    ruleNames =  [ "start" ]

    EOF = Token.EOF
    Comment=1
    MultiLineComment=2
    YIELD=3
    IDENTIFIER=4
    LETTER=5
    DIGIT=6
    INT8_LIT=7
    INT16_LIT=8
    INT32_LIT=9
    INT64_LIT=10
    UINT_LIT=11
    UINT8_LIT=12
    UINT16_LIT=13
    UINT32_LIT=14
    UINT64_LIT=15
    FLOAT_LIT=16
    FLOAT32_SUFFIX=17
    FLOAT32_LIT=18
    FLOAT64_SUFFIX=19
    FLOAT64_LIT=20
    EXP=21
    INT_LIT=22
    HEX_LIT=23
    DEC_LIT=24
    OCT_LIT=25
    BIN_LIT=26
    HEXDIGIT=27
    OCTDIGIT=28
    BINDIGIT=29
    EQUALS_OPERATOR=30
    ADD_OPERATOR=31
    MUL_OPERATOR=32
    MINUS_OPERATOR=33
    DIV_OPERATOR=34
    BITWISE_NOT_OPERATOR=35
    AND_OPERATOR=36
    OR_OPERATOR=37
    LESS_THAN=38
    GREATER_THAN=39
    AT=40
    MODULUS=41
    NOT_OPERATOR=42
    XOR_OPERATOR=43
    DOT=44
    COLON=45
    OPEN_PAREN=46
    CLOSE_PAREN=47
    OPEN_BRACE=48
    CLOSE_BRACE=49
    OPEN_BRACK=50
    CLOSE_BRACK=51
    COMMA=52
    SEMI_COLON=53
    STR_LIT=54
    CHAR_LIT=55
    TRIPLESTR_LIT=56
    RSTR_LIT=57
    GENERALIZED_STR_LIT=58
    GENERALIZED_TRIPLESTR_LIT=59
    Space=60

    def __init__(self, input:TokenStream):
        super().__init__(input)
        self.checkVersion("4.5.3")
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

        def IDENTIFIER(self):
            return self.getToken(milestone_1Parser.IDENTIFIER, 0)

        def DIGIT(self):
            return self.getToken(milestone_1Parser.DIGIT, 0)

        def Space(self):
            return self.getToken(milestone_1Parser.Space, 0)

        def HEX_LIT(self):
            return self.getToken(milestone_1Parser.HEX_LIT, 0)

        def DEC_LIT(self):
            return self.getToken(milestone_1Parser.DEC_LIT, 0)

        def OCT_LIT(self):
            return self.getToken(milestone_1Parser.OCT_LIT, 0)

        def INT_LIT(self):
            return self.getToken(milestone_1Parser.INT_LIT, 0)

        def INT8_LIT(self):
            return self.getToken(milestone_1Parser.INT8_LIT, 0)

        def INT16_LIT(self):
            return self.getToken(milestone_1Parser.INT16_LIT, 0)

        def INT32_LIT(self):
            return self.getToken(milestone_1Parser.INT32_LIT, 0)

        def INT64_LIT(self):
            return self.getToken(milestone_1Parser.INT64_LIT, 0)

        def UINT_LIT(self):
            return self.getToken(milestone_1Parser.UINT_LIT, 0)

        def UINT8_LIT(self):
            return self.getToken(milestone_1Parser.UINT8_LIT, 0)

        def UINT16_LIT(self):
            return self.getToken(milestone_1Parser.UINT16_LIT, 0)

        def UINT32_LIT(self):
            return self.getToken(milestone_1Parser.UINT32_LIT, 0)

        def UINT64_LIT(self):
            return self.getToken(milestone_1Parser.UINT64_LIT, 0)

        def EXP(self):
            return self.getToken(milestone_1Parser.EXP, 0)

        def FLOAT_LIT(self):
            return self.getToken(milestone_1Parser.FLOAT_LIT, 0)

        def FLOAT32_SUFFIX(self):
            return self.getToken(milestone_1Parser.FLOAT32_SUFFIX, 0)

        def FLOAT32_LIT(self):
            return self.getToken(milestone_1Parser.FLOAT32_LIT, 0)

        def FLOAT64_LIT(self):
            return self.getToken(milestone_1Parser.FLOAT64_LIT, 0)

        def FLOAT64_SUFFIX(self):
            return self.getToken(milestone_1Parser.FLOAT64_SUFFIX, 0)

        def EQUALS_OPERATOR(self):
            return self.getToken(milestone_1Parser.EQUALS_OPERATOR, 0)

        def MUL_OPERATOR(self):
            return self.getToken(milestone_1Parser.MUL_OPERATOR, 0)

        def ADD_OPERATOR(self):
            return self.getToken(milestone_1Parser.ADD_OPERATOR, 0)

        def MINUS_OPERATOR(self):
            return self.getToken(milestone_1Parser.MINUS_OPERATOR, 0)

        def DIV_OPERATOR(self):
            return self.getToken(milestone_1Parser.DIV_OPERATOR, 0)

        def BITWISE_NOT_OPERATOR(self):
            return self.getToken(milestone_1Parser.BITWISE_NOT_OPERATOR, 0)

        def AND_OPERATOR(self):
            return self.getToken(milestone_1Parser.AND_OPERATOR, 0)

        def OR_OPERATOR(self):
            return self.getToken(milestone_1Parser.OR_OPERATOR, 0)

        def LESS_THAN(self):
            return self.getToken(milestone_1Parser.LESS_THAN, 0)

        def GREATER_THAN(self):
            return self.getToken(milestone_1Parser.GREATER_THAN, 0)

        def AT(self):
            return self.getToken(milestone_1Parser.AT, 0)

        def MODULUS(self):
            return self.getToken(milestone_1Parser.MODULUS, 0)

        def NOT_OPERATOR(self):
            return self.getToken(milestone_1Parser.NOT_OPERATOR, 0)

        def XOR_OPERATOR(self):
            return self.getToken(milestone_1Parser.XOR_OPERATOR, 0)

        def DOT(self):
            return self.getToken(milestone_1Parser.DOT, 0)

        def COLON(self):
            return self.getToken(milestone_1Parser.COLON, 0)

        def OPEN_PAREN(self):
            return self.getToken(milestone_1Parser.OPEN_PAREN, 0)

        def CLOSE_PAREN(self):
            return self.getToken(milestone_1Parser.CLOSE_PAREN, 0)

        def OPEN_BRACE(self):
            return self.getToken(milestone_1Parser.OPEN_BRACE, 0)

        def CLOSE_BRACE(self):
            return self.getToken(milestone_1Parser.CLOSE_BRACE, 0)

        def OPEN_BRACK(self):
            return self.getToken(milestone_1Parser.OPEN_BRACK, 0)

        def CLOSE_BRACK(self):
            return self.getToken(milestone_1Parser.CLOSE_BRACK, 0)

        def COMMA(self):
            return self.getToken(milestone_1Parser.COMMA, 0)

        def SEMI_COLON(self):
            return self.getToken(milestone_1Parser.SEMI_COLON, 0)

        def STR_LIT(self):
            return self.getToken(milestone_1Parser.STR_LIT, 0)

        def CHAR_LIT(self):
            return self.getToken(milestone_1Parser.CHAR_LIT, 0)

        def TRIPLESTR_LIT(self):
            return self.getToken(milestone_1Parser.TRIPLESTR_LIT, 0)

        def RSTR_LIT(self):
            return self.getToken(milestone_1Parser.RSTR_LIT, 0)

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
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & ((1 << milestone_1Parser.Comment) | (1 << milestone_1Parser.MultiLineComment) | (1 << milestone_1Parser.IDENTIFIER) | (1 << milestone_1Parser.DIGIT) | (1 << milestone_1Parser.INT8_LIT) | (1 << milestone_1Parser.INT16_LIT) | (1 << milestone_1Parser.INT32_LIT) | (1 << milestone_1Parser.INT64_LIT) | (1 << milestone_1Parser.UINT_LIT) | (1 << milestone_1Parser.UINT8_LIT) | (1 << milestone_1Parser.UINT16_LIT) | (1 << milestone_1Parser.UINT32_LIT) | (1 << milestone_1Parser.UINT64_LIT) | (1 << milestone_1Parser.FLOAT_LIT) | (1 << milestone_1Parser.FLOAT32_SUFFIX) | (1 << milestone_1Parser.FLOAT32_LIT) | (1 << milestone_1Parser.FLOAT64_SUFFIX) | (1 << milestone_1Parser.FLOAT64_LIT) | (1 << milestone_1Parser.EXP) | (1 << milestone_1Parser.INT_LIT) | (1 << milestone_1Parser.HEX_LIT) | (1 << milestone_1Parser.DEC_LIT) | (1 << milestone_1Parser.OCT_LIT) | (1 << milestone_1Parser.EQUALS_OPERATOR) | (1 << milestone_1Parser.ADD_OPERATOR) | (1 << milestone_1Parser.MUL_OPERATOR) | (1 << milestone_1Parser.MINUS_OPERATOR) | (1 << milestone_1Parser.DIV_OPERATOR) | (1 << milestone_1Parser.BITWISE_NOT_OPERATOR) | (1 << milestone_1Parser.AND_OPERATOR) | (1 << milestone_1Parser.OR_OPERATOR) | (1 << milestone_1Parser.LESS_THAN) | (1 << milestone_1Parser.GREATER_THAN) | (1 << milestone_1Parser.AT) | (1 << milestone_1Parser.MODULUS) | (1 << milestone_1Parser.NOT_OPERATOR) | (1 << milestone_1Parser.XOR_OPERATOR) | (1 << milestone_1Parser.DOT) | (1 << milestone_1Parser.COLON) | (1 << milestone_1Parser.OPEN_PAREN) | (1 << milestone_1Parser.CLOSE_PAREN) | (1 << milestone_1Parser.OPEN_BRACE) | (1 << milestone_1Parser.CLOSE_BRACE) | (1 << milestone_1Parser.OPEN_BRACK) | (1 << milestone_1Parser.CLOSE_BRACK) | (1 << milestone_1Parser.COMMA) | (1 << milestone_1Parser.SEMI_COLON) | (1 << milestone_1Parser.STR_LIT) | (1 << milestone_1Parser.CHAR_LIT) | (1 << milestone_1Parser.TRIPLESTR_LIT) | (1 << milestone_1Parser.RSTR_LIT) | (1 << milestone_1Parser.Space))) != 0)):
                self._errHandler.recoverInline(self)
            else:
                self.consume()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx





