//
//  ViewController.swift
//  ESCapey-iOS
//
//  Created by Brian Michel on 10/25/16.
//  Copyright © 2016 Brian Michel. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, MCBrowserViewControllerDelegate {

    let session = MCSession(peer: MCPeerID(displayName: UIDevice.current.name))
    
    @IBAction func escapeButtonTapped(_ sender: Any?) {
        let key = "escape".data(using: .utf8)
        do {
            let _ = try session.send(key!, toPeers: session.connectedPeers, with: .reliable)
        }
        catch (_) {
            
        }
    }
    
    @IBAction func toggleConnectionButtonTapped(_ sender: Any?) {
        let controller = MCBrowserViewController(serviceType: "ESCapey", session: session)
        controller.delegate = self
        
        showDetailViewController(controller, sender: self)
    }
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        browserViewController.dismiss(animated: true, completion: nil)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        browserViewController.dismiss(animated: true, completion: nil)
    }
}

