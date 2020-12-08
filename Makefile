#!/bin/make -f

# Version numbering can be and most offend is ambiguous, so in order to keep things simple
# use date/time to set version by running date command at build time.
export version 	= `date +%y.%m.%d-%H%M`

export name = blockade

# Set general directory structure here instead of the the build scripts.
DEB = DEBIAN
SER = lib/systemd/system
DIR = usr/share/$(NAME)
MAN = usr/share/man/man1
DOC = usr/share/doc/$(NAME)
LYB = usr/lib/$(NAME)
BIN = usr/bin
export DEB SER DIR MAN DOC LYB BIN

package-deb:
	make clean
	fakeroot tools/make-deb

clean:
	rm -Rf debian

install:
	scripts/direct-install
