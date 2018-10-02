#! /bin/sh

# add all files from this directory to the 'wrapper' filesystem of target version
export ADD_TO_WRAPPER=atw_$(uname -r)

# debug shell code, creates /var/tmp/modfs_debug_shell.log
export MODFS_DEBUG_SHELL=1

# preset the working directory, skips selection from console
export MODFS_WORKING_DIR=/var/media/ftp/system

# skip pause in front of "mksquashfs"
export MODFS_NO_PAUSE_ON_PACK=1

# directory name and (optional) size limit for volatile NAS storage
#export MOD_VOLATILE_NAS_DIR_DIRNAME="nostore"
#export MOD_VOLATILE_NAS_DIR_LIMIT="32M"

# call "modfs" in update mode with the specified input image and (optional) output file name
./modfs update $1 $2

# save debug output to local file(s)
d=$(date +%s)
showshringbuf modfs >./modfs.log.$d
[ -f /var/tmp/modfs_debug_shell.log ] && cp -a /var/tmp/modfs_debug_shell.log ./modfs_debug_shell.log.$d