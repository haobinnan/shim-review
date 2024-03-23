*******************************************************************************
### What organization or people are asking to have this signed?
*******************************************************************************
- Qinhuangdao Yizhishu Software Development Co., Ltd.
- Isoo is a software developer for data recovery, disk utilities and system backup. https://isoo.com/
- Managing Director: Hao Binnan

*******************************************************************************
### What product or service is this for?
*******************************************************************************
- This is Isoo’s Linux-based operating system. We are going to develop some function based on the OS, such as resize partition, back up & restore operating system, etc.

*******************************************************************************
### What's the justification that this really does need to be signed for the whole world to be able to boot it?
*******************************************************************************
- Isoo wants to employ Secure Boot for building a trusted operating system from Shim to GRUB to the kernel to signed filesystem partitions. Secure Boot is the first step for this.
- Isoo would like customers to be able to run Isoo’s Linux-based system on any amd64(64Bit) and x86(32Bit) device without disabling Secure Boot.

*******************************************************************************
### Why are you unable to reuse shim from another distro that is already signed?
*******************************************************************************
- Because we provide our own GRUB2 and kernel builds. Therefore we need to provide our own shim for the bootchain to be complete.

*******************************************************************************
### Who is the primary contact for security updates, etc.?
The security contacts need to be verified before the shim can be accepted. For subsequent requests, contact verification is only necessary if the security contacts or their PGP keys have changed since the last successful verification.

An authorized reviewer will initiate contact verification by sending each security contact a PGP-encrypted email containing random words.
You will be asked to post the contents of these mails in your `shim-review` issue to prove ownership of the email addresses and PGP keys.
*******************************************************************************
- Name: Hao Binnan
- Position: Managing Director
- Email address: haobinnan@gmail.com
- PGP key fingerprint: 96781e8cb21e1e603997811df83bb3599ef21740

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

*******************************************************************************
### Who is the secondary contact for security updates, etc.?
*******************************************************************************
- Name: Liu jia
- Position: Managing Director
- Email address: liusirjiayou@126.com
- PGP key fingerprint: 8f1cbc231e3f09bb285821ba90dc2d87569e7070

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

*******************************************************************************
### Were these binaries created from the 15.8 shim release tar?
Please create your shim binaries starting with the 15.8 shim release tar file: https://github.com/rhboot/shim/releases/download/15.8/shim-15.8.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.8 and contains the appropriate gnu-efi source.

*******************************************************************************
- This is the unmodified shim-15.8 release.

*******************************************************************************
### URL for a repo that contains the exact code which was built to get this binary:
*******************************************************************************
- https://github.com/rhboot/shim

*******************************************************************************
### What patches are being applied and why:
*******************************************************************************
- ignore-print.patch: This patch ignores some warning messages from print output, for example: https://github.com/rhboot/shim/issues/506
- shim-15.8-alt-Bump-grub-SBAT-revocation-to-4.patch: This patch is mainly used to prevent grub with sbat less than 4 from running.

*******************************************************************************
### Do you have the NX bit set in your shim? If so, is your entire boot stack NX-compatible and what testing have you done to ensure such compatibility?

See https://techcommunity.microsoft.com/t5/hardware-dev-center/nx-exception-for-shim-community/ba-p/3976522 for more details on the signing of shim without NX bit.
*******************************************************************************
- It's not set.

*******************************************************************************
### If shim is loading GRUB2 bootloader what exact implementation of Secureboot in GRUB2 do you have? (Either Upstream GRUB2 shim_lock verifier or Downstream RHEL/Fedora/Debian/Canonical-like implementation)
*******************************************************************************
- Downstream RHEL/Fedora/Debian/Canonical-like implementation
- https://git.launchpad.net/ubuntu/+source/grub2/tag/?h=import/2.06-14
- 2.06-2ubuntu14.4 -- https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/grub2-unsigned/2.06-2ubuntu14.4/grub2-unsigned_2.06-2ubuntu14.4.debian.tar.xz

*******************************************************************************
### If shim is loading GRUB2 bootloader and your previously released shim booted a version of GRUB2 affected by any of the CVEs in the July 2020, the March 2021, the June 7th 2022, the November 15th 2022, or 3rd of October 2023 GRUB2 CVE list, have fixes for all these CVEs been applied?

* 2020 July - BootHole
  * Details: https://lists.gnu.org/archive/html/grub-devel/2020-07/msg00034.html
  * CVE-2020-10713
  * CVE-2020-14308
  * CVE-2020-14309
  * CVE-2020-14310
  * CVE-2020-14311
  * CVE-2020-15705
  * CVE-2020-15706
  * CVE-2020-15707
