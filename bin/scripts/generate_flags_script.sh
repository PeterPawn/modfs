#! /bin/sh
exec 1>"set_correct_flags.sh"
cat <<'EndOfCode'
#! /bin/sh
getflags()
{
cat <<'EndOfFiles'
EndOfCode
for f in modfs run_modscripts set_correct_flags.sh LICENSE BOOTSELECTION.ger $(find bin contrib files locale modscripts -type f); do
	[ "$(stat -c %F $f)" = "directory" ] && continue;
	[ "$(stat -c %F $f)" = "symbolic link" ] && continue;
	[ "$(expr "${f##*/}" : "\(.\).*")" = "." ] && continue;
	stat -c "%a %n" $f
done
cat <<'EndOfCode'
EndOfFiles
}
getflags | while read flags file; do
readlink -f -- "./$file" 2>/dev/null 1>&2 || continue
chmod $flags $file
done
EndOfCode
