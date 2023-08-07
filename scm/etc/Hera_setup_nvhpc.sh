#!/bin/bash

echo "Setting environment variables for CCPP-SCM on Hera with icc/ifort"

MYDIR=$(cd "$(dirname "$(readlink -f -n "${BASH_SOURCE[0]}" )" )" && pwd -P)

export SCM_ROOT=$MYDIR/../..

module purge

module load nvhpc/23.3

module load cmake/3.20.1
export CMAKE_C_COMPILER=$CC
export CMAKE_CXX_COMPILER=$CXX
export CMAKE_Fortran_COMPILER=$FC
export CMAKE_Platform=hera.intel

export ROOT_DIR="/scratch1/RDARCH/rda-ghpcs/Vanderlei.Vargas/usr/local"

#ZLIB
export ZLIB_DIR=$ROOT_DIR/zlib-1.2.13
TEMP_DIR=$ZLIB_DIR
export LD_LIBRARY_PATH=$TEMP_DIR/lib:$LD_LIBRARY_PATH
export PATH=$TEMP_DIR/bin:$PATH

#HDF5
HDF5=$ROOT_DIR/hdf5-hdf5-1_14_1-2/build
TEMP_DIR=$HDF5
export LD_LIBRARY_PATH=$TEMP_DIR/lib:$LD_LIBRARY_PATH
export PATH=$TEMP_DIR/bin:$PATH

#NETCDF
export NETCDF=$ROOT_DIR
export NETCDF_LIBRARIES=$NETCDF/lib
export NETCDF_INCLUDE=$NETCDF/include
TEMP_DIR=$NETCDF
export LD_LIBRARY_PATH=$TEMP_DIR/lib:$LD_LIBRARY_PATH
export PATH=$TEMP_DIR/bin:$PATH


#NCEPlibs
export bacio_ROOT=/scratch1/RDARCH/rda-ghpcs/Vanderlei.Vargas/usr/local/NCEPLIBS-bacio-2.4.1
export BACIO_INC4=${bacio_ROOT}/include_4
export BACIO_LIB4=${bacio_ROOT}/lib
export BACIO_INC8=${bacio_ROOT}/include_8
export BACIO_LIB8=${bacio_ROOT}/lib
TEMP_DIR=$bacio_ROOT
export LD_LIBRARY_PATH=$TEMP_DIR/lib:$LD_LIBRARY_PATH

export bufr_DIR=/scratch1/RDARCH/rda-ghpcs/Vanderlei.Vargas/usr/local/NCEPLIBS-bufr-bufr_v11.7.1
TEMP_DIR=$bufr_ROOT
export LD_LIBRARY_PATH=$TEMP_DIR/lib:$LD_LIBRARY_PATH

export w3emc_ROOT=/scratch1/RDARCH/rda-ghpcs/Vanderlei.Vargas/usr/local/NCEPLIBS-w3emc-2.9.2
TEMP_DIR=$w3emc_ROOT
export LD_LIBRARY_PATH=$TEMP_DIR/lib:$LD_LIBRARY_PATH

export sp_ROOT=/scratch1/RDARCH/rda-ghpcs/Vanderlei.Vargas/usr/local/NCEPLIBS-sp-2.3.3
TEMP_DIR=$sp_ROOT
export LD_LIBRARY_PATH=$TEMP_DIR/lib:$LD_LIBRARY_PATH


echo "Loading the SCM python environment"
. "/scratch1/BMC/gmtb/SCM_anaconda/etc/profile.d/conda.sh"
conda activate pyccpp

