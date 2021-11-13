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
    // SSHPass path
    let sshpassPath = "/Applications/iphoneManage.app/Contents/Resources/sshpass"
    var sshPass: String = "alpine"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //the password that will be used as root password to connect using sshpass
        sshPass = UserDefaults().string(forKey: "rootpassword") ?? "alpine"
        textFieldDoForRootPs.stringValue = sshPass
        // Save appversion as string
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        _ = "2222"
        _ = "44"
        appver.stringValue = "version: \(appVersion!)"
        
        //kiracmlt("./iproxy2") //I TRIED TO MAKE A SCRIPT TO START IPROXY ON LAUNCH UP!! ITS NOT WORKING, RUNNING THE SCRIPT FROM TERMINAL INSTEAD WORKS FINE.
        func ldrestarting() {
            kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "ldrestart")
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
                
                _ = dialogOKCancel(question: "IMPORTANT", text: "Click the install dependencies button before you use the program")
            }
        }
    }
    
    @IBAction func imagetapped(_ sender: Any) {
        print("the user could be sussy")
    }
    // Text field to type a command
    @IBAction func runcommand(_ sender: NSTextField) {
        kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", runcommands.stringValue)
        
    }
    
    // From here the button function will start, i think its self explaining from here
    @IBAction func respringiphone(_ sender: Any) {
        print(sshPass)
        kiracmlt("ls")
        kiracmlt("cd", "/User/")
        kiracmlt("echo", "lool")
        kiracmlt("ls")
        kiracmlt("chmod", "+x", "sshpass")
        kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "sbreload")
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
                _ = "/var/mobile/iManagerkira/appinstall/"
                _ = "nothing"
                let aPatha = "/var/mobile/iManagerkira/appinstall/"
                _ = (sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "mkdir", aPatha)
                kiracmlt(sshpassPath, "-p",sshPass, "scp", "-P", "2222", path, "root@localhost:/var/mobile/iManagerkira/appinstall/")
                kiracmlt("echo", "what")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "mv", "/var/mobile/iManagerkira/appinstall/*", "/var/mobile/iManagerkira/appinstall/installapp.ipa")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "appinst", "\(aPatha)installapp.ipa")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "rm", "-rf", aPatha)
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "echo", "haha")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "sbalert", "-t", "iManagerkira", "-m", "Installed_Application:\(fileName)", "-d", "ok_cool")
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
                _ = "/var/mobile/iManagerkira/debinstall/"
                _ = "nothing"
                let aPatha = "/var/mobile/iManagerkira/debinstall/"
                _ = (sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "mkdir", aPatha)
                kiracmlt(sshpassPath, "-p", sshPass, "scp", "-P", "2222", path, "root@localhost:/var/mobile/iManagerkira/debinstall/")
                kiracmlt("echo", "what")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "mv", "/var/mobile/iManagerkira/debinstall/*", "/var/mobile/iManagerkira/debinstall/installdeb.deb")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "dpkg", "-i", "\(aPatha)installdeb.deb")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "rm", "-rf", "\(aPatha)installdeb.deb")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "echo", "haha")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "sbalert", "-t", "iManagerkira", "-m", "Installed_DEBAIN:\(fileName)", "-d", "ok_cool")
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
        kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "apt", "install", sbutils)
        kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "apt", "install", appsync)
        kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "apt", "install", ccsupport)
        kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "apt", "install", appinst)
        kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "ldrestart")
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
                _ = "/var/mobile/iManagerkira/appinstall/"
                _ = "nothing"
                let aPatha = "/var/mobile/iManagerkira/cmdlinetools/"
                _ = (sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "mkdir", aPatha)
                kiracmlt(sshpassPath, "-p",sshPass, "scp", "-P", "2222", path, "root@localhost:/var/mobile/iManagerkira/cmdlinetools/")
                kiracmlt("echo", "what")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "cp", "\(aPatha)\(cmdname)", "/usr/bin/")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "rm", "-rf", "\(aPatha)\(cmdname)")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "echo", "haha")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "sbalert", "-t", "iManagerkira", "-m", "Installed_Command:\(cmdname)", "-d", "ok_cool")
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
        kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "uicache", "-a")
        kiracmlt("pwd")
    }
    @IBAction func springboardspring(_ sender: Any) {
        kiracmlt("ls")
        kiracmlt("cd", "/User/")
        kiracmlt("echo", "lool")
        kiracmlt("ls")
        kiracmlt("chmod", "+x", "sshpass")
        kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "killall", "-9", "SpringBoard")
        kiracmlt("pwd")
    }
    @IBAction func ldrestart(_ sender: Any) {
        kiracmlt("ls")
        kiracmlt("cd", "/User/")
        kiracmlt("echo", "lool")
        kiracmlt("ls")
        kiracmlt("chmod", "+x", "sshpass")
        kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "ldrestart")
        kiracmlt("pwd")
    }
    @IBAction func saveroot(_ sender: Any) {
        sshPass = textFieldDoForRootPs.stringValue
        UserDefaults().set(sshPass, forKey: "rootpassword")
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
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "mkdir", "/var/mobile/iManagerkira/")
                kiracmlt(sshpassPath, "-p", sshPass, "scp", "-r", "-P", "2222", path, "root@localhost:\(iphonestandartdofilecopypath)")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "echo", "copp")
                kiracmlt(sshpassPath, "-p", sshPass, "ssh", "root@localhost", "-p", "2222", "sbalert", "-t", "File Copied", "-m", "copied_to_/var/mobile/iManagerkira/")
                
            }
            
        } else {
            return
        }
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

// Hope someone has learned something. Btw im not creating a function for each command because the source code should be easy to read for beginners.
