#!/bin/bash

if test ! -d "/usr/local/admin/p4-old.app"; then
	mv /usr/local/admin/p4.app /usr/local/admin/p4-old.app
fi
rm /usr/local/admin/login_background.png

cp -R /Users/mathcsadmin/editP4/p4.app /usr/local/admin/p4.app
cp /Users/mathcsadmin/editP4/reboot-into-windows /usr/local/bin
cp /Users/mathcsadmin/editP4/reboot-into-windows-REALLY /usr/local/bin
cp /Users/mathcsadmin/editP4/shutdown-script /usr/local/bin
cp /Users/mathcsadmin/editP4/shutdown-script-REALLY /usr/local/bin

echo "cslab ALL= NOPASSWD: /usr/local/bin/reboot-into-windows
cslab ALL= NOPASSWD: /usr/local/bin/shutdown-script
cslab ALL= NOPASSWD: /sbin/shutdown" >> /etc/sudoers

rm -rf /Users/mathcsadmin/editP4
