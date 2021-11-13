//
//  settingscontroller.swift
//  iphoneManage
//
//  Created by kira on 13.11.21.
//

import Cocoa

class settingscontroller: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func port44(_ sender: Any) {
        UserDefaults.setValue("44", forKey: "iproxyport")
    }
    
    @IBAction func port22(_ sender: Any) {
        UserDefaults.setValue("22", forKey: "iproxyport") 
    }
    @IBAction func lafgfg(_ sender: Any) {
        print("wtff")
    }
    @IBAction func lbfgfgfgfg(_ sender: Any) {
        print("weird")
    }
    @IBAction func helpwebstie(_ sender: Any) {
        print("efreefgght")
    }
    @IBAction func saveoption(_ sender: Any) {
        print("user need some help")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        func dialogOKCancel(question: String, text: String) -> Bool {
            let alert = NSAlert()
            alert.messageText = question
            alert.informativeText = text
            alert.alertStyle = .informational
            alert.addButton(withTitle: "ok")
            return alert.runModal() == .alertFirstButtonReturn
        }

        let answer = dialogOKCancel(question: "Apply Changed", text: "In case connecting doesn´t work after changing settings, force quit iManager and relaunch.")
        
    }
    }
}
