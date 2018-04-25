#!/usr/bin/env bash

#function
function clean_gnuefi()
{
    sudo rm -rf /usr/include/efi
    sudo rm -rf /usr/lib/gnuefi
    sudo rm -rf /usr/lib64/gnuefi
}
#function

if test $1 && [ $1 = "clean" ]; then
    clean_gnuefi
    echo "clean ok!"
    exit
fi

Make="make -j$(cat /proc/cpuinfo | grep "cpu cores" | wc -l)"

AtomLinux_GnuEFIVNumber="3.0.8"
AtomLinux_DownloadURL="https://jaist.dl.sourceforge.net/project/gnu-efi/"

OBJ_PROJECT=gnu-efi
FILENAME=${OBJ_PROJECT}-${AtomLinux_GnuEFIVNumber}.tar.bz2

#Download Source Code
if [ ! -f ./${FILENAME} ]; then
    #Check if necessary tools are installed
    if [ -z $(which wget) ]; then
        echo "wget is not installed."
        exit 1
    fi
    #Check if necessary tools are installed
    wget ${AtomLinux_DownloadURL}${FILENAME}
    if [ ! $? -eq 0 ]; then
        echo "Error: Download gnu-efi ."
        exit 1
    fi
    #Check if it is downloaded successfully
    if [ ! -f ./${FILENAME} ]; then
        echo "Error: Download gnu-efi ."
        exit 1
    fi
fi
#Download Source Code

mkdir ${OBJ_PROJECT}-tmp
tar xjvf ./${FILENAME} -C ./${OBJ_PROJECT}-tmp
#Check Decompression
if [ ! $? -eq 0 ]; then
    echo "Error: Decompression gnu-efi ."
    exit 1
fi
#Check Decompression

cd ./${OBJ_PROJECT}-tmp/${OBJ_PROJECT}-${AtomLinux_GnuEFIVNumber}

#function
function build()
{
    ARCH=$1

    echo | $Make ARCH=$ARCH
    #Check make
    if [ ! $? -eq 0 ]; then
        echo "Error: make (gnu-efi) ."
        exit 1
    fi
    #Check make

    #install
    if [ ${ARCH} = "ia32" ]; then
        sudo make ARCH=$ARCH PREFIX=/usr LIBDIR=/usr/lib/gnuefi install
    elif [ ${ARCH} = "amd64" ]; then
        sudo make ARCH=$ARCH PREFIX=/usr LIBDIR=/usr/lib64/gnuefi install
    fi
    #install
    #Check make install
    if [ ! $? -eq 0 ]; then
        echo "Error: make install (gnu-efi) ."
        exit 1
    fi
    #Check make install

    make ARCH=$ARCH clean
}
#function

clean_gnuefi

#x86
build ia32
#x86

echo "-------------------------------------------------------------"

#x86_64
build amd64
#x86_64

#clean
cd ../../
rm -rf ${OBJ_PROJECT}-tmp
rm -rf ./${FILENAME}
#clean

echo "Complete."
