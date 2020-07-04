# Define how to construct the Blockade bash script.
RELEASE = 1
LEVEL = 20
SUBLEVEL = 63

# Set version code and name.
export VERSION = $(RELEASE).$(LEVEL).$(SUBLEVEL)
export NAME = blockade
export NAME_VERSION = $(NAME)-$(VERSION)

TMP = debian/$(NAME)
DEBIAN = /DEBIAN
SERVICE = /lib/systemd/system
BLOCKADE = /usr/share/blockade
DOC = /usr/share/doc/blockade
LIB = /usr/lib/blockade
APP = /usr/bin
export TMP DEBIAN SERVICE BLOCKADE DOC LIB APP

package:
	make clean
	scripts/packaging

clean:
	rm -Rf debian

install:
	scripts/install
