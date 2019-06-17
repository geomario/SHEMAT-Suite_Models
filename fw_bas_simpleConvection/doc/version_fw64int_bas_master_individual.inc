!     this file will be generated automatically - change the Makefile !!!
!     current version
      character version*80
      parameter (version = "Shem-FW/AD/SM 7.50 (Smarty)")
!     current date
      character datum*40
      parameter (datum = "Mon Jun 17 16:15:18 CEST 2019")
!     build command line
      character makecmd*256
      parameter (makecmd = &
     "gmake "// &
     "fw "// &
     "hdf "// &
     "noomp "// &
     "PROPS=bas "// &
     "HDF5_MOD=/usr/local_rwth/sw/HDF5/1.10.4/intel_19.0.1.144-intelmpi_2018.4.274/include/ "// &
     "HDF5_LIB=/usr/local_rwth/sw/HDF5/1.10.4/intel_19.0.1.144-intelmpi_2018.4.274/lib/ "// &
     "COMPTYPE=lini64 "// &
     "")
