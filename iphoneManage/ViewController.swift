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
    
    func customcommand(_ command: String) throws -> String {
        let task = Process()
        let pipe = Pipe()
        
        task.standardOutput = pipe
        task.standardError = pipe
        task.arguments = ["-c", command]
        task.executableURL = URL(fileURLWithPath: "/bin/zsh")
        do {
                try task.run()
            }
            catch{ throw error }
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!
        consoleoutput.stringValue = output
        return output
    }
    @IBOutlet weak var appver: NSTextField!
    @IBOutlet var runcommands: NSTextField!
    @IBOutlet weak var idevicemodel: NSTextField!
    @IBOutlet weak var standartinfo: NSTextField!
    @IBOutlet weak var consoleoutput: NSTextField!
    //sshpassPath path
    public let sshpassPath = "/Applications/iphoneManage.app/Contents/Resources/sshpass"
    public let iproxy = "/Applications/iphoneManage.app/Contents/Resources/iproxy"
    public let unneedirec = "/Users/*/"
    public let applicationrf = "/Applications/iphoneManage.app/Contents/"
    public let iManagerresources = "/Applications(iphoneManage.app/Contents/Resources"
    var sshpass: String = "alpine"
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //the password that will be used as root password to connect using sshpassPath
        sshpass = UserDefaults().string(forKey: "rootpassword") ?? "alpine"
        textFieldDoForRootPs.stringValue = sshpass
       // Save appversion as string
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        let port2222 = "2222"
        let port44 = "44"
        appver.stringValue = "version: \(appVersion!)"
        kiracmlt("killall", "iproxy")
        kiracdmlt2("/Applications/iphoneManage.app/Contents/Resources/iproxy", "2222", "22")
        title = ""
        UserDefaults.standard.set(true, forKey: "port22") //Bool
        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "uname", "-m", ">iManagermodel.txt")
        kiracmlt(sshpassPath, "-p", sshpass, "scp", "-r", "-P", "2222", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost:/var/root/iManagermodel.txt", "/Applications/iphoneManage.app/Contents/Resources/")
        kiracmlt(sshpassPath, "-p", sshpass, "scp", "-r", "-P", "2222", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost:/var/root/iManageriosversion.txt", "/Applications/iphoneManage.app/Contents/Resources/")
        
        let model1 = "/Applications/iphoneManage.app/Contents/Resources/iManagermodel.txt"
        do {
            // Use contentsOfFile overload.
            // ... Specify ASCII encoding.
            // ... Ignore errors.
            var data = try? String(contentsOfFile: model1,
                                   encoding: String.Encoding(rawValue: String.Encoding.ascii.rawValue))

            // If a value was returned, print it.
            //print(data!)
            idevicemodel.stringValue = data ?? "non connected"
            print(idevicemodel.stringValue)
        }
        let iosversion = "/Applications/iphoneManage.app/Contents/Resources/iManageriosversion.txt"
        do {
            // Read an entire text file into an NSString.
            let contents = try? String(contentsOfFile: iosversion,
                                       encoding: String.Encoding(rawValue: String.Encoding.ascii.rawValue))

            // Print all lines.
            //contents?.enumerateLines({ (line, stop) -> () in
            self.standartinfo.stringValue = contents ?? ""
               // print("\(line)")
                
         //   })
        }
        
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
        kiracmlt("/Applications/iphoneManage.app/Contents/Resources/installdepends")
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        func dialogOKCancel(question: String, text: String) -> Bool {
            let alert = NSAlert()
            alert.messageText = question
            alert.informativeText = text
            alert.alertStyle = .informational
            alert.addButton(withTitle: "ok")
            return alert.runModal() == .alertFirstButtonReturn
        }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        let answer = dialogOKCancel(question: "IMPORTANT", text: "Click the install dependencies button before you use the program")
                }
        }
           
        }
        kiracdmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "sbalert", "-t", "iManager", "-m", """
"iManager Connected"
""")
    }

    @IBAction func imagetapped(_ sender: Any) {
        print("the user could be sussy")
        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "echo")
    }
    // Text field to type a command
    @IBAction func runcommand(_ sender: NSTextField) {
//Running command
        let loaclphone = "root@localhost"
        do {
            try customcommand("\(sshpassPath) -p \(sshpass) ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \(loaclphone) -p 2222 \(runcommands.stringValue)")
           
        }
        catch {
            print("\(error)") //handle or silence the error here
        }
        
    }
    
    // From here the button function will start, i think its self explaining from here
    @IBAction func respringiphone(_ sender: Any) {
  
        print(sshpass)
        kiracmlt("ls")
        kiracmlt("cd", "/User/")
        kiracmlt("echo", "lool")
        kiracmlt("ls")
        kiracmlt("chmod", "+x", "sshpassPath")
        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "sbreload")
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
                let simplfier = (sshpassPath, "-p", sshpass, "ssh", "root@localhost", "-p", "2222")
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "mkdir", aPatha)
                kiracmlt(sshpassPath, "-p",sshpass, "scp", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "-P", "2222", path, "root@localhost:/var/mobile/iManagerkira/appinstall/")
                kiracmlt("echo", "what")
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "mv", "/var/mobile/iManagerkira/appinstall/*", "/var/mobile/iManagerkira/appinstall/installapp.ipa")
               kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "appinst", "\(aPatha)installapp.ipa")
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "rm", "-rf", aPatha)
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "echo", "haha")
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "sbalert", "-t", "iManagerkira", "-m", """
"Installed Application:\(fileName)"
""", "-d", "ok")
                
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
                let simplfier = (sshpassPath, "-p", sshpass, "ssh", "root@localhost", "-p", "2222")
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "mkdir", aPatha)
                kiracmlt(sshpassPath, "-p", sshpass, "scp", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "-P", "2222", path, "root@localhost:/var/mobile/iManagerkira/debinstall/")
                kiracmlt("echo", "what")
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "mv", "/var/mobile/iManagerkira/debinstall/*", "/var/mobile/iManagerkira/debinstall/installdeb.deb")
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "dpkg", "-i", "\(aPatha)installdeb.deb")
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "rm", "-rf", "\(aPatha)installdeb.deb")
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "echo", "haha")
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "sbalert", "-t", "iManagerkira", "-m", """
Installed DEBAIN:\(fileName) You maybe need to respring when you installed a Tweak.
""", "-d", "ok")
                
            }

        } else {
            
            return
        }

    }

    @IBAction func iDependencies(_ sender: Any) {
//        let appsync = "net.angelxwind.appsyncunified"
//        let sbutils = "io.github.awesomebing1.sbutils"
//        let ccsupport = "com.opa334.ccsupport"
//        let appinst = "com.linusyang.appinst"
//     kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "apt", "install", sbutils)
//        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "apt", "install", appsync)
//        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "apt", "install", ccsupport)
//        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "apt", "install", appinst)
//        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "ldrestart")
    }
    @IBAction func installdepends(_ sender: Any) {
        kiracmlt("/Applications/iphoneManage.app/Contents/Resources/installdepends")
        let sbutils = "/Applications/iphoneManage.app/Contents/Resources/tweaks/io.github.awesomebing1.sbutils_2.1.1_iphoneos-arm.deb"
        let appsyncr = "/Applications/iphoneManage.app/Contents/Resources/tweaks/nodelete-net.angelxwind.appsyncunified.deb"
        let applefileconduit2 = "/Applications/iphoneManage.app/Contents/Resources/tweaks/afc2kppless_1.1.5-1.deb"
     let appinst = "/Applications/iphoneManage.app/Contents/Resources/tweaks/nodelete-com.linusyang.appinst.deb"
        let tweaksdepnd = "/Applications/iphoneManage.app/Contents/Resources/tweaks/"
        let iphoneTweakspath = "/var/mobile/iManagerkira/tweaks/"
        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "mkdir", "/var/mobile/iManagerkira/")
        kiracmlt(sshpassPath, "-p",sshpass, "scp", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "-r", "-P", "2222", tweaksdepnd, "root@localhost:/var/mobile/iManagerkira/")
        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "echo", "test")
        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "dpkg", "-i" ,"\(iphoneTweakspath)io.github.awesomebing1.sbutils_2.1.1_iphoneos-arm.deb")
        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "dpkg", "-i" ,"\(iphoneTweakspath)nodelete-net.angelxwind.appsyncunified.deb")
        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "dpkg", "-i" ,"\(iphoneTweakspath)tweaks/afc2kppless_1.1.5-1.deb")
        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "dpkg", "-i" ,"\(iphoneTweakspath)nodelete-com.linusyang.appinst.deb")
        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "sbalert", "-t", """
"Read"
""", "-m", """
            "Ignore the reboot/ldrestart message, iManager will do everything"
         """, "-d", "ok")
        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "rm", "-rf", "/var/mobile/iManagerkira/tweaks")
        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "ldrestart")
        func dialogOKCancel(question: String, text: String) -> Bool {
            let alert = NSAlert()
            alert.messageText = question
            alert.informativeText = text
            alert.alertStyle = .informational
            alert.addButton(withTitle: "ok")
            return alert.runModal() == .alertFirstButtonReturn
        }

        let answer = dialogOKCancel(question: "DONE", text: "Dependencies should be installed now. Relaunch the Program and click install dependencies again. When you did the second time, reopen iManager and everything should work.")
            
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
                let simplfier = (sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222")
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "mkdir", aPatha)
                kiracmlt(sshpassPath, "-p",sshpass, "scp", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "-r", "-P", "2222", path, "root@localhost:/var/mobile/iManagerkira/cmdlinetools/")
                kiracmlt("echo", "what")
               kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "cp", "\(aPatha)\(cmdname)", "/usr/bin/")
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "rm", "-rf", "\(aPatha)\(cmdname)")
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "echo", "haha")
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "sbalert", "-t", "iManagerkira", "-m", """
                    "Installed Command: \(cmdname)"
                 """, "-d", "ok")
                
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
        kiracmlt("chmod", "+x", "sshpassPath")
        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "uicache", "-a")
        kiracmlt("pwd")
    }
    @IBAction func springboardspring(_ sender: Any) {
        kiracmlt("ls")
        kiracmlt("cd", "/User/")
        kiracmlt("echo", "lool")
        kiracmlt("ls")
        kiracmlt("chmod", "+x", "sshpassPath")
        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "killall", "-9", "SpringBoard")
        kiracmlt("pwd")
    }
    @IBAction func ldrestart(_ sender: Any) {
        kiracmlt("ls")
        kiracmlt("cd", "/User/")
        kiracmlt("echo", "lool")
        kiracmlt("ls")
        kiracmlt("chmod", "+x", "sshpassPath")
        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "ldrestart")
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
            let namepa = result!.lastPathComponent

            if (result != nil) {
                let path: String = result!.path
                let iphonestandartdofilecopypath = "/var/mobile/iManagerkira/"
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "mkdir", "/var/mobile/iManagerkira/")
                kiracmlt(sshpassPath, "-p", sshpass, "scp", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "-r", "-P", "2222", path, "root@localhost:\(iphonestandartdofilecopypath)")
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "echo", "copp")
                kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "sbalert", "-t", "iManager", "-m", """
"Copied \(namepa) to /var/mobile/iManagerkira/"
""")
              
            }

        } else {
            
            return
        }
       
    }
  
   

    @IBAction func mountrootfs(_ sender: Any) {
        kiracmlt(sshpassPath, "-p", "alpine", "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "mount", "-o", "rw,union,update", "/")
    }
    @IBAction func modifyrootFS(_ sender: Any) {
//replace the orig progressUI
        kiracmlt(sshpassPath, "-p", sshpass, "scp", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "-r", "-P", "2222", "/Applications/iphoneManage.app/Contents/Resources/System/modifiedrootfs/System", "root@localhost:/")
        }
    @IBAction func backup(_ sender: Any) {
        //backup the orig progressUI
        kiracmlt(sshpassPath, "-p", sshpass, "scp", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "-r", "-P", "2222", "root@localhost:/System/Library/PrivateFrameworks/ProgressUI.framework", "/Applications/iphoneManage.app/Contents/Resources/Backups/")
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
                esolitos/ipa/sshpassPath for sshpassPath.
                Without those two this tools wouldn´t work.
                """)
            
        }
    }
    @IBAction func useport22(_ sender: Any) {
        kiracmlt("killall", "iproxy")
        kiracdmlt2("/Applications/iphoneManage.app/Contents/Resources/iproxy", "2222", "22")
    }
    @IBAction func safemode(_ sender: Any) {
        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "killall", "-SEGV", "SpringBoard")
    }
    @IBAction func leavesf(_ sender: Any) {
        kiracmlt(sshpassPath, "-p", sshpass, "ssh", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "root@localhost", "-p", "2222", "killall", "-9", "SpringBoard")
    }
    @IBAction func Howtoconnectdevices(_ sender: Any) {
        let url = URL(string: "https://github.com/IJustNeedOffsets/iManager")!
        if NSWorkspace.shared.open(url) {
            print("opened")

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
    //Hope someone has learned something. Btw im not creating a function for each command because the source code should be easy to read for beginners.
