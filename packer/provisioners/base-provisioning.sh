#!/bin/bash

application_file_path="/vagrant/installed-application.md"

# define shared folders
SHAREDFOLDERDIR="/mnt/sharedfolder"

# update ubuntu
sudo apt -y update

# install nfs kernel
while :
do
  sudo apt install -y nfs-kernel-server
  retcode=$?
  if [ $retcode -eq 0 ]; then
    break
  fi
  echo "sleep 5s ..."
  sleep 5
done

while :
do
  sudo apt install -y lsb-core
  retcode=$?
  if [ $retcode -eq 0 ]; then
    break
  fi
  echo "sleep 5s ..."
  sleep 5
done

# create shared folder
sudo mkdir -p $SHAREDFOLDERDIR
sudo chown nobody:nogroup $SHAREDFOLDERDIR
sudo chmod 777 $SHAREDFOLDERDIR

# add shared folder to exports
sudo echo "# $SHAREDFOLDERDIR  172.16.1.0/255.255.255.0(rw,async)" >> /etc/exports

# set version
UBUNTU_VERSION=$(lsb_release -a | grep Release | awk  '{print $2}')
echo "# Installed application "  > $application_file_path
echo "***                     " >> $application_file_path
echo "> Ubuntu: $UBUNTU_VERSION with NFS" >> $application_file_path


