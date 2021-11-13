# iManager
Open Sourced application for Jailbroken device. Program is executing commands on connected iphones


## THE README WILL BE REWRITTEN TODAY OR TOMORROW!! I recoded iManager
You can download the recoded version (version 1.1) from the releases already. I also uploaded the recoded source code here, but the installation and compiling ways changed.

# Usage
Maybe the source code is helping ppl who need to execute commands from a pc/mac on a jailbroken device? Also it teaches some ios commands and installs
basic command-line-tools like appinst and sbutils. 
You don´t need to run any command from terminal, just launch iManager.app and everything should work. (READ THE INSTALL PART!!!)
#Cureent Features:
sbreload, install deb, shutdown, install ipa, install command line tools, uicache, respring, ldrestart and send files to your iphone.


# Supported
all ios version that support ssh will work with that code in theory

## I will rewrite the Installation and Compiling part at night or tomorrow. (I somehow recoded iManager bc people had issues with it. Sorry for not testing it on other macs.)

## Planned to be added in the future:
-Installing tweaks system, and package manager after jailbreaking with checkra1n
-Making a modified version of Sileo and adding an option to install it


## Have Fun using this programed. I only tested it with checkra1n jailbreak so don´t blame me when you need use a different port with iproxy.
# in case you need to use iproxy 2222 22 instead of iproxy 2222 44:
go to finder /Applications/iManagerlaunch.app and click show package content. right click the file named iManagerlaunch and say open with text editor,
look for where it´s says:
"/usr/local/Cellar/libusbmuxd/2.0.2/bin/iproxy 2222:44 > /dev/null 2>&1 &" 
replace the 44 with 22 so it will look like this:
"/usr/local/Cellar/libusbmuxd/2.0.2/bin/iproxy 2222:22 > /dev/null 2>&1 &" and save it(without the brackets ofc) 