* March 2021
  * Details: https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html
  * CVE-2020-14372
  * CVE-2020-25632
  * CVE-2020-25647
  * CVE-2020-27749
  * CVE-2020-27779
  * CVE-2021-3418 (if you are shipping the shim_lock module)
  * CVE-2021-20225
  * CVE-2021-20233
* June 2022
  * Details: https://lists.gnu.org/archive/html/grub-devel/2022-06/msg00035.html, SBAT increase to 2
  * CVE-2021-3695
  * CVE-2021-3696
  * CVE-2021-3697
  * CVE-2022-28733
  * CVE-2022-28734
  * CVE-2022-28735
  * CVE-2022-28736
  * CVE-2022-28737
* November 2022
  * Details: https://lists.gnu.org/archive/html/grub-devel/2022-11/msg00059.html, SBAT increase to 3
  * CVE-2022-2601
  * CVE-2022-3775
* October 2023 - NTFS vulnerabilities
  * Details: https://lists.gnu.org/archive/html/grub-devel/2023-10/msg00028.html, SBAT increase to 4
  * CVE-2023-4693
  * CVE-2023-4692
*******************************************************************************
- The signed bootloaders are derived from grub 2.06 with all of the relevant patches.

*******************************************************************************
### If shim is loading GRUB2 bootloader, and if these fixes have been applied, is the upstream global SBAT generation in your GRUB2 binary set to 4?
The entry should look similar to: `grub,4,Free Software Foundation,grub,GRUB_UPSTREAM_VERSION,https://www.gnu.org/software/grub/`
*******************************************************************************
- Yes

*******************************************************************************
### Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?
### Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?
*******************************************************************************
- SHIM builds from before SBAT support have been revoked, and the cert this shim trusts has never been used to build any grub2 or kernel with these vulnerabilities.

*******************************************************************************
### If your boot chain of trust includes a Linux kernel:
### Is upstream commit [1957a85b0032a81e6482ca4aab883643b8dae06e "efi: Restrict efivar_ssdt_load when the kernel is locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1957a85b0032a81e6482ca4aab883643b8dae06e) applied?
### Is upstream commit [75b0cea7bf307f362057cc778efe89af4c615354 "ACPI: configfs: Disallow loading ACPI tables when locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75b0cea7bf307f362057cc778efe89af4c615354) applied?
### Is upstream commit [eadb2f47a3ced5c64b23b90fd2a3463f63726066 "lockdown: also lock down previous kgdb use"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eadb2f47a3ced5c64b23b90fd2a3463f63726066) applied?
*******************************************************************************
- All of the following commits are present:
- 475fb4e8b2f4444d1d7b406ff3a7d21bc89a1e6f 1957a85b0032a81e6482ca4aab883643b8dae06e 612bd01fc6e04c3ce9eb59587b4a7e4ebd6aff35 75b0cea7bf307f362057cc778efe89af4c615354 435d1a471598752446a72ad1201b3c980526d869
- And the configuration setting CONFIG_EFI_CUSTOM_SSDT_OVERLAYS is disabled.

*******************************************************************************
### Do you build your signed kernel with additional local patches? What do they do?
*******************************************************************************
- We have applied lockdown patches, nothing else that might be security relevant here.

*******************************************************************************
### Do you use an ephemeral key for signing kernel modules?
### If not, please describe how you ensure that one kernel build does not load modules built for another kernel.
*******************************************************************************
- When building the kernel, a ephemeral key is generated and signed.

*******************************************************************************
### If you use vendor_db functionality of providing multiple certificates and/or hashes please briefly describe your certificate setup.
### If there are allow-listed hashes please provide exact binaries for which hashes are created via file sharing service, available in public with anonymous access for verification.
*******************************************************************************
- We only embed out CA certificate. This CA is used to sign further signing certificates which are used for signing the binaries. No other hashes are [CertFile.cer]

*******************************************************************************
### If you are re-using a previously used (CA) certificate, you will need to add the hashes of the previous GRUB2 binaries exposed to the CVEs to vendor_dbx in shim in order to prevent GRUB2 from being able to chainload those older GRUB2 binaries. If you are changing to a new (CA) certificate, this does not apply.
### Please describe your strategy.
*******************************************************************************
- We switched to a new certificate after boothole2

*******************************************************************************
### What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as closely as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
### If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and what the differences would be.
*******************************************************************************
- Dockerfile to reproduce build is included.

*******************************************************************************
### Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
*******************************************************************************
- building 32bit SHIM file: logs/shim_build_ia32.log
- building 64bit SHIM file: logs/shim_build_x64.log

