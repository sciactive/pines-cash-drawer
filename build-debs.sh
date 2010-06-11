#!/bin/sh
echo "Copying files..."
mkdir tmp_32/
cp -R deb/* tmp_32/
install -d tmp_32/usr/lib/firefox-addons/extensions/
cp -R firefox-extension/* tmp_32/usr/lib/firefox-addons/extensions/
cp -R tmp_32/ tmp_64/
cp control_32 tmp_32/DEBIAN/control
cp control_64 tmp_64/DEBIAN/control
cp mmf-drawer/dist/Release_32/GNU-Linux-x86/mmf-drawer tmp_32/usr/lib/firefox-addons/extensions/pinescashdrawer@hunter.perrin/drawer
cp mmf-drawer/dist/Release_64/GNU-Linux-x86/mmf-drawer tmp_64/usr/lib/firefox-addons/extensions/pinescashdrawer@hunter.perrin/drawer
echo "Building packages..."
dpkg -b tmp_32/ firefox-pines-cash-drawer-mmf_1.0_i386.deb
dpkg -b tmp_64/ firefox-pines-cash-drawer-mmf_1.0_amd64.deb
echo "Cleaning up..."
rm -r tmp_32/ tmp_64/
echo "Done."
