//
//  ViewController.swift
//  ESCapey-macOS
//
//  Created by Brian Michel on 10/25/16.
//  Copyright © 2016 Brian Michel. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    let keyService = KeySenderRecivingService()

    override func viewDidLoad() {
        super.viewDidLoad()

        let escKeySender = ESCKeySender()
        escKeySender.send()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

