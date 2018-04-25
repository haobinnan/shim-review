-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
- 秦皇岛易之数软件开发有限公司 (Isoo (Qinhuangdao) software development Co., Ltd.)
- Qinhuangdao, Hebei, China
- Isoo is a software developer for data recovery, disk utilities and system backup.
- Managing Director: Hao Binnan

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
- This is Isoo’s Linux-based operating system. We are going to develop some function based on the OS, such as resize partition, back up & restore operating system, etc.

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
- Isoo wants to employ Secure Boot for building a trusted operating system from Shim to GRUB to the kernel to signed filesystem partitions. Secure Boot is the first step for this.
- Isoo would like customers to be able to run Isoo’s Linux-based system on any amd64(64Bit) and x86(32Bit) device without disabling Secure Boot.

-------------------------------------------------------------------------------
Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Hao Binnan
- Position: Managing Director
- Email address: haobinnan@gmail.com
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the linux community: https://pgp.mit.edu/pks/lookup?op=get&search=0x79AFC78F

-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Liu jia
- Position: Managing Director
- Email address: liusirjiayou@126.com
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the linux community: https://pgp.mit.edu/pks/lookup?op=get&search=0xCD97FA99

-------------------------------------------------------------------------------
What upstream shim tag is this starting from:
-------------------------------------------------------------------------------
- shim tag:15

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
- https://github.com/rhboot/shim

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
- No patches have been applied

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
-------------------------------------------------------------------------------
- OS: 
- Ubuntu 18.04 LTS

- Toolchain: 
- binutils/bionic,now 2.30-15ubuntu1
- gnu-efi 3.0.8
- gcc version 7.3.0 (Ubuntu 7.3.0-16ubuntu3)

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
- "shim build logs/shim_build_ia32.log"
- "shim build logs/shim_build_x64.log"

-------------------------------------------------------------------------------
Put info about what bootloader you're using, including which patches it includes to enforce Secure Boot here:
-------------------------------------------------------------------------------
- https://salsa.debian.org/grub-team/grub/tree/debian/2.02+dfsg1-4
- No extra patches

-------------------------------------------------------------------------------
Put info about what kernel you're using, including which patches it includes to enforce Secure Boot here:
-------------------------------------------------------------------------------
- https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.14.35.tar.xz
- code\SecureBootPatches

-------------------------------------------------------------------------------
Notes:
-------------------------------------------------------------------------------
- File lists:
- code\SecureBootPatches                                 (Linux Kernel Secure Boot Patches)
- code\15.tar.gz                                         (SHIM source code)
- code\gnu-efi-3.0.8.tar.bz2                             (gnu-efi source code)
- code\grub-2.02+dfsg1-4.tar.bz2                         (Grub2 source code)
- grub2\                                                 (This path is the Grub2 file to be used in the final release [including 32bit and 64bit])
- LinuxKernel\                                           (This path is the Linux Kernel file to be used in the final release [including 32bit and 64 bit])
- shim\cab-signed\shimia32_v15_20180425.cab              (32Bit SHIM file submitted to sysdev. The cab file has been signed by EV code signing)
- shim\cab-signed\shimx64_v15_20180425.cab               (64Bit SHIM file submitted to sysdev. The cab file has been signed by EV code signing)
- shim\shimia32.efi                                      (32Bit SHIM binary to be signed)
- shim\shimx64.efi                                       (64Bit SHIM binary to be signed)
- shim\shimia32.efi.sha256sum                            (shimia32.efi sha256sum)
- shim\shimx64.efi.sha256sum                             (shimx64.efi sha256sum)
- shim build logs\shim_build_ia32.log                    (log file for building 32Bit SHIM file)
- shim build logs\shim_build_x64.log                     (log file for building 64Bit SHIM file)
- Isoo.cer                                               (Certificate embedded in SHIM)
- mk-install-gnu-efi.sh                                  (gnu-efi installation script)
- mk-shim.sh                                             (SHIM building script)

