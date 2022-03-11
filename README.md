-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
- Qinhuangdao Yizhishu Software Development Co., Ltd.
- Isoo is a software developer for data recovery, disk utilities and system backup. https://isoo.com/
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
- PGP key fingerprint: 96781e8cb21e1e603997811df83bb3599ef21740

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Liu jia
- Position: Managing Director
- Email address: liusirjiayou@126.com
- PGP key fingerprint: 8f1cbc231e3f09bb285821ba90dc2d87569e7070

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

-------------------------------------------------------------------------------
Please create your shim binaries starting with the 15.4 shim release tar file:
https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.4 and contains
the appropriate gnu-efi source.
-------------------------------------------------------------------------------
- This is based on shim 15.5

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
- https://github.com/rhboot/shim

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
- No patches have been applied

-------------------------------------------------------------------------------
If bootloader, shim loading is, GRUB2: is CVE-2020-14372, CVE-2020-25632,
 CVE-2020-25647, CVE-2020-27749, CVE-2020-27779, CVE-2021-20225, CVE-2021-20233,
 CVE-2020-10713, CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311,
 CVE-2020-15705, and if you are shipping the shim_lock module CVE-2021-3418
-------------------------------------------------------------------------------
- Yes

-------------------------------------------------------------------------------
What exact implementation of Secureboot in GRUB2 ( if this is your bootloader ) you have ?
* Upstream GRUB2 shim_lock verifier or * Downstream RHEL/Fedora/Debian/Canonical like implementation ?
-------------------------------------------------------------------------------
- Downstream RHEL/Fedora/Debian/Canonical like implementation
- https://git.launchpad.net/ubuntu/+source/grub2/tag/?h=import/2.06-2ubuntu5

-------------------------------------------------------------------------------
If bootloader, shim loading is, GRUB2, and previous shims were trusting affected
by CVE-2020-14372, CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
  CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
  CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
  and if you were shipping the shim_lock module CVE-2021-3418
  ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
  grub2:
* were old shims hashes provided to Microsoft for verification
  and to be added to future DBX update ?
* Does your new chain of trust disallow booting old, affected by CVE-2020-14372,
  CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
  CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
  CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
  and if you were shipping the shim_lock module CVE-2021-3418
  ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
  grub2 builds ?
-------------------------------------------------------------------------------
- No
- Yes, the new chain of trust disallows booting old, affected by CVE-2020-14372,....

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
hashes please briefly describe your certificate setup. If there are allow-listed hashes
please provide exact binaries for which hashes are created via file sharing service,
available in public with anonymous access for verification
-------------------------------------------------------------------------------
- We only embed out CA certificate. This CA is used to sign further signing certificates which are used for signing the binaries. No other hashes are [CertFile.cer]

-------------------------------------------------------------------------------
If you are re-using a previously used (CA) certificate, you will need
to add the hashes of the previous GRUB2 binaries to vendor_dbx in shim
in order to prevent GRUB2 from being able to chainload those older GRUB2
binaries. If you are changing to a new (CA) certificate, this does not
apply. Please describe your strategy.
-------------------------------------------------------------------------------
- We switched to a new certificate after boothole2

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and what the differences would be.
-------------------------------------------------------------------------------
- Dockerfile to reproduce build is included.

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
- building 32bit SHIM file: logs/shim_build_ia32.log
- building 64bit SHIM file: logs/shim_build_x64.log

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------
Notes:
- File lists:
```text
├── CertFile.cer                        (Certificate embedded in SHIM)
├── dbx.hashes                          (File Blacklist)
├── Dockerfile
├── generate_dbx_list                   (Generate a DBX file)
├── mk-shim.sh                          (SHIM building script)
├── README.md
├── shim_orig
│   ├── shim_v15.5_20220311.cab
│   ├── shimia32.efi                    (32Bit SHIM binary to be signed)
│   ├── shimia32.efi.sha256sum          (shimia32.efi sha256sum)
│   ├── shimx64.efi                     (64Bit SHIM binary to be signed)
│   └── shimx64.efi.sha256sum           (shimx64.efi sha256sum)
└── logs
│   ├── shim_build_ia32.log             (log file for building 32bit SHIM file)
│   └── shim_build_x64.log              (log file for building 64bit SHIM file)
└── vendor_dbx
    ├── ia32_dbx.esl                    (32Bit dbx binary)
    └── x64_dbx.esl                     (64Bit dbx binary)
```
