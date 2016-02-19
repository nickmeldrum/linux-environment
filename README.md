# linux-environment
Setup for my linux environment - tested on debian 8 and xfce 4 only

You must have installed sudo and added current user as a sudo user before running this.

## Steps:

 1. `wu`
 2. `aptitude install sudo`
 3. `adduser nick sudo`
 4. `reboot`
 5. `wget -q -O - https://raw.githubusercontent.com/nickmeldrum/linux-environment/master/run.sh | source /dev/stdin`

## Notes:

 * You will need to do a reboot after the install script has run for the capslock mapping to take effect

## When running in a vm hosted by oracle virtualbox:

To get a better resolution:

 1. `su`
 2. then I ran Host+D (to insert the guest additions ISO),
 3. `mkdir /media/VirtualBoxGuestAdditions`
 4. `mount -r /dev/cdrom /media/VirtualBoxGuestAdditions`
 5. `export KERN_DIR=/usr/src/kernels/``uname -r```
 6. `cd /media/VirtualBoxGuestAdditions`
 7. `./VBoxLinuxAdditions.run`

