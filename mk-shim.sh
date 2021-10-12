#!/usr/bin/env bash

if [ $(getconf LONG_BIT) != '64' ]; then
    echo "SHIM Only supports compiling on 64-Bit systems ."
    exit 1
fi

Make="make -j$(cat /proc/cpuinfo | grep "cpu cores" | wc -l)"

AtomLinux_ShimVNumber="15.4"
AtomLinux_DownloadURL="https://github.com/rhboot/shim.git"

#Use Existing Certificate  (yes | no)
UseExistingCertificate=yes
#Use Existing Certificate  (yes | no)

OBJ_PROJECT=shim

#Clean
function clean_shim()
{
    rm -f ./*.log
    rm -rf ./${OBJ_PROJECT}_result

    rm -rf ${OBJ_PROJECT}-tmp
}

if test $1 && [ $1 = "clean" ]; then
    clean_shim
    echo "shim clean ok!"
    exit
fi
#Clean

if [ $UseExistingCertificate = "yes" ]; then
    if [ ! -f ./CertFile.cer ]; then
        echo "Error: VendorCertfile does not exist ."
        exit 1
    fi
fi

clean_shim
mkdir ${OBJ_PROJECT}_result
mkdir ${OBJ_PROJECT}-tmp

#git clone Source Code
cd ./${OBJ_PROJECT}-tmp/
git clone --branch ${AtomLinux_ShimVNumber} ${AtomLinux_DownloadURL}
#Check git clone
if [ ! $? -eq 0 ]; then
    echo "Error: git clone shim ."
    exit 1
fi
#Check git clone
cd ${OBJ_PROJECT}
git submodule update --init
#Check git clone
if [ ! $? -eq 0 ]; then
    echo "Error: git clone shim - submodule ."
    exit 1
fi
#Check git clone
cd ../../
#git clone Source Code

#Patches
# if [ -d ./Patches ]; then
#     cd ./${OBJ_PROJECT}-tmp/${OBJ_PROJECT}
#     for file in $(ls ../../Patches);
#     do
#         echo -e "\033[31m$file\033[0m"
#         patch -p1 < ../../Patches/$file
#         #Check patch
#         if [ ! $? -eq 0 ]; then
#             echo "Error: patch (shim) ."
#             exit 1
#         fi
#         #Check patch
#     done
#     cd ../../
# fi
#Patches

#Patches
if [ -d ./Patches ]; then
    if [ -f ./Patches/series ]; then
        cd ./${OBJ_PROJECT}-tmp/${OBJ_PROJECT}
        cat ../../Patches/series | while read line
        do
            strfile="../../Patches/${line}"
            echo -e "\033[31m$strfile\033[0m"
            patch -p1 < $strfile
        done
        cd ../../
    fi
fi
#Patches

#function
function build()
{
    ARCH=$1
    NAME=$2

    #dbx
    ./generate_dbx_list ${NAME} dbx.hashes ${NAME}_dbx.esl
    #dbx

    cd ./${OBJ_PROJECT}-tmp/${OBJ_PROJECT}

    make clean

    #sbat.csv
    echo 'shim.isoo,1,Isoo,shim,'${AtomLinux_ShimVNumber}',https://www.isoo.com/' > ./data/sbat.isoo.csv
    #sbat.csv

    if [ $UseExistingCertificate = "yes" ]; then
        echo | $Make ARCH=$ARCH ENABLE_HTTPBOOT=true VENDOR_CERT_FILE=../../CertFile.cer VENDOR_DBX_FILE=../../${NAME}_dbx.esl 2>&1 | tee ../../shim_build_${NAME}.log
    else
        echo | $Make ARCH=$ARCH ENABLE_HTTPBOOT=true ENABLE_SHIM_CERT=true VENDOR_DBX_FILE=../../${NAME}_dbx.esl
    fi
    #Check make
    if [ ! -f ./shim${NAME}.efi ]; then
        echo "Error: make (shim) ."
        exit 1
    fi
    #Check make

    cp -v ./*${NAME}.efi ../../${OBJ_PROJECT}_result/
    cp -v ./*${NAME}.efi.* ../../${OBJ_PROJECT}_result/

    #sha256sum
    SHA256SUM=$(sha256sum -b ./shim${NAME}.efi | awk '{print $1}')
    echo ${SHA256SUM} > ../../${OBJ_PROJECT}_result/shim${NAME}.efi.sha256sum
    #sha256sum

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

#rm -rf ${OBJ_PROJECT}-tmp

echo ""
echo ""
echo -e "\033[31m=================== sha256sum ===================\033[0m"
sha256sum ${OBJ_PROJECT}_result/shim*.efi
echo -e "\033[31m=================== sha256sum ===================\033[0m"
echo ""
echo ""

echo "Complete."
