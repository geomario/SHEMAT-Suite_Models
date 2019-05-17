!     this file will be generated automatically - change the Makefile !!!
!     current version
      character version*80
      parameter (version = "Shem-FW/AD/SM 7.50 (Smarty)")
!     current date
      character datum*40
      parameter (datum = "Fr 17. Mai 14:00:11 CEST 2019")
!     build command line
      character makecmd*256
      parameter (makecmd = &
     "gmake "// &
     "fw "// &
     "nohdf "// &
     "PROPS=kola "// &
     "HDF5_MOD=/include/ "// &
     "HDF5_LIB=/lib/ "// &
     "COMPTYPE=ling64 "// &
     "")
