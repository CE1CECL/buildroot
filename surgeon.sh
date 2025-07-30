#!/bin/bash
mkdir -p ./output/target/etc/default/
echo "TELNETD_ARGS=\"\$TELNETD_ARGS -l /bin/bash\"" > "./output/target/etc/default/telnet"
echo "DROPBEAR_ARGS=\"\$DROPBEAR_ARGS -B\"" > "./output/target/etc/default/dropbear"
echo "start 169.254.8.2" > "./output/target/etc/udhcpd.conf"
echo "end 169.254.8.254" >> "./output/target/etc/udhcpd.conf"
echo "interface usb0" >> "./output/target/etc/udhcpd.conf"
sed -i "s/.*:respawn:.*/::respawn:\/bin\/bash -c \'\/usr\/sbin\/ifconfig usb0 169.254.8.1 up \& \/usr\/sbin\/udhcpd -f -S -I 169.254.8.1 \/etc\/udhcpd.conf \& \/bin\/bash\'/g" "./output/target/etc/inittab"
