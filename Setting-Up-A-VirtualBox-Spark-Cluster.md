#Setting up a Virtual Box Ubuntu server.

The end result of these instructions will be a cluster of three servers running in VirtualBox, with 1 master and 2 workers.

###Instructions
1. Install VirtualBox
2. Download [Ubuntu 14.04 Minimal](https://help.ubuntu.com/community/Installation/MinimalCD)
3. Open VirtualBox:
  1. Click *New*
    1. Name the VM SparkMaster.
    2. Select Linux and the architecture (I haven't tried the 32 bit with Spark).
    3. Give the VM a decent amount of memory. Remember, however, that you will be running multiple instances. On my machine with 4G of RAM, I allocated 1G.
    4. Select the defaults until done.
  2. Under *File*
    1. Select *Preferences.*
      1. Select *Network*
        1. Select *Host-Only Networks*
          1. Click the *+* icon.
          2. Click OK
  2. Click *Settings*
    1. Under *System*, then deselect *Floppy Disk*.
    2. Under *Storage*
      1. Click the CD icon
      2. Under Attributes, click that CD icon
      3. Choose the *mini.iso* file downloaded in step 1.
    3.Click *Network*
      1. Under *Adapter 1*
        1. Make Sure 'Enable Network Adapter' is selected.
        2. Under attached to, choose *Host-only Adapter*
        3. Under name, choose the Adapter created in step 2. (Probably named vboxnet0.)
      2. Under *Adapter 2*
        1. Make Sure 'Enable Network Adapter' is selected.
        2. Under attached to, choose *NAT*
      3. Click OK
  3. Start the VirtualMachine.
4. In the new Virtual Machine
  1. Choose Install
  2. 'Enter' through the defaults until you get to *Configure the Network.*
    1. Select *eth1*
  3. Name the server master.
  4. 'Enter' through the defaults.
  5. Set username to 'master' and pick a password.
  6. 'Enter' through the defaults.
  7. Confirm disk partitioning.
  8. Choose no automatic updates. (Run `sudo apt-get update; sudo apt-get -y upgrade;` to update.)
  9. In the *Software Selection* menu, select
    1. Basic Ubuntu Server
    2. OpenSSH Server
  10. 'Enter' through the defaults until prompt to restart the system.
  11. Click 'Devices' on the VirtualBox window.
    1. Eject the CD. (May need to 'force unmount.')
  12. Restart the machine
5. Log in and run:
  1. `apt-get update; apt-get install -y git openjdk-7-jdk;`
  2. `git clone https://github.com/PaulTomchik/SettingUpSpark.git`
  3. `cd SettingUpSpark`
  4. `chmod +x InstallSpark.sh ConfigureNetworkInterfaces.sh CreateSSHKey.sh`
  5. `./InstallSpark.sh`
  6. `./CreateSSHKey.sh`
  7. `sudo ./ConfigureNetworkInterfaces.sh`
  8. `sudo halt -p` 
6. In VirtualBox
  1. Right click SparkMaster and select *Clone*.
  2. Name the clone *SparkSlave1*
  3. Check the reinitialize MACs box.
  4. Click through the defaults.  
  5. Right click SparkMaster and select *Clone*.
  6. Name the clone *SparkSlave2*
  7. Check the reinitialize MACs box.
  8. Click through the defaults.
7. Start *SparkSlave1* and run:
  1. `cd SettingUpSpark`
  2. `./ConfigureSlave1.sh`
  3. `sudo halt -p`
8. Start *SparkSlave2* and run:
  1. `cd SettingUpSpark`
  2. `./ConfigureSlave2.sh`
  3. `sudo halt -p`

##The Spark cluster should now be good to go!
