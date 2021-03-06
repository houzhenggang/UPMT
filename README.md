# UPMT
Universal Per-application Mobility management using Tunnels

SYNC local copy with GitHub Repository

```
cd /home/upmt/UPMT
git pull
```


## BASIC CONFIGURATION

```
1 - Create at least two virtual machines importing the Ubuntu_12.04_UPMT.ova
1.1 - The VM has 3 eth interfaces used for UPMT and one eth interface used for connecting to the host
1.2 - The 3 eth interfaces used for UPMT are connected to three VirtualBox internal interface
1.3 - Run "ip a" to check which interface names have been assigned to the VM interface
1.4 in order to fix the interface name assignment: 
      open VirtualBox settings, networking properties (advanced)
      check the mac addresses of Adapter 1, Adapter 2, Adapter 3, Adapter 4
      sudo gedit /etc/udev/rules.d/70-persistent-net.rules
        associate Adapter 1 -> eth0, Adapter 2 -> eth1, Adapter 3 -> eth2, Adapter 4 -> eth3
        delete all other interfaces
2 - cd /home/upmt/UPMT
3 - Open the java/upmt/cfg/peer/peer.cfg with a text editor.
    gedit /home/upmt/UPMT/java/upmt/cfg/peer/peer.cfg
Edit the line:
rme_vepa = <VEPA IP address> (they have to be different between the peers, i.e. 10.0.0.1 and 10.0.0.3)
Edit the line:
rme_net = <interface:IP address/subnet>
The rme_net interface addresses of the peers must be in the same subnet.
```

## BASIC CONFIGURATION EXAMPLE

```
On peer 1:
rme_vepa = 10.0.0.1
rme_net = eth0:192.168.0.1/24

On peer 2:
rme_vepa = 10.0.0.3
rme_net = eth0:192.168.0.3/24
```

## BUILD AND START THE UPMT PEERS (in each VM)

```
cd /home/upmt/UPMT
make clean: to clean all binaries files in the repository
make: to compile all upmt system
sudo make install: to install upmt modules
./startRME: to start upmt peer

To see the kernel live log type 'tail -f /var/log/kern.log'.

Measurement are collected in /home/upmt/Desktop/keepAlive_measures.dat file, each row is composed as |timestamp,rtt,loss|.

In the netem/custom folder there is a variant of the netem tool used to add delay and packet loss, use the following commands in order to build and install

cd /home/upmt/UPMT/netem/custom
make
make install

In the netem/delay and netem/loss folder there are example scripts that perfom a dynamic changes of the delay and loss conditions.
```

## APPENDIX
sudo password: upmt

The execution of the upmt solution changes the network configuration of the system.
To reset the network configuration: sudo service network-manager restart
