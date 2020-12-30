#!/bin/bash

CID=$1
SAKEY=$2

if (!(systemctl -q is-active falcon-sensor.service))
then

if (!(dpkg -l | grep cifs-utils))
  then
   sudo apt-get update -y -qq;
   sudo apt-get install cifs-utils -y;
fi

if grep -qs "/mnt/emilvcrowdstrikewesa " /proc/mounts; then
    sudo umount /mnt/emilvcrowdstrikewesa;
fi

if [ -d "/mnt/emilvcrowdstrikewesa" ]; then
    sudo rm -Rf /mnt/emilvcrowdstrikewesa;
fi

if [ ! -d "/etc/smbcredentials" ]; then
    sudo mkdir /etc/smbcredentials;
fi

if [ -f "/etc/smbcredentials/emilvcrowdstrikewesa.cred" ]; then
    sudo rm -f "/etc/smbcredentials/emilvcrowdstrikewesa.cred";
fi

sudo mkdir /mnt/emilvcrowdstrikewesa;
sudo bash -c 'echo "username=emilvcrowdstrikewesa" >> /etc/smbcredentials/emilvcrowdstrikewesa.cred'
sudo bash -c 'echo "password='$SAKEY'" >> /etc/smbcredentials/emilvcrowdstrikewesa.cred'

sudo chmod 600 /etc/smbcredentials/emilvcrowdstrikewesa.cred

sudo bash -c 'echo "//emilvcrowdstrikewesa.file.core.windows.net/executablelinux /mnt/emilvcrowdstrikewesa cifs nofail,vers=3.0,credentials=/etc/smbcredentials/emilvcrowdstrikewesa.cred,dir_mode=0777,file_mode=0777,serverino" >> /etc/fstab'
sudo mount -t cifs //emilvcrowdstrikewesa.file.core.windows.net/executablelinux /mnt/emilvcrowdstrikewesa -o vers=3.0,credentials=/etc/smbcredentials/emilvcrowdstrikewesa.cred,dir_mode=0777,file_mode=0777,serverino

PCKG=/mnt/emilvcrowdstrikewesa/*

sudo dpkg -i $PCKG
sudo /opt/CrowdStrike/falconctl -s -f --cid=$CID
sudo apt-get -f install -y
sudo systemctl start falcon-sensor

sleep 10s

sudo umount /mnt/emilvcrowdstrikewesa;
sudo rm -Rf /mnt/emilvcrowdstrikewesa;
sudo rm -Rf /etc/smbcredentials;

if (!(systemctl -q is-active falcon-sensor.service))
then
exit 127
fi


fi

