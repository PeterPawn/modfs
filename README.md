# modfs - improve AVM's original firmware with some small tweaks

The prefered way to get the content of this project is to clone the repository, if you don't want to download it directly to a FRITZ!Box device (with a VR9 chipset - other models can't use it to modify the firmware of the device, where "modfs" is running on).

If you want to download it to your router device, use the ZIP file (on the fly created by GitHub) from:

<https://codeload.github.com/PeterPawn/modfs/zip/refs/heads/master>

for a "released version" or

<https://codeload.github.com/PeterPawn/modfs/zip/refs/heads/beta>

for the "beta" branch.

Pay attention to the different directory names, after you've extracted the files from ZIP archive(s). The release version contains a base-directory called `modfs-master`, while the beta archive starts with `modfs-beta` in its upmost level.

If you're using an original firmware version by AVM, the provided BusyBox binary usually doesn't support HTTPS URLs for its `wget` applet. Instead AVM uses an own utility `httpsdl`, which tends to be unable to follow redirections from HTTP protocol (at least in some versions and/or with some URLs). That's why the URLs from above are from the last redirected to, if the journey has been started by `Download ZIP` from GitHub page.

So it shouldn't be needed anymore to load the gzip-compressed TAR archive from www.yourfritz.de - but it's (mostly) still available there (from the URL http[s]://yourfritz.de/modfs.tgz), with and without TLS-protected access.

Example(s) to download/unpack it from FRITZ!OS:

```shell
# cd /var
# httpsdl -O master.zip https://codeload.github.com/PeterPawn/modfs/zip/refs/heads/master
ok
# unzip -q master.zip
# find modfs-master/ | wc -l
182
#
```

or

```shell
# cd /var
# httpsdl -O - https://codeload.github.com/PeterPawn/modfs/zip/refs/heads/master | unzip -q -
ok
# find modfs-master/ | wc -l
182
#
```

without a permanently stored download file, to save some space from your `tmpfs` storage.

Please keep in mind, that you have to use a filesystem, which handles Unix/Linux access control rights correctly, to unpack and/or store the provided files. Do not use an USB storage volume with FAT or NTFS format here.

If you need any older version, please use the VCS provided by GitHub to checkout any previous version. There's no older version provided to be downloaded from yourfritz.de.

Most of this project and the provided modification scripts (called `modscripts` for short) is documented in a (meanwhile really large) thread in a Bulletin Board System called "IP-Phone-Forum", a (mostly german) board with discussions around Voice over IP and devices from german router manufacturer AVM. But other router manufacturers, open-source software and internet access providers from Germany (and other german-speaking countries in Europe) are discussed there.

The main thread for this project may be found here: <https://www.ip-phone-forum.de/threads/modfs-squashfs-image-avm-firmware-%C3%A4ndern-f%C3%BCr-nand-basierte-fritz-boxen.273304/post-2037875> - try to read the first post in the beginning (use an online-translator to read it in your own language) and further posts linked to from this first post. To collect info for latest changes, start at the last post and try to read at least 5 pages (100 posts) - it's your decision, whether you prefer to read top-down (start at end - 100) or bottom-up (don't stop, before you've reached 5 previous pages or the first 3 or 4 month old posts).

There's an attempt to collect scattered info from the thread mentioned above in another thread: <https://www.ip-phone-forum.de/threads/how-to-modfs-die-gebrauchsanleitung.284778/> (it's linked from the thread above, too, in the first ppost) - if your German is good enough (or your online translation tool), you may see it as another approach to explain things or to find links to important info in the long, long thread mentioned above.
