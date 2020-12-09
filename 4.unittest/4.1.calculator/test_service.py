from service import sum,minus,multiply,divide
import unittest


class Test_Calculator(unittest.TestCase):
    def testSumFunction(self):
        self.assertEqual(sum(1,2),3) 

    def testMinusFunction(self):
        self.assertEqual(minus(11,0),10) 

    def testMultiplyFunction(self):
        self.assertEqual(sum(1,2),3) 

    def testDivideFunction(self):
        self.assertEqual(divide(100,10), 10) 
