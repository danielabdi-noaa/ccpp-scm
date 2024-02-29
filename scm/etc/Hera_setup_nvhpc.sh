#!/bin/bash

echo "Setting environment variables for CCPP-SCM on Hera with icc/ifort"

MYDIR=$(cd "$(dirname "$(readlink -f -n "${BASH_SOURCE[0]}" )" )" && pwd -P)

export SCM_ROOT=$MYDIR/../..

module purge

module load nvhpc/24.1

module load cmake/3.20.1
export CMAKE_C_COMPILER=$CC
export CMAKE_CXX_COMPILER=$CXX
export CMAKE_Fortran_COMPILER=$FC
export CMAKE_Platform=hera.intel

#export ROOT_DIR="/scratch1/RDARCH/rda-ghpcs/Vanderlei.Vargas/usr/local"
export ROOT_DIR="/scratch2/BMC/gsd-hpcs/Daniel.Abdi/dan-ccpp/installs"

#ZLIB
export ZLIB_DIR=$ROOT_DIR/zlib
TEMP_DIR=$ZLIB_DIR
export LD_LIBRARY_PATH=$TEMP_DIR/lib:$LD_LIBRARY_PATH
export PATH=$TEMP_DIR/bin:$PATH

#HDF5
HDF5=$ROOT_DIR/hdf5
TEMP_DIR=$HDF5
export LD_LIBRARY_PATH=$TEMP_DIR/lib:$LD_LIBRARY_PATH
export PATH=$TEMP_DIR/bin:$PATH

#NETCDF
export NETCDF=$ROOT_DIR/netcdf
export NETCDF_LIBRARIES=$NETCDF/lib
export NETCDF_INCLUDE=$NETCDF/include
TEMP_DIR=$NETCDF
export LD_LIBRARY_PATH=$TEMP_DIR/lib:$LD_LIBRARY_PATH
export PATH=$TEMP_DIR/bin:$PATH


#NCEPlibs
export bacio_ROOT=$ROOT_DIR/bacio
export BACIO_INC4=${bacio_ROOT}/include_4
export BACIO_LIB4=${bacio_ROOT}/lib
export BACIO_INC8=${bacio_ROOT}/include_8
export BACIO_LIB8=${bacio_ROOT}/lib
TEMP_DIR=$bacio_ROOT
export LD_LIBRARY_PATH=$TEMP_DIR/lib:$LD_LIBRARY_PATH

export bufr_ROOT=$ROOT_DIR/bufr
TEMP_DIR=$bufr_ROOT
export LD_LIBRARY_PATH=$TEMP_DIR/lib:$LD_LIBRARY_PATH

export w3emc_ROOT=$ROOT_DIR/w3emc
TEMP_DIR=$w3emc_ROOT
export LD_LIBRARY_PATH=$TEMP_DIR/lib:$LD_LIBRARY_PATH

export sp_ROOT=$ROOT_DIR/sp
TEMP_DIR=$sp_ROOT
export LD_LIBRARY_PATH=$TEMP_DIR/lib:$LD_LIBRARY_PATH


echo "Loading the SCM python environment"
. "/scratch1/BMC/gmtb/SCM_anaconda/etc/profile.d/conda.sh"
conda activate pyccpp

