# Define how to construct the Blockade bash script.
RELEASE = 2
LEVEL = 24
SUBLEVEL = 10

# Set version code and name.
export VERSION = $(RELEASE).$(LEVEL).$(SUBLEVEL)
export NAME = blockade
export NAME_VERSION = $(NAME)-$(VERSION)

TMP = debian/$(NAME)
DEBIAN = /DEBIAN
SERVICE = /lib/systemd/system
BLOCKADE = /usr/share/blockade
MAN = /usr/share/man/man1
DOC = /usr/share/doc/blockade
LIB = /usr/lib/blockade
APP = /usr/bin
export TMP DEBIAN SERVICE BLOCKADE DOC LIB APP MAN

package:
	make clean
	scripts/packaging

clean:
	rm -Rf debian

install:
	scripts/direct-install
