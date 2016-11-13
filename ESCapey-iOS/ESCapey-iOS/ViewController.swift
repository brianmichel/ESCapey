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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBOutlet weak var connectionToggleButton: UIButton!
        
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
        if session.hasPeers() {
            session.disconnect()
            updateConnectButtonTitle()
        }
        else {
            let controller = MCBrowserViewController(serviceType: "ESCapey", session: session)
            controller.delegate = self
            controller.maximumNumberOfPeers = 1
            
            showDetailViewController(controller, sender: self)
        }
    }
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        browserViewController.dismiss(animated: true, completion: nil)
        updateConnectButtonTitle()
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        browserViewController.dismiss(animated: true, completion: nil)
        updateConnectButtonTitle()
    }
    
    private func updateConnectButtonTitle() {
        let text = session.hasPeers() ? "Disconnect" : "Connect"
        connectionToggleButton.setTitle(text, for: .normal)
    }
}

private extension MCSession {
    func hasPeers() -> Bool {
        return self.connectedPeers.count > 0
    }
}

