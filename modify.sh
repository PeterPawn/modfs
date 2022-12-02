# /bin/sh
modscripts()
(
	sed -n -e "s/^+\(.*\)/\1/p" <<EOT
-modscripts/mod_ntp_on_ip_client
+modscripts/mod_swapoff
-modscripts/mod_night
+modscripts/mod_prefer_fonnumber_name
+modscripts/mod_squashfs_mount
-modscripts/mod_fixed_branding
+modscripts/edit_rcuser
+modscripts/mod_show_name
+modscripts/mod_exec_on_nand
+modscripts/mod_default_show_mac
+modscripts/mod_profile
-modscripts/mod_show_vpn_on_overview_pre0724
-modscripts/mod_leddisplay
+modscripts/mod_yourfritz_key
-modscripts/mod_show_vpn_on_overview
-modscripts/mod_mount_by_label
-modscripts/mod_no_tainted_message
+modscripts/mod_no_tainted_flag
-modscripts/mod_multi_annex
+modscripts/mod_enable_calllog
+modscripts/mod_volatile_nas_dir
+modscripts/mod_swap_file
+modscripts/copy_binaries
+modscripts/mod_rc_tail_sh
-modscripts/mod_xchg_sort_icons
+modscripts/mod_swap_mount
+modscripts/mod_telnet_enable
+modscripts/gui_boot_manager_v0.8
-modscripts/mod_remove_avm_vpn_from_overview
+modscripts/mod_exec_on_usb
-modscripts/inactive/gui_boot_manager_v0.7
-modscripts/inactive/mod_telnet_start
-modscripts/inactive/mod_show_vpn_on_overview_pre0724
-modscripts/inactive/mod_show_vpn_on_overview
-modscripts/inactive/dectcmds.modscript
-modscripts/inactive/mod_telnet_start_as_dtrace
-modscripts/inactive/yourfritz_hooks
-modscripts/inactive/template
-modscripts/inactive/mod_custom_images
-contrib/custom/modscripts/mod_custom
-contrib/modscripts/mod_multiple_fax_pages
EOT
)
set -x
MODEL=${1:-7590}
VERSION=${2:-07.50}
MYDIR="${TMPDIR:-/tmp}/$(id | sed -n -e "s|uid=[0-9]*(\([^)]*\)).*|\1|p" | sed -e "s|[ \t]|_|g")/yf_sample"
[ -d "$MYDIR" ] && printf "Error creating working directory (already exists).\n\a" && exit 1
! mkdir -p "$MYDIR" && printf "Error creating working directory.\n\a" && exit 1
cd "$MYDIR"
URL="http://ftp.avm.de/fritzbox/fritzbox-$MODEL/deutschland/fritz.os/FRITZ.Box_$MODEL-$VERSION.image"
wget -q -O avm.tar $URL
tar -x -f avm.tar -O ./var/tmp/kernel.image >kernel
dd of=kernel.bin if=kernel bs=8 count=$(( ( $(stat -c %s kernel) / 8 ) - 1 )) 2>/dev/null
rm kernel
tar -x -f avm.tar -O ./var/tmp/filesystem.image >fs.sqfs
git clone --recurse-submodules https://github.com/PeterPawn/YourFritz.git
git clone --recurse-submodules https://github.com/PeterPawn/modfs.git
MAGIC=$(dd if=fs.sqfs count=4 bs=1 2>/dev/null)
[ "$MAGIC" = "sqsh" ] && ENDIAN=be || ENDIAN=le
sudo YourFritz/bin/squashfs/$(uname -m)/unsquashfs4-$ENDIAN -no-progress fs.sqfs
sudo chown -R $(id | sed -n -e "s|uid=\([0-9]*\).*|\1|p"):$(id | sed -n -e "s|.*gid=\([0-9]*\).*|\1|p") squashfs-root/
rm fs.sqfs
mkdir modfs/$MODEL
cd modfs/
for modscript in $(modscripts); do
	ln -s ../$modscript $MODEL/
done
./run_modscripts ../squashfs-root/ $MODEL
modrc=$?
cd ..
if [ "$modrc" -eq 0 ]; then
	YourFritz/bin/squashfs/$(uname -m)/mksquashfs4-$ENDIAN squashfs-root/ fs.sqfs -all-root -no-progress
	cat kernel.bin fs.sqfs >new.image
	ls -l
else
	printf "At least one 'modscript' reported an error, packing skipped.\n\a"
fi
exit $modrc
