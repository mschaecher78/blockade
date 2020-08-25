# Define how to construct the Blockade bash script.
RELEASE = 2
LEVEL = 32
SUBLEVEL = 0

# Set version code and name.
export VERSION = $(RELEASE).$(LEVEL).$(SUBLEVEL)

export NAME = blockade

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
	fakeroot scripts/package-deb

clean:
	rm -Rf debian

install:
	scripts/direct-install
