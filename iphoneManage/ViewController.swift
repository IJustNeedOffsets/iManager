//
//  ViewController.swift
//  iphoneManage
//
//  Created by kira on 07.11.21.
//
// Open Sourced build of iphoneManager. Since this will not be launched using iManagerlaunhch.app while debugging, start iproxy from terminal manually.
// Open Terminal and run: iproxy 2222 44
import Cocoa
import Foundation

// Function to run commands in the background later
@discardableResult
func kiracmlt(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}
func kiracmlt2(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}


func kiracdmlt(_ args: String...) {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
}
func kiracdmlt2(_ args: String...) {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
}
// UI Stuff
class ViewController: NSViewController {
    @IBOutlet weak var respbttn: NSButtonCell!
    @IBOutlet var textFieldDoForRootPs: NSTextField!
    @IBOutlet weak var uselessttash: NSButton!
    @IBOutlet weak var defaultPass: NSButton!
    @IBOutlet weak var usePass: NSButton!
    @IBOutlet weak var ouutpuxmanage: NSTextField!
    
   
    @IBOutlet weak var appver: NSTextField!
    @IBOutlet var runcommands: NSTextField!
    //SSHPass path
    public let sshpass = "/Applications/iphoneManage.app/Contents/Resources/sshpass"
    public let iproxy = "/Applications/iphoneManage.app/Contents/Resources/iproxy"
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //the password that will be used as root password to connect using sshpass
        textFieldDoForRootPs.stringValue = UserDefaults().string(forKey: "rootpassword") ?? "alpine"
       // Save appversion as string
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        let port2222 = "2222"
        let port44 = "44"
        appver.stringValue = "version: \(appVersion!)"
       //iproxy. Replace the 44 with 22 to make it work in case you can not connect using 2222 44 -> 2222 22
        kiracdmlt("/Applications/iphoneManage.app/Contents/Resources/iproxy", "2222", "44")
       // kiracdmlt2("/Applications/iphoneManage.app/Contents/Resources/iproxy", "2222", "22")
        func ldrestarting() {
        kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "ldrestart")
    }
        kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "sbalert", "-t", "iManager", "-m", """
"iManager Connected"
""")
    }

    override var representedObject: Any? {
        didSet {
        
            
        }
    }
   // Sending alert to install dep. before using
    override func viewDidAppear() {
        super.viewDidAppear()
        runcommands.stringValue = "echo"
        
        func depalert() -> Bool {

            if (!UserDefaults.standard.bool(forKey: "launched_before")) {
                UserDefaults.standard.set(true, forKey: "launched_before")
                return true
            }
            return false
        }
        if depalert() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        func dialogOKCancel(question: String, text: String) -> Bool {
            let alert = NSAlert()
            alert.messageText = question
            alert.informativeText = text
            alert.alertStyle = .informational
            alert.addButton(withTitle: "ok")
            return alert.runModal() == .alertFirstButtonReturn
        }

        let answer = dialogOKCancel(question: "IMPORTANT", text: "Click the install dependencies button before you use the program")
            
        }
           
        }
        
    }

    @IBAction func imagetapped(_ sender: Any) {
        print("the user could be sussy")
    }
    // Text field to type a command
    @IBAction func runcommand(_ sender: NSTextField) {
        kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", runcommands.stringValue)
        
    }
    
    // From here the button function will start, i think its self explaining from here
    @IBAction func respringiphone(_ sender: Any) {
  
        print(UserDefaults().string(forKey: "rootpassword")!)
        kiracmlt("ls")
        kiracmlt("cd", "/User/")
        kiracmlt("echo", "lool")
        kiracmlt("ls")
        kiracmlt("chmod", "+x", "sshpass")
        kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "sbreload")
        kiracmlt("pwd")

        
        
    }
    // Installing iPA/DEB/CLT are using the same fucntion at all:
    @IBAction func installapps(_ sender: Any) {
   
        let dialog = NSOpenPanel();

        dialog.title                   = "Select Application";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.allowsMultipleSelection = false;
        dialog.canChooseDirectories = false;
        dialog.allowedFileTypes = ["ipa", "iPA"];
    

        if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
            let result = dialog.url
            let fileName = result!.lastPathComponent
            print(fileName)
            
            if (result != nil) {
                let path: String = result!.path
                let iphonestandartdofilecopypath = "/var/mobile/iManagerkira/appinstall/"
                let lolol = "nothing"
                let aPatha = "/var/mobile/iManagerkira/appinstall/"
                let simplfier = (sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222")
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "mkdir", aPatha)
                kiracmlt(sshpass, "-p",UserDefaults().string(forKey: "rootpassword")!, "scp", "-P", "2222", path, "root@localhost:/var/mobile/iManagerkira/appinstall/")
                kiracmlt("echo", "what")
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "mv", "/var/mobile/iManagerkira/appinstall/*", "/var/mobile/iManagerkira/appinstall/installapp.ipa")
               kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "appinst", "\(aPatha)installapp.ipa")
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "rm", "-rf", aPatha)
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "echo", "haha")
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "sbalert", "-t", "iManagerkira", "-m", "Installed_Application:\(fileName)", "-d", "ok_cool")
                
            }

        } else {
            
            return
        }
    }
    
    @IBAction func uselesshit(_ sender: Any) {
       
    }
    @IBAction func installDebain(_ sender: Any) {
        let dialog = NSOpenPanel();

        dialog.title                   = "Selecte DEBAIN";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.allowsMultipleSelection = false;
        dialog.canChooseDirectories = false;
        dialog.allowedFileTypes = ["deb", "DEB"];
    

        if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
            let result = dialog.url
            let fileName = result!.lastPathComponent
            print(fileName)
            
            if (result != nil) {
                let path: String = result!.path
                let iphonestandartdofilecopypath = "/var/mobile/iManagerkira/debinstall/"
                let lolol = "nothing"
                let aPatha = "/var/mobile/iManagerkira/debinstall/"
                let simplfier = (sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222")
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "mkdir", aPatha)
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "scp", "-P", "2222", path, "root@localhost:/var/mobile/iManagerkira/debinstall/")
                kiracmlt("echo", "what")
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "mv", "/var/mobile/iManagerkira/debinstall/*", "/var/mobile/iManagerkira/debinstall/installdeb.deb")
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "dpkg", "-i", "\(aPatha)installdeb.deb")
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "rm", "-rf", "\(aPatha)installdeb.deb")
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "echo", "haha")
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "sbalert", "-t", "iManagerkira", "-m", "Installed_DEBAIN:\(fileName)", "-d", "ok_cool")
                
            }

        } else {
            
            return
        }

    }

    @IBAction func iDependencies(_ sender: Any) {
        let appsync = "net.angelxwind.appsyncunified"
        let sbutils = "io.github.awesomebing1.sbutils"
        let ccsupport = "com.opa334.ccsupport"
        let appinst = "com.linusyang.appinst"
     kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "apt", "install", sbutils)
        kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "apt", "install", appsync)
        kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "apt", "install", ccsupport)
        kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "apt", "install", appinst)
        kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "ldrestart")
    }
    @IBAction func InstallCommadnLineTool(_ sender: Any) {
        let dialog = NSOpenPanel();

        dialog.title                   = "Select Commandlinetool";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.allowsMultipleSelection = false;
        dialog.canChooseDirectories = false;
        dialog.allowedFileTypes = ["", " "];
    

        if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
            let result = dialog.url
            let cmdname = result!.lastPathComponent
            print(cmdname)
            
            if (result != nil) {
                let path: String = result!.path
                let iphonestandartdofilecopypath = "/var/mobile/iManagerkira/appinstall/"
                let lolol = "nothing"
                let aPatha = "/var/mobile/iManagerkira/cmdlinetools/"
                let simplfier = (sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222")
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "mkdir", aPatha)
                kiracmlt(sshpass, "-p",UserDefaults().string(forKey: "rootpassword")!, "scp", "-P", "2222", path, "root@localhost:/var/mobile/iManagerkira/cmdlinetools/")
                kiracmlt("echo", "what")
               kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "cp", "\(aPatha)\(cmdname)", "/usr/bin/")
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "rm", "-rf", "\(aPatha)\(cmdname)")
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "echo", "haha")
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "sbalert", "-t", "iManagerkira", "-m", "Installed_Command:\(cmdname)", "-d", "ok_cool")
                
            }

        } else {
            
            return
        }

    }
    @IBAction func uicachea(_ sender: Any) {
        kiracmlt("ls")
        kiracmlt("cd", "/User/")
        kiracmlt("echo", "lool")
        kiracmlt("ls")
        kiracmlt("chmod", "+x", "sshpass")
        kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "uicache", "-a")
        kiracmlt("pwd")
    }
    @IBAction func springboardspring(_ sender: Any) {
        kiracmlt("ls")
        kiracmlt("cd", "/User/")
        kiracmlt("echo", "lool")
        kiracmlt("ls")
        kiracmlt("chmod", "+x", "sshpass")
        kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "killall", "-9", "SpringBoard")
        kiracmlt("pwd")
    }
    @IBAction func ldrestart(_ sender: Any) {
        kiracmlt("ls")
        kiracmlt("cd", "/User/")
        kiracmlt("echo", "lool")
        kiracmlt("ls")
        kiracmlt("chmod", "+x", "sshpass")
        kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "ldrestart")
        kiracmlt("pwd")
    }
    @IBAction func saveroot(_ sender: Any) {
        UserDefaults().set(textFieldDoForRootPs.stringValue, forKey: "rootpassword")
        print("iManager will use ",textFieldDoForRootPs.stringValue, "as root password on your device")
    }
    
    @IBAction func rootPassword(_ sender: NSTextField) {
        UserDefaults().set(sender.stringValue, forKey: "rootpassword")
        print("iManager will use ",sender.stringValue, "as root password on your device")
        
          }
    @IBAction func sendfiles(_ sender: Any) {
        let dialog = NSOpenPanel();

        dialog.title                   = "Choose File or Directory";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.allowsMultipleSelection = false;
        dialog.canChooseDirectories = true;

        if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
            let result = dialog.url

            if (result != nil) {
                let path: String = result!.path
                let iphonestandartdofilecopypath = "/var/mobile/iManagerkira/"
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "mkdir", "/var/mobile/iManagerkira/")
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "scp", "-r", "-P", "2222", path, "root@localhost:\(iphonestandartdofilecopypath)")
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "echo", "copp")
                kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "ssh", "root@localhost", "-p", "2222", "sbalert", "-t", "File Copied", "-m", "copied_to_/var/mobile/iManagerkira/")
              
            }

        } else {
            
            return
        }
       
    }
  
   

    @IBAction func mountrootfs(_ sender: Any) {
        kiracmlt(sshpass, "-p", "alpine", "ssh", "root@localhost", "-p", "2222", "mount", "-o", "rw,union,update", "/")
    }
    @IBAction func modifyrootFS(_ sender: Any) {
//replace the orig progressUI
        kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "scp", "-r", "-P", "2222", "/Applications/iphoneManage.app/Contents/Resources/System/modifiedrootfs/System", "root@localhost:/")
        }
    @IBAction func backup(_ sender: Any) {
        //backup the orig progressUI
        kiracmlt(sshpass, "-p", UserDefaults().string(forKey: "rootpassword")!, "scp", "-r", "-P", "2222", "root@localhost:/System/Library/PrivateFrameworks/ProgressUI.framework", "/Applications/iphoneManage.app/Contents/Resources/Backups/")
    }
    @IBAction func credits(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        func dialogOKCancel(question: String, text: String) -> Bool {
            let alert = NSAlert()
            alert.messageText = question
            alert.informativeText = text
            alert.alertStyle = .informational
            alert.addButton(withTitle: "ok")
            return alert.runModal() == .alertFirstButtonReturn
        }

        let answer = dialogOKCancel(question: "CREDITS", text: """
                Credits go to:
                libimobiledevice for their libimobiledevice library https://github.com/libimobiledevice/libimobiledevice
                esolitos/ipa/sshpass for sshpass.
                Without those two this tools wouldn´t work.
                """)
            
        }
    }
    @IBAction func useport22(_ sender: Any) {
        kiracmlt("killall", "iproxy")
        kiracdmlt("/Applications/iphoneManage.app/Contents/Resources/iproxy", "2222", "22")
    }
}
  
extension FileManager.SearchPathDirectory {
    func createSubFolder(named: String, withIntermediateDirectories: Bool = false) -> Bool {
        guard let url = FileManager.default.urls(for: self, in: .userDomainMask).first else { return false }
        do {
            try FileManager.default.createDirectory(at: url.appendingPathComponent(named), withIntermediateDirectories: withIntermediateDirectories, attributes: nil)
            return true
        } catch {
            print(error)
            return false
        }
    }
}
    //Hope someone has learned something. Btw im not creating a function for each command because the source code should be easy to read for beginners.
