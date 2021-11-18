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
Install openssh on your device using Cydia or Sileo. (you just need to install it, you don't need to edit any ssh config files)
Make sure you have Cydia Substrate, Libhooker or Substitute installed on your device
When you did that
Launch iManager and wait until you get a pop up and then click install dependencies. When you had iManager installed before, you will not get a pop up but click install dependencies anyways. After it says done, quit. Open it again and click install Dependencies a second time. Now reopen it and enjoy



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
This is still in beta somehow so it can have many issues. PLEASE REPORT THEM so i can try to fix those asap.

# Credits
credits go to:
1.ExeRhythm https://github.com/ExeRhythm for making a pull request for my old code. I implemented some things into the new code
2.libimobiledevice https://github.com/libimobiledevice/libimobiledevice for usbmux stuff. (iproxy)
and sshpass but i couldnt find out who programmed it for macos :c


