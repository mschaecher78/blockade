# Define how to construct the Blockade bash script.
RELEASE = 1
LEVEL = 20
SUBLEVEL = 6-23.04

# Set version code and name.
export VERSION = $(RELEASE).$(LEVEL).$(SUBLEVEL)
export NAME = blockade
export NAME_VERSION = $(NAME)-$(VERSION)

TMP = debian/$(NAME)
DEBIAN = $(TMP)/DEBIAN
SERVICE = $(TMP)/lib/systemd/system
BLOCKADE = $(TMP)/usr/share/blockade
DOC = $(TMP)/usr/share/doc/blockade
APP = $(TMP)/usr/bin
export TMP DEBIAN SERVICE BLOCKADE DOC APP

package:
	make clean
	scripts/packaging

clean:
	rm -Rf debian