*******************************************************************************
### What changes were made in the distro's secure boot chain since your SHIM was last signed?
For example, signing new kernel's variants, UKI, systemd-boot, new certs, new CA, etc..
*******************************************************************************
- We switched to shim-15.8 and updated .sbat.

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
- shimia32.efi.sha256sum: a0241fc871a04202815b54a54fefb7943b1e284ded07e8327d85a1948ba50c79
- shimx64.efi.sha256sum: fadcacd698dd6d6828e576228e3be6e0845c0f80b1de0a961c6fdbf6a1a63ec4

*******************************************************************************
### How do you manage and protect the keys used in your SHIM?
*******************************************************************************
- They're stored in an HSM attached to dedicated build hosts. These hosts get used as the builder only when a production build is scheduled, only for specific packages, and only specific people can schedule them.

*******************************************************************************
### Do you use EV certificates as embedded certificates in the SHIM?
*******************************************************************************
- No.

*******************************************************************************
### Do you add a vendor-specific SBAT entry to the SBAT section in each binary that supports SBAT metadata ( GRUB2, fwupd, fwupdate, systemd-boot, systemd-stub, shim + all child shim binaries )?
### Please provide exact SBAT entries for all shim binaries as well as all SBAT binaries that shim will directly boot.
### Where your code is only slightly modified from an upstream vendor's, please also preserve their SBAT entries to simplify revocation.
If you are using a downstream implementation of GRUB2 or systemd-boot (e.g.
from Fedora or Debian), please preserve the SBAT entry from those distributions
and only append your own. More information on how SBAT works can be found
[here](https://github.com/rhboot/shim/blob/main/SBAT.md).
*******************************************************************************
- SBAT for shim:

> sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md  
> shim,4,UEFI shim,shim,1,https://github.com/rhboot/shim  
> shim.isoo,1,Isoo,shim,15.8,mail:haobinnan@gmail.com  

- SBAT for grub2:

> sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md  
> grub,4,Free Software Foundation,grub,2.06,https://www.gnu.org/software/grub/  
> grub.ubuntu,1,Ubuntu,grub2,2.06-2ubuntu14.4,https://www.ubuntu.com/  
> grub.isoo,1,Isoo,grub2,2.06-isoo,mail:haobinnan@gmail.com  

*******************************************************************************
### If shim is loading GRUB2 bootloader, which modules are built into your signed GRUB2 image?
*******************************************************************************
> newc / memdisk / cpio / part_gpt / part_msdos / msdospart / ntfs / ntfscomp / fat / exfat / normal / chain / boot / configfile / multiboot / png / all_video / search / blocklist / iso9660 / udf / minicmd / loopback / gfxmenu / gfxterm / reboot / romfs / procfs / sleep / ls / cat / echo / halt / test / probe / linux / cpuid / scsi / lsefi / lsefimmap / efifwsetup / efinet / linuxefi / backtrace / font / loadenv / syslinuxcfg / video

*******************************************************************************
### If you are using systemd-boot on arm64 or riscv, is the fix for [unverified Devicetree Blob loading](https://github.com/systemd/systemd/security/advisories/GHSA-6m6p-rjcq-334c) included?
*******************************************************************************
- We don't currently get shim signed for those arches.

*******************************************************************************
### What is the origin and full version number of your bootloader (GRUB2 or systemd-boot or other)?
*******************************************************************************
- GRUB2 version: 2.06-2ubuntu14.4
- https://git.launchpad.net/ubuntu/+source/grub2/tag/?h=import/2.06-14
- 2.06-2ubuntu14.4 -- https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/grub2-unsigned/2.06-2ubuntu14.4/grub2-unsigned_2.06-2ubuntu14.4.debian.tar.xz
- No extra patches

*******************************************************************************
### If your SHIM launches any other components, please provide further details on what is launched.
*******************************************************************************
- Our shim does not load any other components.

*******************************************************************************
### If your GRUB2 or systemd-boot launches any other binaries that are not the Linux kernel in SecureBoot mode, please provide further details on what is launched and how it enforces Secureboot lockdown.
*******************************************************************************
- Grub2 verifies signatures on booted kernels via shim.

*******************************************************************************
### How do the launched components prevent execution of unauthenticated code?
*******************************************************************************
- Grub2 include common secure boot patches so they will only load appropriately signed binaries.

*******************************************************************************
### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB2)?
*******************************************************************************
- No, our grub does not allow loading unsigned kernels when secure boot is enabled.

*******************************************************************************
### What kernel are you using? Which patches does it includes to enforce Secure Boot?
*******************************************************************************
- Linux Kernel: 6.1.80
- It has the usual lockdown patches applied.

*******************************************************************************
### Add any additional information you think we may need to validate this shim.
*******************************************************************************
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
│   ├── shim_v15.8_20240323.cab
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