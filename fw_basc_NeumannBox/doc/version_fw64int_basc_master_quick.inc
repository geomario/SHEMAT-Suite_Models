!     this file will be generated automatically - change the Makefile !!!
!     current version
      character version*80
      parameter (version = "Shem-FW/AD/SM 7.50 (Smarty)")
!     current date
      character datum*40
      parameter (datum = "Fri Jul 26 14:31:49 CEST 2019")
!     build command line
      character makecmd*256
      parameter (makecmd = &
     "gmake "// &
     "fw "// &
     "hdf "// &
     "noomp "// &
     "PROPS=basc "// &
     "USER=none "// &
     "HDF5_MOD=/usr/local_rwth/sw/HDF5/1.10.4/intel_19.0.1.144-intelmpi_2018.4.274/include/ "// &
     "HDF5_LIB=/usr/local_rwth/sw/HDF5/1.10.4/intel_19.0.1.144-intelmpi_2018.4.274/lib/ "// &
     "COMPTYPE=lini64 "// &
     "")
