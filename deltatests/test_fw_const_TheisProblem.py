import unittest
import numpy.testing as npt

from pskf.tools.plot import plotfunctions as pf


class Tests_fw_const_TheisProblem(unittest.TestCase):

    def test_head_equal(self):

        head_array_desired = pf.my_vtk_to_numpy(
            pf.my_vtk('../fw_const_TheisProblem/result',
                      'THEIS_final.vtk',
                      'head')
            )
        head_array_actual = pf.my_vtk_to_numpy(
            pf.my_vtk('../fw_const_TheisProblem',
                      'THEIS_final.vtk',
                      'head')
            )

        npt.assert_allclose(head_array_actual, head_array_desired, rtol=1e-5)

def local_suite():
    local_suite = unittest.makeSuite(Tests_fw_const_TheisProblem,
                                     prefix='test')
    return local_suite


def local_run():
    runner = unittest.TextTestRunner(verbosity=2)
    runner.run(local_suite())


if __name__ == "__main__":
    local_run()
