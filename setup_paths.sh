  export NETCDF=/home/varun/WRF_LIBRARIES/install/netcdf
  export PNETCDF=/home/varun/WRF_LIBRARIES/install/pnetcdf

  export HDF5=/home/varun/WRF_LIBRARIES/install/hdf5
  
  export WRF_EM_CORE=1
  export WRF_NMM_CORE=0
  export WRF_DA_CORE=0
  
  export WRF_CHEM=0
  export WRF_KPP=0
  
  export NETCDF4=1
  #export NETCDF_classic=1
  export WRFIO_NCD_LARGE_FILE_SUPPORT=1

  export LD_LIBRARY_PATH=/home/varun/WRF_LIBRARIES/install/netcdf/lib:/home/varun/WRF_LIBRARIES/install/mpich/lib:/home/varun/WRF_LIBRARIES/install/pnetcdf/lib:/home/varun/WRF_LIBRARIES/install/hdf5/lib:$LD_LIBRARY_PATH
   export PATH=/home/varun/WRF_LIBRARIES/install/netcdf/bin:$PATH
   export PATH=/home/varun/WRF_LIBRARIES/install/mpich/bin:$PATH

