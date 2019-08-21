!     this file will be generated automatically - change the Makefile !!!
!     current version
      character version*80
      parameter (version = "Shem-FW/AD/SM 7.50 (Smarty)")
!     current date
      character datum*40
      parameter (datum = "Fri Aug 16 12:15:34 CEST 2019")
!     build command line
      character makecmd*256
      parameter (makecmd = &
     "gmake "// &
     "fw "// &
     "pres "// &
     "hdf "// &
     "noomp "// &
     "PROPS=bas "// &
     "USER=none "// &
     "HDF5_MOD=/usr/local_rwth/sw/HDF5/1.8.21/gcc_4.8.5-intelmpi_2018.4.274/include/ "// &
     "HDF5_LIB=/usr/local_rwth/sw/HDF5/1.8.21/gcc_4.8.5-intelmpi_2018.4.274/lib/ "// &
     "COMPTYPE=ling64 "// &
     "")
