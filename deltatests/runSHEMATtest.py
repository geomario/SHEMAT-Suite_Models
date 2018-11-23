import unittest

import sys
import os
sys.path.append(os.path.join(os.path.dirname(__file__)))

import test_fw_const_TheisProblem


def suite():
    suite = unittest.TestSuite()

    suite.addTest(test_fw_const_TheisProblem.suite())

    return suite


if __name__ == "__main__":
    runner = unittest.TextTestRunner(verbosity=2)
    runner.run(suite())
