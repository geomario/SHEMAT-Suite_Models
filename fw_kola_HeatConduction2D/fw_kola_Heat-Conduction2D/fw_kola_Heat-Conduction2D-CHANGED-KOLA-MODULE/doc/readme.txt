
#####################################################################
# Documentation Testmodel Convective Heat Transport with Permafrost #
#####################################################################

 * 2D model with 200x1x40=8000 cells
 * only temp
 * PROPS=kola
 * two kinds of matrix result in two different temperature gradients
 * fixed temperatures at top
 * fixed heat flux at bottom
 * conductive heat flow from base to top
 * steady state solution

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!! ATTENTION: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
NEW VERSION OF KOLA USED!!!
compare https://git.rwth-aachen.de/SHEMAT-Suite/SHEMAT-Suite/issues/42
FILES CHANGED:
 - lx.f90
 - ly.f90
 - lz.f90
 - rce.f90
 - g_tap/lx_ftl.f90
 - g_tap/ly_ftl.f90
 - g_tap/lz_ftl.f90
 - g_tap/rhoceff_ftl.f90
USED MODULE IS IN DOC-DIRECTORY
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

########## Compilation master branch ################################

 * Build executable from branch master:
 * Within source code directory:

Currently Loaded Modulefiles:
 1) DEVELOP             3) intelmpi/2018
 2) intel/19.0

########## Execution ################################################

 * Within model directory

########## Additional Information ###################################
 
 * Runtime: total cpu time:    0: 1.89 min
