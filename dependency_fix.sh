# add keys and update
apt-get update
apt-get install -y lsb-release wget software-properties-common gnupg

# clang installation
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
./llvm.sh 19 all

# SDL2 installation
wget https://www.libsdl.org/release/SDL2-2.30.0.tar.gz
tar -xzf SDL2-2.30.0.tar.gz
cd SDL2-2.30.0
mkdir build && cd build
cmake ..
make -j$(nproc)
make install
ldconfig

# go back up to the original directory
cd ../..

# environment paths 
cmake -B build \
  -DCMAKE_CXX_COMPILER=clang++-19 \
  -DCMAKE_CXX_FLAGS="-stdlib=libc++" \
  -DSDL2_DIR=/usr/local/lib/cmake/SDL2

cmake --build build

export CMAKE_PREFIX_PATH="/usr/local:$CMAKE_PREFIX_PATH"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"
export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"

rm -rf build/
cmake -B build -DCMAKE_CXX_COMPILER=clang++-19 -DCMAKE_CXX_FLAGS="-stdlib=libc++"
cmake --build build

