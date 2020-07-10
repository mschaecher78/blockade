# Blockade

The idea of Blockade is to update the hosts on a monthly bases using the
build-in systemd timer, using [Steven Black's hosts project](https://github.com/StevenBlack/hosts).

Install.
`sudo make install`

Build deb package.
`make package`

Clean up package build
`make clean`

TODO
- [x] Keep configation after installing upgraded version.
- [x] Write up manpage for better help info.
- [ ] Add an Arch package to make process.
- [x] Add option to manual edit the hosts file.
- [ ] Add service/timer check to make sure the service is running.
- [ ] Add option to disable blockade either fully or for a set time.