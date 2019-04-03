import unittest

import sys
import os
sys.path.append(os.path.join(os.path.dirname(__file__)))

import test_fw_const_TheisProblem


def full_suite():
    full_suite = unittest.TestSuite()

    full_suite.addTest(test_fw_const_TheisProblem.local_suite())

    return full_suite


if __name__ == "__main__":
    runner = unittest.TextTestRunner(verbosity=2)
    runner.run(full_suite())
