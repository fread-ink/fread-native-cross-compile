#!/bin/bash

if [[ ! -v TC_NAME ]]; then
  echo "Before building kexec run e.g:" >&2
  echo "  source ./env_k4.sh" >&2
  exit 1
fi

KEXEC_NAME="kexec-tools-2.0.12"
KEXEC_FILE="${KEXEC_NAME}.tar.gz"

set -e

if [ ! -f $KEXEC_FILE ]; then
    echo "Downloading kexec..."
    wget "https://www.kernel.org/pub/linux/utils/kernel/kexec/${KEXEC_FILE}"
    echo "Downloaded!"
else
    echo "kexec already present..."
fi

tar xvzf $KEXEC_FILE    

OUT_DIR="${PWD}/kexec-out"
cd $KEXEC_NAME

echo "Configuring kexec..."
./configure --prefix=${OUT_DIR} --host=${TC_NAME}
echo "Configured!"

echo "Building kexec..."
make
make install
echo "kexec built!"
echo "The kexec binary is here:"
echo "  ${OUT_DIR}/"
echo ""

set +e
