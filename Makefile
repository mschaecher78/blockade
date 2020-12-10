#!/bin/make -f

# Version numbering can be and most offend is ambiguous, so in order to keep things simple
# use date/time to set version by running date command at build time.
export version 	= 20.12.10-1146

export name = blockade

# Set general directory structure here instead of the the build scripts.
deb = DEBIAN
ser = lib/systemd/system
fil = usr/share/$(name)
man = usr/share/man/man1
doc = usr/share/doc/$(name)
lib = usr/lib/$(name)
bin = usr/bin
export deb ser fil man doc lib bin

package-deb:
	make clean
	fakeroot tools/make-deb

clean:
	rm -Rf debian

install:
	tools/direct-install
