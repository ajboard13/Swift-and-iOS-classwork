//
//  AppDelegate.swift
//  ReferenceCycleExample
//
//  Created by Student on 4/20/17.
//  Copyright © 2017 Student. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        var firstClassLetter: Letter?
        var homeMailBox: Mailbox?
        
        firstClassLetter = Letter(adressedTo: "George Bush")
        homeMailBox = Mailbox(poNumber: 123)
        
        firstClassLetter?.mailbox = homeMailBox
        homeMailBox?.letter = firstClassLetter
        
        firstClassLetter = nil
        homeMailBox = nil
        
        
        var checker : MailChecker? = MailChecker(name: "Joe")
        let result: String = checker!.whosMail()
        print(result)
        checker = nil
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}

class Letter {
    
    let adressedTo: String
    weak var mailbox: Mailbox?
    
    //object built
    init(adressedTo: String){
        self.adressedTo = adressedTo
        print("Letter created")
    }
    
    //object destroyed
    deinit{
        print("the letter addressed to \(adressedTo) is being discarded!")
    }
    
}

class Mailbox{
    let poNumber: Int
    var letter: Letter?
    
    init(poNumber: Int){
        self.poNumber = poNumber
        print("mailbox created")
    }
    
    deinit{
        print("P.O. Box \(poNumber) is being destroyed!")
    }
}

class MailChecker{
    let mailbox: Mailbox
    let letter: Letter
    
    lazy var whosMail: () -> String = { [unowned self] in
        return "letter is adressed to \(self.letter.adressedTo)"
    }
    
    init(name: String){
        self.mailbox = Mailbox(poNumber: 123)
        self.letter = Letter(adressedTo: name)
        print("MailChecker is being initialized")
    }
    
    deinit {
        print("MailChecker is being deinitialized")
    }
}

