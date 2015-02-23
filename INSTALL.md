# Installation

To install geheim, simple use

    make install

This installs all files below ```/usr/local```.

You can change the destination directory using the variable DEST:

    make DEST=/usr install

Note: Changing DEST has no effect to the source code, so if your packaging
geheim, you can use it to copy the files to a destination for files that
should be packaged:

    make DEST=${pkgdir}/usr install

