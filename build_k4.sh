#!/bin/bash

set -e
cd ~/
echo "Downloading NiLuJe's modified crosstool-ng"
git clone -b kindle https://github.com/NiLuJe/crosstool-ng.git

echo "Preparing crosstool-ng for build"
cd crosstool-ng/
./bootstrap
CT_OUTPUT="$(pwd)/../crosstool-ng-output"
./configure --prefix="$CT_OUTPUT"
make
make install
export PATH="${PATH}:${CT_OUTPUT}/bin"
unset CFLAGS CXXFLAGS LDFLAGS
cd ../
mkdir -p crosstool-ng-workdir/

cd crosstool-ng-workdir/
# manually make clean
rm -rf build.log config .config.2 .config.old config.gen .build/arm-kindle4-linux-gnueabi .build/src .build/tools
cp ../ct-ng-kindle4.config .config

# CT_BUILD_OUTPUT decides where the compiled toolchain is installed
export CT_BUILD_OUTPUT="$(pwd)/../toolchains"
ct-ng oldconfig

echo "=========================="
echo "  Compiling crostool-ng!"
echo "=========================="
echo ""
ct-ng build
echo "=========================="
echo "  Compilation success!"
echo "  Toolchain is in:"
echo "    ${CT_BUILD_OUTPUT}"
echo "=========================="
echo ""
set +e
