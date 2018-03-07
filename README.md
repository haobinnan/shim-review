-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
秦皇岛易之数软件开发有限公司

Isoo (Qinhuangdao) software development Co., Ltd.

Qinhuangdao, Hebei, China

Isoo is a software developer for data recovery, disk utilities and system backup.

Managing Director: Hao Binnan

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
This is Isoo’s Linux-based operating system. We are going to develop some function based on the OS, such as resize partition, back up & restore operating system, etc.

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
Isoo wants to employ Secure Boot for building a trusted operating system from Shim to GRUB to the kernel to signed filesystem partitions. Secure Boot is the first step for this.

Isoo would like customers to be able to run Isoo’s Linux-based system on any amd64(64Bit) annd X86(32Bit) device without disabling Secure Boot.

-------------------------------------------------------------------------------
Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Hao Binnan

- Position: Managing Director

- Email address: haobinnan@gmail.com

- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the linux community: 79AFC78F

-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Liu jia

- Position: Managing Director

- Email address: liusirjiayou@126.com

- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the linux community: CD97FA99

-------------------------------------------------------------------------------
What upstream shim tag is this starting from:
-------------------------------------------------------------------------------
shim tag:14

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
https://github.com/rhboot/shim

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
No patches have been applied

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
-------------------------------------------------------------------------------
OS: 

Ubuntu 16.04.3 LTS

Toolchain: 

binutils/xenial-updates,xenial-security,now 2.26.1-1ubuntu1~16.04.6 amd64

gnu-efi/xenial 3.0.2-1ubuntu1 amd64

gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.9)


-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
"build logs/ shim_build_ia32.log"

"build logs/ shim_build_x64.log"

-------------------------------------------------------------------------------
Put info about what bootloader you're using, including which patches it includes to enforce Secure Boot here:
-------------------------------------------------------------------------------
https://salsa.debian.org/grub-team/grub/tree/debian/2.02-3

No extra patches

-------------------------------------------------------------------------------
Put info about what kernel you're using, including which patches it includes to enforce Secure Boot here:
-------------------------------------------------------------------------------
https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.14.22.tar.xz

No extra patches



-------------------------------------------------------------------------------
Notes:
-------------------------------------------------------------------------------
File lists:

build logs\shim_build_ia32.log							(log file for building 32Bit SHIM file)

build logs\shim_build_x64.log							(log file for building 64Bit SHIM file)

code\shim-14.tar.gz										(SHIM source code)

shim\cab-signed\shimia32_isoouefiboot_20180224.cab		(32Bit SHIM file submitted to sysdev. The cab file has been signed by EV code signing)

shim\cab-signed\shimx64_isoouefiboot_20180224.cab		(64Bit SHIM file submitted to sysdev. The cab file has been signed by EV code signing)

shim\shimia32.efi										(32Bit SHIM binary to be signed)

shim\shimx64.efi										(64Bit SHIM binary to be signed)

Isoo.cer												(Certificate embedded in SHIM)
