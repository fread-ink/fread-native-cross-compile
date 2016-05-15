#!/bin/bash

# based on NiLuJe's x-compile.sh script

export TC_NAME="arm-kindle4-linux-gnueabi"
export TC_DIR="/home/vagrant/toolchains/${TC_NAME}"
export PATH="${TC_DIR}/bin:${PATH}"
ARCH_FLAGS="-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb"

LEGACY_GLIBCXX_ABI="-D_GLIBCXX_USE_CXX11_ABI=0"

BASE_CFLAGS="-O3 -ffast-math ${ARCH_FLAGS} ${LEGACY_GLIBCXX_ABI} -pipe -fomit-frame-pointer -frename-registers -fweb -flto=1 -fuse-linker-plugin"

export ARCH="arm"
export CC="${TC_NAME}-gcc"
export GCC="${TC_NAME}-gcc"
export LD="${TC_NAME}-ld"
export AS="${TC_NAME}-as"
export CXX="${TC_NAME}-g++"
export STRIP="${TC_NAME}-strip"
export OBJCOPY="${TC_NAME}-objcopy"
export OBJDUMP="${TC_NAME}-objdump"
export AR="${TC_NAME}-gcc-ar"
export RANLIB="${TC_NAME}-gcc-ranlib"
export NM="${TC_NAME}-gcc-nm"
export CFLAGS="${BASE_CFLAGS}"
export CXXFLAGS="${BASE_CFLAGS}"

# NOTE: Use -isystem instead of -I to make sure GMP doesn't do crazy stuff... (FIXME: -idirafter sounds more correct for our use-case, though...)
BASE_CPPFLAGS="-isystem${TC_DIR}/include"
export CPPFLAGS="${BASE_CPPFLAGS}"
BASE_LDFLAGS="-L${TC_DIR}/lib -Wl,-O1 -Wl,--as-needed"
export LDFLAGS="${BASE_LDFLAGS}"

export CTNG_LD_IS="gold"

BASE_PKG_CONFIG_PATH="${TC_DIR}/lib/pkgconfig"
BASE_PKG_CONFIG_LIBDIR="${TC_DIR}/lib/pkgconfig"

export PKG_CONFIG_DIR=
export PKG_CONFIG_PATH="${BASE_PKG_CONFIG_PATH}"
export PKG_CONFIG_LIBDIR="${BASE_PKG_CONFIG_LIBDIR}"

