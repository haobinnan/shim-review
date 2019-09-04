#!/usr/bin/env bash

if [ $(getconf LONG_BIT) != '64' ]; then
    echo "SHIM Only supports compiling on 64-Bit systems ."
    exit 1
fi

Make="make -j$(cat /proc/cpuinfo | grep "cpu cores" | wc -l)"

AtomLinux_ShimVNumber="15"
AtomLinux_DownloadURL="https://github.com/rhboot/shim/archive/"

#Use Existing Certificate  (yes | no)
UseExistingCertificate=yes
#Use Existing Certificate  (yes | no)

OBJ_PROJECT=shim
FILENAME=${AtomLinux_ShimVNumber}.tar.gz

#Clean
function clean_shim()
{
    rm -f ./*.log
    rm -rf ./shim_result

    rm -rf ${OBJ_PROJECT}-tmp
}

if test $1 && [ $1 = "clean" ]; then
    clean_shim
    echo "shim clean ok!"
    exit
fi
#Clean

if [ $UseExistingCertificate = "yes" ]; then
    if [ ! -f ./Isoo.cer ]; then
        echo "Error: VendorCertfile does not exist ."
        exit 1
    fi
fi

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
        echo "Error: Download shim ."
        exit 1
    fi
    #Check if it is downloaded successfully
    if [ ! -f ./${FILENAME} ]; then
        echo "Error: Download shim ."
        exit 1
    fi
fi
#Download Source Code

clean_shim
mkdir ${OBJ_PROJECT}_result

#function
function build()
{
    ARCH=$1
    NAME=$2

    rm -rf ${OBJ_PROJECT}-tmp
    mkdir ${OBJ_PROJECT}-tmp
    tar xzvf ./${FILENAME} -C ./${OBJ_PROJECT}-tmp
    #Check Decompression
    if [ ! $? -eq 0 ]; then
        echo "Error: Decompression shim ."
        exit 1
    fi
    #Check Decompression

    cd ./${OBJ_PROJECT}-tmp/${OBJ_PROJECT}-${AtomLinux_ShimVNumber}

    #Patches
    if [ -d ../../code/shim-patches ]; then
        for file in $(ls ../../code/shim-patches);
        do
            echo -e "\033[31m$file\033[0m"
            patch -p1 < ../../code/shim-patches/$file
            #Check patch
            if [ ! $? -eq 0 ]; then
                echo "Error: patch (shim) ."
                exit 1
            fi
            #Check patch
        done
    fi
    #Patches

    if [ $UseExistingCertificate = "yes" ]; then
        echo | $Make ARCH=$ARCH VENDOR_CERT_FILE=../../Isoo.cer 2>&1 | tee ../../shim_build_${NAME}.log
    else
        echo | $Make ARCH=$ARCH ENABLE_SHIM_CERT=1
    fi
    #Check make
    if [ ! -f ./shim${NAME}.efi ]; then
        echo "Error: make (shim) ."
        exit 1
    fi
    #Check make

    cp -v ./*${NAME}.efi ../../${OBJ_PROJECT}_result/
    cp -v ./*${NAME}.efi.* ../../${OBJ_PROJECT}_result/

    #Copy Certificate
    if [ $UseExistingCertificate = "no" ]; then
        if [ ! -d ../../${OBJ_PROJECT}_result/certificate/ ]; then
            mkdir ../../${OBJ_PROJECT}_result/certificate/
            cp -v ./*.pem *.p12 *.key *.csr *.crt *.cer ../../${OBJ_PROJECT}_result/certificate/
        fi
    fi
    #Copy Certificate

    #clean
    cd ../../
    rm -rf ${OBJ_PROJECT}-tmp
    #clean
}
#function

#x86
build ia32 ia32
#x86

echo "-------------------------------------------------------------"

#x86_64
build x86_64 x64
#x86_64

echo "Complete."
