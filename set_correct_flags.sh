#! /bin/sh
getflags()
{
cat <<'EndOfFiles'
755 modfs
755 run_modscripts
664 LICENSE
644 BOOTSELECTION.ger
644 bin/scripts/check_signed_image
644 bin/scripts/wrap_script
644 bin/scripts/check_image_signature
755 bin/scripts/juis_check
644 bin/scripts/generate_flags_script.sh
755 bin/scripts/extract_version_values
755 bin/common/mke2fs.34kc.3.10.73
644 bin/common/busybox.config.34kc.3.10.73
755 bin/common/mksquashfs3.34kc.3.10.73
755 bin/common/e2fsck.34kc.3.10.73
644 bin/common/busybox.config.34kc.3.10.107
755 bin/common/decoder.34kc.3.10.73
755 bin/common/unsquashfs.34kc.3.10.73
755 bin/common/decoder.34kc.3.10.107
755 bin/common/openssl.34kc.3.10.107
755 bin/common/e2fsck.34kc.3.10.107
755 bin/common/mksquashfs4.34kc.3.10.107
755 bin/common/mksquashfs4.34kc.3.10.73
755 bin/common/busybox.34kc.3.10.73
755 bin/common/openssl.34kc.3.10.73
755 bin/common/mksquashfs3.34kc.3.10.107
755 bin/common/busybox.34kc.3.10.107
755 bin/common/mke2fs.34kc.3.10.107
755 bin/common/unsquashfs.34kc.3.10.107
754 contrib/modscripts/mod_multiple_fax_pages
664 contrib/README.md
460 contrib/custom/mod_custom
644 files/bootmanager.service
660 files/128MB_ext3.gz
644 files/telnetd_by_avm
644 files/bootmanager_server
644 files/256MB_ext3.gz
644 files/E99-custom
755 files/bootmanager
644 files/add_to_system_reboot.sh
464 locale/en
464 locale/de
754 modscripts/mod_exec_on_usb
754 modscripts/mod_multi_annex
754 modscripts/mod_remove_avm_vpn_from_overview
754 modscripts/mod_show_vpn_on_overview
754 modscripts/mod_prefer_fonnumber_name
754 modscripts/mod_mount_by_label
754 modscripts/mod_yourfritz_key
754 modscripts/mod_leddisplay
754 modscripts/mod_default_show_mac
754 modscripts/mod_show_vpn_on_overview_pre0724
754 modscripts/mod_telnet_enable
754 modscripts/mod_show_name
754 modscripts/mod_rc_tail_sh
754 modscripts/mod_ntp_on_ip_client
754 modscripts/mod_volatile_nas_dir
754 modscripts/mod_profile
754 modscripts/mod_swapoff
754 modscripts/gui_boot_manager_v0.7
754 modscripts/mod_exec_on_nand
644 modscripts/inactive/mod_custom_images
644 modscripts/inactive/mod_telnet_start_as_dtrace
644 modscripts/inactive/template
644 modscripts/inactive/yourfritz_hooks
644 modscripts/inactive/mod_telnet_start
644 modscripts/inactive/dectcmds.modscript
754 modscripts/mod_no_tainted_message
754 modscripts/mod_fixed_branding
754 modscripts/edit_rcuser
754 modscripts/mod_xchg_sort_icons
754 modscripts/mod_enable_calllog
754 modscripts/copy_binaries
754 modscripts/mod_night
EndOfFiles
}
getflags | while read flags file; do
readlink -f -- "./$file" 2>/dev/null 1>&2 || continue
chmod $flags $file
done
