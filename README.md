# iManager
Open Sourced application for Jailbroken device. Program is executing commands on connected iphones

# Usage
Maybe the source code is helping ppl who need to execute commands from a pc/mac on a jailbroken device? Also it teaches some ios commands and installs
basic command-line-tools like appinst and sbutils. 
You don´t need to run any command from terminal, just launch the application and everything should work. (READ THE INSTALL PART!!!)
demo/using video: https://youtu.be/wNHSVi1AC8c (the UI changed a bit but at all its still kinda similar) 
New Video: s00n
Installation tutorial video: s00n

# Installation
Skip this step when you already have it. 
Install homebrew https://brew.sh/ (Don´t worry its just a copy paste command)

Download iManager.dmg from the latest release, double click it and drag iphoneManage.app in the Applications folder.

# How to Connect your device:
Follow this tutorial when your device is running ios 11.0 or above https://www.reddit.com/r/jailbreak/comments/8wt534/tutorial_allow_localhost_ssh_access_on_electra/
For ios 10.x and older it should just work without the need to change or install any ssh tweaks.
make sure you have a tweak system installed on your device. (libhooker, Cydia Substrate or Substitute or whatever can load tweaks.)
^A tweak system will be installed already when you installed a tweak that show up in your Settings^

When iManager launchs up on your computer, click "Install Dependencies" and wait until its done. Reopen iManager and click it again. When its done your iphone should perfrom "ldrestart". Its a way to reload the system. (Just like respring or rebooting)



## Compiling:
Since iManager is working with the /Applications/iphoneManage.app folder, you should install iphoneManage.app to the /Applications folder on your mac. 
After that just open the Xcode project and remove signing or change it to your apple id. Now click the compile button and it should built + debug will work.
You should have sshpass and libimobiledevice installed.
You can install it using iManager because it will automaticly install it or type following commands: (homebrew neeeded!)

1. brew install esolitos/ipa/sshpass1.
2. brew install libimobiledevice

You can replace fork and upload your own modified version of iphoneManage.app as long as you credit this repo.
Also make sure to don´t change the dependencies installation methode when you don´t know what you are doing.


## Planned to be added in the future:
-Installing tweaks system, and package manager after jailbreaking with checkra1n
-Making a modified version of Sileo and adding an option to install it


## Have fun using iManager sorry!
Sorry again for the start issues with the first releases, they should be fixed now!!

# Credits
credits go to:
1.EzeRhythm https://github.com/ExeRhythm for making a pull request for my old code. I implemented some things into the new code
2.libimobiledevice https://github.com/libimobiledevice/libimobiledevice for usbmux stuff. (iproxy)
and sshpass but i couldnt find out who programmed it for macos :c


