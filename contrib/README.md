## Contributed content from other authors

This directory contains contributed content from other 'modfs' users.

Possibly the GPLv2 isn't the correct license for files stored here or below this point.
Please check any file here, wether the author added own license conditions ... and only if such a notification is missing, you may assume, that the GPLv2 (or a later version of your choice) applies to the contributed content.

I'll not check any user-contributed file, wether it's providing the required information and I'll take no responsibility for any file herein or below this point.

Starting with version 0.4.5, the 'modfs' script looks here for a 'modscripts'
sub-directory and appends each file within it to the list of scripts to execute during modifications.

If you want to control the modscript selection with a 'custom_modscripts' file and you'd like to include a file from this sub-directory into it, you can specify the relative path from the 'modscripts' directory to this location; usually it would be the path '../contrib/modscripts' followed by the script name (starting in column 2).
