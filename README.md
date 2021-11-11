# iManager
Open Sourced application for Jailbroken device. Program is executing commands on connected iphones


# Usage
Maybe the source code is helping ppl who need to execute commands from a pc/mac on a jailbroken device? Also it teaches some ios commands and installs
basic command-line-tools like appinst and sbutils. 
You don´t need to run any command from terminal, just launch iManager.app and everything should work. (READ THE INSTALL PART!!!)
#Cureent Features:
sbreload, install deb, shutdown, install ipa, install command line tools, uicache, respring, ldrestart and send files to your iphone.


# Supported
all ios version that support ssh will work with that code in theory

# Compiling
Make sure to install Hombrew on your mac:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
After that you need to install to more things:
1. sshpass:
brew install esolitos/ipa/sshpass
2. libimobiledevice:
brew install libimobiledevice

After installing the things mentioned above, go to the release page and download the kirainstaller.dmg and paste iphoneManage.app and iManager.app in /Applications folder. (THIS STEP IS REQUIRED TO COMPILE)

When you are did everything above, download or git clone this repository and open the xcodeproj in xcode.
NOTE: When you are debugging iphoneManager with xcode, ssh will not work because iProxy will not be started. So before you debug, open terminal and type:
iproxy 2222:44 &


When you built your own version of iphoneManager and want to put it in /Applications folder, follow the steps below:
Because you already have my pre compiled iphoneManage.app in /Applications it will ask you to replace it, click replace
Now type following command to copy sshpass into iphoneManage.app folder: 
sudo cp -r /usr/local/Cellar/sshpass/1.06/bin/sshpass /Applications/iphoneManage.app/Contents/Resources/

Now unzip iManagerlaunch.app.zip in the xcode projects root folder and drag iManagerlaunch.app in your taskbar. (Its a launch script and will not show up in launchpad)
Done! Click the iManagerlaunch.app in your taskbar and wait for it to launch. When you get an alert/pop up on your iphone, click ok


# Installing
Sorry for all the work with installing it
## Step 1
To use iManager by Kira, follow this written guide to install everything correctly:

First of all install homebrew on your Mac. To do that, open terminal and paste that command:

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 

After the home-brew installation is done, you only need to paste to more commands:

brew install esolitos/ipa/sshpass
brew install libimobiledevice
## 1
Thats it, now you just need to download dmg file from the latest release, open it and drag the .app files in the Applications folder
## 2 Short
Drag the iManagerlaunch.app on your taskbar and launch it form there. It can not show up at launchpad. (Detailed reason is above). 
Lauching it from iphoneManager.app will not work. When you launch iManagerlaunch.app you will maybe get a pop up on your iphone, just click ok
## 2 Long
Now you should have two new apps (iManagerlaunch.app and iphoneManage.app)
But you can only open iphoneManager.app from the Launchpad because iManagerlaunch.app is just
a shell script as .app file. 
Launching the program from iphoneManager using Launchpad will work, but the program will not be 
Able to connect with anything. For that reason I made the iManager.app, it will launch the iphoneManage.app with right permission and connect it.
So when you want to open iManagerlaunch.app, drag the .app file to your Taskbar

## Have Fun using this programed. I only tested it with checkra1n jailbreak so don´t blame me when you need use a different port with iproxy.
# in case you need to use iproxy 2222 22 instead of iproxy 2222 44:
go to finder /Applications/iManagerlaunch.app and click show package content. right click the file named iManagerlaunch and say open with text editor,
look for where it´s says:
"/usr/local/Cellar/libusbmuxd/2.0.2/bin/iproxy 2222:44 > /dev/null 2>&1 &" 
replace the 44 with 22 so it will look like this:
"/usr/local/Cellar/libusbmuxd/2.0.2/bin/iproxy 2222:22 > /dev/null 2>&1 &" and save it(without the brackets ofc) 

