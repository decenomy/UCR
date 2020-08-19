
Debian
====================
This directory contains files used to package ucrd/ucr-qt
for Debian-based Linux systems. If you compile ucrd/ucr-qt yourself, there are some useful files here.

## ucr: URI support ##


ucr-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install ucr-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your ucrqt binary to `/usr/bin`
and the `../../share/pixmaps/ucr128.png` to `/usr/share/pixmaps`

ucr-qt.protocol (KDE)

