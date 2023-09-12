#TINC Tunnel Setup

#Step 1
#Install TINC and create folders and base conf
sudo apt install -y tinc && echo -e "VPN-Nucleus" >> /etc/tinc/nets.boot && mkdir -p /etc/tinc/VPN-Nucleus/hosts && cd /etc/tinc/VPN-Nucleus/ && HOSTNAME1=$( hostname | sed -e 's/-/_/g') && echo -e "Name = $HOSTNAME1" "\nDevice = /dev/net/tun \nAddressFamily = ipv4\nConnectTo = nucleus\nPort = 0" >> /etc/tinc/VPN-Nucleus/tinc.conf

#Setup network interfaces and make them exc-able
echo -e '#!/bin/sh \nifconfig $INTERFACE 192.168.255.IP netmask 255.255.255.0' >> /etc/tinc/VPN-Nucleus/tinc-up && echo -e '#!/bin/sh \nifconfig $INTERFACE down' >> /etc/tinc/VPN-Nucleus/tinc-down && sudo chmod -v +x /etc/tinc/VPN-Nucleus/tinc-{up,down}


#generate nucleus key
echo -e "Address = 160.119.137.75 \nSubnet = 192.168.255.254/32 \nPort = 656\n\n-----BEGIN RSA PUBLIC KEY----- \nMIIECgKCBAEA9IEIr1OKHfi88JSlMrFIrlR67bOhYZxBQlH2UqOx68nC1EwCI2mE\nK+R0SFtwg8JcJ1dkfZA9teKsuuJLXJragUQjGpgUZNUsN4eLke1XJmYNX5wX/xvc\nrAuEh7mJi6zjGf0LTk6BslUlGhwuXtKEz40RnyqSia4u5Vg0UtE4Ufc8Hg2Mgn0e\nl1q2LwmwvMatdqpjgxB6gkGPjOCPRZjhwTk1IlJCS8opggWkiuCV6Mh+ncvo7CQ1\n8ArcZA0T6fLcLHGh4q8I/a481A88UWkrhUhzTj0ScGhyWe0m0j0/+CgMoA6VDxO2\neBrcaYy9H8GXIR6dLDuDFHQqBnfQRGoC2toLW9Aq9QHnANI235tMY54KloCvlWBQ\nPQFNcbshUzWa1586W2U9WEv+MK94emBTSLqL5X9MRsej8xmP5LxPQLXs0+Aj6X2q\nglUvuuTnK/YQyK+awjeXJbpKvUTw/w+5UmylvaDeCqDZwnyRbKfOSe7/hJMvPlsZ\ngA39Ey8MTsCbecDxZTnR4DuaB7MCoCny3oGMckgG0I+ZLAamUmxUSB6iF26IYqKb\n3n5xEr6WgDOY+Tn/d/KvQfPgmICgw36v6uzpzbJE3d0xzShYdDWFMmDmrVUBJg75\nj4cD+b9gwWpz2JzfTltjvKAVdrl+XuHpNmodZnxA40VUbaejLglrIhpLWVCST+qG\nEBIWWEV+ATDqTZopLgpweMWPpuXu8+0HyW4UUIFSVsMXR7ElFRYZ2joDQhVtFzUY\nOpMZmWfbbPTaYs8u+nzuBF5UUFfSCOAORZMjs11mBMoR6AYmzY+0q4ISFn9F2l9H\ngDCPhE90XTfMKvq/CmUhSSsJ1gJQmjRPLiqEPqQDiO9yA57RGbnH3jjN5J42VKMd\nOlXl06UstQGkgI9bdieFqHy5tqbCKztkr7wENZsye7A7fM0USBQLZdADuxVB7cA2\nQ1GGrmaV8aqaFkEiJnWzSoQLku0YIZ7AoSG6n9OS9JnC6E3/tUpZ0G2H/MX0zAUV\nZoxxdhpP3srOhpdA2kM6mlaAZ/fR3gLbWXiKCDRn8oDM3CrRdci9U2B7LQIIVUdG\n5HZP2aAr/VqS6KyA8kQBq2capDUQWMhbr32x1Q3wTGS+WP600ULyLmq7btHznRYH\n/xJKsYRFQqWblz5/4Uf4n5u5IfRV+lKLnTGMdZexmw5vWDGm02x4SfAShrwSecWp\noAX+XRTUw5jfJ9VsNkE/OxN6dt25KVWUFusfoNz2ko/Lr9FHGmj0bs1UAk1Kj7oK\nF5pvZan4c0/E6ZKVMn7EUKhFJ+7n+RUCZOh6PLhkqqo10cJtmAOfex3N36jz0UQw\nWUdNVRL4p11s02VT/HyU/zQgcdcpbXFjHQIDAQAB\n-----END RSA PUBLIC KEY----- " >> /etc/tinc/VPN-Nucleus/hosts/nucleus

-Nucleus

echo -e  "Subnet = 192.168.255.IP/32" >> /etc/tinc/VPN-Nucleus/hosts/$HOSTNAME1

reboot
#now to generate our own keys and send them to me to add to the VPN server

sudo tincd -n VPN-Nucleus -K 8192

get key and IP

 s)

sudo tincd -n VPN-Nucleus -D -d10

&& service tinc restart

#here we create our keys

sudo tincd -n VPN -K 8192 # need some logic to press enter twice here *

}
# Demonize the process to bring tunnel back up. #enable a boot and Start
echo -e "[Unit]\nDescription=Tinc net VPN\nAfter=network.target\n\n[Service]\nType=simple\nWorkingDirectory=/etc/tinc/VPN\nExecStart=/sbin/tincd -n VPN -D -d3\nExecReload=/sbin/tincd -n VPN -kHUP\nTimeoutStopSec=5\nRestart=always\nRestartSec=60\n\n\n[Install]\nWantedBy=multi-user.target" >> /etc/systemd/system/tinc.service && sudo systemctl enable tinc.service && sudo systemctl start tinc.service
