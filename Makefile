# Define how to construct the Blockade bash script.
RELEASE = 1
LEVEL = 0
SUBLEVEL = 0-5

# Set version code and name.
export VERSION = $(RELEASE).$(LEVEL).$(SUBLEVEL)
export NAME = Blockade

# Set hosts files type, options are 'commercial-skip, stupid-taxes,
# poor-social-skills, bad-acting, alex-jones and protest-all
#
# commercial-skip    = those adds that seem to populate
#                      webpages.
# stupid-taxes       = gambling related websites and adds.
# poor-social-skills = Social Media and other trackers.
# bad-acting         = anything that is porn related.
# alex-jones         = things that claim to be news, but
#                      are not.
# protest-all        = block everything, cause it all sucks.
export CONFIG_HOSTS_TYPE = protest-all

# How offen to update the hosts file (yearly, monthly, weekly and
#daily), the default is the best.
export CONFIG_UPDATE_FREQ = monthly

# Loopback can be "127.0.0.0, 127.0.0.1 or 0.0.0.0; but the later
# is faster.
# NOTE: this options is overridden of "CONFIG_REBUILD_HOSTS" is not
# set or set to n(o).
export CONFIG_LOOPBACK = 0.0.0.0

# The options are "y(es), n(o) or nothing
export CONFIG_REBUILD_HOSTS = yes

MASTER_LINK = https://raw.githubusercontent.com/StevenBlack

DEBIAN = debian/tmp/DEBIAN
SERVICE = debian/tmp/lib/systemd/system
DOC = debian/tmp/usr/share/doc/blockade
APP = debian/tmp/usr/bin
export DEBIAN SERVICE DOC APP

ifeq ($(CONFIG_HOSTS_TYPE),commercial-skip)
export LINK = $(MASTER_LINK)/hosts/master/hosts
endif

ifeq ($(CONFIG_HOSTS_TYPE),stupid-taxes)
export LINK = $(MASTER_LINK)/hosts/master/alternates/gambling/hosts
endif

ifeq ($(CONFIG_HOSTS_TYPE),poor-social-skills)
export LINK = $(MASTER_LINK)/hosts/master/alternates/social/hosts
endif

ifeq ($(CONFIG_HOSTS_TYPE),bad-acting)
export LINK = $(MASTER_LINK)/hosts/master/alternates/porn/hosts
endif

ifeq ($(CONFIG_HOSTS_TYPE),alex-jones )
export LINK = $(MASTER_LINK)/hosts/master/alternates/fakenews/hosts
endif

ifeq ($(CONFIG_HOSTS_TYPE),protest-all)
export LINK = $(MASTER_LINK)/hosts/master/alternates/fakenews-gambling-porn-social/hosts
endif

package:

	scripts/make-debian

	scripts/make-package

clean:
	rm -Rf debian
