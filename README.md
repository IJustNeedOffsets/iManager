# iManager
Open Sourced application for Jailbroken device. Program is executing commands on connected iphones


## THE README WILL BE REWRITTEN IN THE NEXT!! Im CURRENTLY recoding iManager
i removed the releases because both wasnt really stable and user told me some issues that they had. As i said above im currently working on it to fix those issues and release a more stable build. (Im also going to update the soruce code) I habe to apologize for creating a reddit post about this too fast and i should have tested it way more then i did.

# Usage
Maybe the source code is helping ppl who need to execute commands from a pc/mac on a jailbroken device? Also it teaches some ios commands and installs
basic command-line-tools like appinst and sbutils. 
You don´t need to run any command from terminal, just launch the application and everything should work. (READ THE INSTALL PART!!!)
demo/using video: https://youtu.be/wNHSVi1AC8c (the UI changed a bit but at all its still kinda similar

# soon

# RECODING STATUS
The things listed here aren't working/included in the uploaded source code yet. i will push the one im recoding here soon
-After following this tutorial (https://www.reddit.com/r/jailbreak/comments/8wt534/tutorial_allow_localhost_ssh_access_on_electra/?utm_source=share&utm_medium=ios_app&utm_name=iossmf) on your jailbroken device, iManager is always able to connect successfully. (its adding follwing two arguemnts -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null two the ssh command to connect.
-iManager is starting iproxy in the background manually
-iManager can install sshpass 
-iManager can install libimobiledevice
-iManager can install required tweaks on your iphone 

## I will rewrite the Installation and Compiling part at night or tomorrow. (I somehow recoded iManager bc people had issues with it. Sorry for not testing it on other macs.)

## Planned to be added in the future:
-Installing tweaks system, and package manager after jailbreaking with checkra1n
-Making a modified version of Sileo and adding an option to install it




TEMP UNTIL I INCLUDE THESE COMMANDS IN REWRITTEN INSTALLATION GUIDE!!!!!
Dont run the seconds command until you i uploaded i new version of iManager. Name will change too RainConfigurator anyways.
//tempt Installl Homebrew //tempt
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
//tmept install dependencies on mac and download needed tweaks for iphone //temp 
bash <(curl -s https://raw.githubusercontent.com/IJustNeedOffsets/iManager/main/installdepends)
