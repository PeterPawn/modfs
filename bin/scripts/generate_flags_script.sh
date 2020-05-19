#! /bin/sh
exec 1>"set_correct_flags.sh"
cat <<'EndOfCode'
#! /bin/sh
getflags()
{
cat <<'EndOfFiles'
EndOfCode
for f in $(find -maxdepth 1 -type f) $(find bin modscripts -type f); do
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
