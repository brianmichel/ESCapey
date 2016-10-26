//
//  AppDelegate.swift
//  ESCapey-macOS
//
//  Created by Brian Michel on 10/25/16.
//  Copyright © 2016 Brian Michel. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var mainMenu: NSMenu!
    
    var server: KeySenderRecivingService?
    
    let statusBar = NSStatusBar.system().statusItem(withLength: 51.0)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        statusBar.image = NSImage(named: "status_icon")
        statusBar.menu = mainMenu
        statusBar.highlightMode = true
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func escServerEnabledToggled(_ menuItem: NSMenuItem) {
        
        if let _ = server {
            server = nil
            menuItem.state = NSOffState
        }
        else {
            server = KeySenderRecivingService()
            menuItem.state = NSOnState
        }
    }
}

