#!/bin/tcsh

echo "Setting environment variables for CCPP-SCM on Hera with icc/ifort"

set called=($_)

if ( "$called" != "") then  ### called by source
    set MYSCRIPT=`readlink -f -n $called[2]`
else                        ### called by direct execution of the script
    set MYSCRIPT=`readlink -f -n '$0'`
endif
set MYDIR=`dirname $MYSCRIPT`
set MYDIR=`cd $MYDIR && pwd -P`


setenv SCM_ROOT "$MYDIR/../.."

module purge

module load nvhpc/24.1

module load cmake/3.20.1
setenv CMAKE_C_COMPILER $CC
setenv CMAKE_CXX_COMPILER $CXX
setenv CMAKE_Fortran_COMPILER $FC
setenv CMAKE_Platform hera.nvhpc

#setenv ROOT_DIR "/scratch1/RDARCH/rda-ghpcs/Vanderlei.Vargas/usr/local"
setenv ROOT_DIR "/scratch2/BMC/gsd-hpcs/Daniel.Abdi/dan-ccpp/installs"

#ZLIB
setenv ZLIB_DIR $ROOT_DIR/zlib
set TEMP_DIR=$ZLIB_DIR
setenv LD_LIBRARY_PATH $TEMP_DIR/lib:$LD_LIBRARY_PATH
setenv PATH $TEMP_DIR/bin:$PATH

#HDF5
set HDF5=$ROOT_DIR/hdf5
set TEMP_DIR=$HDF5
setenv LD_LIBRARY_PATH $TEMP_DIR/lib:$LD_LIBRARY_PATH
setenv PATH $TEMP_DIR/bin:$PATH

#NETCDF
setenv NETCDF $ROOT_DIR/netcdf
setenv NETCDF_LIBRARIES $NETCDF/lib
setenv NETCDF_INCLUDE $NETCDF/include
set TEMP_DIR=$NETCDF
setenv LD_LIBRARY_PATH $TEMP_DIR/lib:$LD_LIBRARY_PATH
setenv PATH $TEMP_DIR/bin:$PATH


#NCEPlibs
setenv bacio_ROOT $ROOT_DIR/bacio
setenv BACIO_INC4 ${bacio_ROOT}/include_4
setenv BACIO_LIB4 ${bacio_ROOT}/lib
setenv BACIO_INC8 ${bacio_ROOT}/include_8
setenv BACIO_LIB8 ${bacio_ROOT}/lib
set TEMP_DIR=$bacio_ROOT
setenv LD_LIBRARY_PATH $TEMP_DIR/lib:$LD_LIBRARY_PATH

setenv bufr_ROOT $ROOT_DIR/bufr
set TEMP_DIR=$bufr_ROOT
setenv LD_LIBRARY_PATH $TEMP_DIR/lib:$LD_LIBRARY_PATH

setenv w3emc_ROOT $ROOT_DIR/w3emc
set TEMP_DIR=$w3emc_ROOT
setenv LD_LIBRARY_PATH $TEMP_DIR/lib:$LD_LIBRARY_PATH

setenv sp_ROOT $ROOT_DIR/sp
set TEMP_DIR=$sp_ROOT
setenv LD_LIBRARY_PATH $TEMP_DIR/lib:$LD_LIBRARY_PATH


echo "Loading the SCM python environment"
source "/scratch1/BMC/gmtb/SCM_anaconda/etc/profile.d/conda.csh"
conda activate pyccpp

