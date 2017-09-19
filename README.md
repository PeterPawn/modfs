If you're looking for any version of 'modfs' to modify the firmware of your 
FRITZ!OS device, please use the current version from

http://yourfritz.de/modfs.tgz

If you want any older versions due to any good reason, you may checkout it 
yourself from the GitHub repository at

https://github.com/PeterPawn/modfs

and prepare a TAR file for the FRITZ!OS device or use any other way to transfer 
the files to your device. 

Please keep in mind, that you have to use a filesystem, which handles Unix 
access control rights correctly, to unpack and/or store the provided files. 
Do not use an USB storage volume with FAT or NTFS format here.

It's not possible to download from a HTTPS URL (like GitHub) to a device with 
firmware from AVM, because the 'wget' applet doesn't support TLS and AVM's own 
'httpsdl' utility is a little bit shy with its options and I wasn't able to 
persuade it to a direct download from 

https://codeload.github.com/PeterPawn/modfs/zip/master

- that's why I provide a mirror for the archive file, which is reachable without
a TLS connection.


But only the latest (or better: the most recent) version will be provided here
from now on.

