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
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the linux community: https://pgp.mit.edu/pks/lookup?op=get&search=0xF83BB3599EF21740

-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Liu jia
- Position: Managing Director
- Email address: liusirjiayou@126.com
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the linux community: https://pgp.mit.edu/pks/lookup?op=get&search=0x90DC2D87569E7070

-------------------------------------------------------------------------------
What upstream shim tag is this starting from:
-------------------------------------------------------------------------------
- shim branches:15.2 (https://github.com/rhboot/shim/tree/74b05de7d19fa4f462b6e228a8a03f8ee242b673)

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
- https://github.com/rhboot/shim

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
- No patches have been applied

-------------------------------------------------------------------------------
If bootloader, shim loading is, grub2: is CVE-2020-10713 fixed ?
-------------------------------------------------------------------------------
- Yes

-------------------------------------------------------------------------------
If bootloader, shim loading is, grub2, and previous shims were trusting affected
by CVE-2020-10713 grub2:
* were old shims hashes provided to Microsoft for verification
  and to be added to future DBX update ?
* Does your new chain of trust disallow booting old, affected by CVE-2020-10713,
  grub2 builds ?
-------------------------------------------------------------------------------
- No
- Yes it uses mechanism that disallow to boot not signed grub binaries.

-------------------------------------------------------------------------------
If your boot chain of trust includes linux kernel, is
"efi: Restrict efivar_ssdt_load when the kernel is locked down"
upstream commit 1957a85b0032a81e6482ca4aab883643b8dae06e applied ?
Is "ACPI: configfs: Disallow loading ACPI tables when locked down"
upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 applied ?
-------------------------------------------------------------------------------
- Yes. CVE-2020-15780 and CVE-2019-20908 fixed by these commits

-------------------------------------------------------------------------------
If you use vendor_db functionality of providing multiple certificates and/or
hashes please briefly describe your certificate setup. If there are whitelisted hashes
please provide exact binaries for which hashes are created via file sharing service,
available in public with anonymous access for verification
-------------------------------------------------------------------------------
- My certificate is stored in a db created by pesign, which is stored on a separate computer that is only used for signing and only few trusted administrators can access it. Linux kernel, grubia32.efi and grubx64.efi are signed using this certificate.

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
If possible, provide a Dockerfile that rebuilds the shim.
-------------------------------------------------------------------------------
- OS: 
- Ubuntu 20.04.1 LTS (amd64)

- Toolchain: 
- binutils/focal,now 2.34-6ubuntu1 amd64
- gnu-efi 3.0.12 (URL:https://sourceforge.net/projects/gnu-efi/     |     Download URL:https://nchc.dl.sourceforge.net/project/gnu-efi/gnu-efi-3.0.12.tar.bz2)
- gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)

- mk-install-gnu-efi.sh              (gnu-efi installation script)
- mk-shim.sh                         (SHIM building script)

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
- building 32bit SHIM file: shim build logs/shim_build_ia32.log
- building 64bit SHIM file: shim build logs/shim_build_x64.log

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------
Notes:
- File lists:
```text
├── Isoo.cer                           (Certificate embedded in SHIM)
├── BuildDeployment.sh                 (The libraries and tools needed to install the build)
├── mk-install-gnu-efi.sh              (gnu-efi installation script)
├── mk-shim.sh                         (SHIM building script)
├── README.md
├── code
│   └── linuxkernel-SecureBootPatches  (Linux Kernel Secure Boot Patches)
├── shim
│   ├── cab-signed
│   │   ├── shimia32_v15_20190904.cab  (32Bit SHIM file submitted to sysdev. The cab file has been signed by EV code signing)
│   │   └── shimx64_v15_20190904.cab   (64Bit SHIM file submitted to sysdev. The cab file has been signed by EV code signing)
│   ├── shimia32.efi                   (32Bit SHIM binary to be signed)
│   ├── shimia32.efi.sha256sum         (shimia32.efi sha256sum)
│   ├── shimx64.efi                    (64Bit SHIM binary to be signed)
│   └── shimx64.efi.sha256sum          (shimx64.efi sha256sum)
└── shim build logs
    ├── shim_build_ia32.log            (log file for building 32bit SHIM file)
    └── shim_build_x64.log             (log file for building 64bit SHIM file)
```
