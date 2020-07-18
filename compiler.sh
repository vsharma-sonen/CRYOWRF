
# ENTER the snpack folder
cd ./snpack_for_wrf

mkdir -p ./snow_libs

# compile meteoio first
cd ./meteoio
mkdir ./build
cd ./build
cmake -DCMAKE_INSTALL_PREFIX=../../snow_libs ..
make -j9 
make install
cd ..
rm -rf ./build ./lib/*

# go back up !
cd ..

# compile snowpack second
cd ./snowpack
mkdir ./build
cd ./build
cmake -DMETEOIO_INCLUDE_DIR=../../snow_libs/include -DMETEOIO_LIBRARY=../../snow_libs/lib/libmeteoio.a -DCMAKE_INSTALL_PREFIX=../../snow_libs ..
make -j9
make install
cd ..
rm -rf ./build ./lib/*

# go back up !
cd ..

# finally compile the coupler
cd ./main_coupler
make clean
make
mv ./libtrial.a ../snow_libs/lib/
mkdir ../snow_libs/include/coupler
mv ./*.mod ../snow_libs/include/coupler/
make clean

cd ..
export SNOWLIBS=$(pwd)
cd ..
