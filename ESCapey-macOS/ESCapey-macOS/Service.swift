//
//  Service.swift
//  ESCapey-macOS
//
//  Created by Brian Michel on 10/25/16.
//  Copyright © 2016 Brian Michel. All rights reserved.
//

import Foundation
import MultipeerConnectivity

class KeySenderRecivingService: NSObject, MCSessionDelegate {
    let peerID = MCPeerID(displayName: Host.current().name!)
    let session: MCSession
    let advertiser: MCAdvertiserAssistant
    
    override init() {
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .optional)
        advertiser = MCAdvertiserAssistant(serviceType: "ESCapey", discoveryInfo: nil, session: session)
        
        super.init()
        
        session.delegate = self
        advertiser.start()
    }
    
    deinit {
        advertiser.stop()
        session.disconnect()
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        //use data as string
        guard let string = String(data: data, encoding: .utf8) else {
            return
        }
        
        switch string {
        case "escape":
            let sender = ESCKeySender()
            sender.send()
        default:
            return
        }
        
    }
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        //do nothing
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        //do nothing
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        //do nothing
    }
    
    func session(_ session: MCSession, didReceiveCertificate certificate: [Any]?, fromPeer peerID: MCPeerID, certificateHandler: @escaping (Bool) -> Void) {
        //do nothing
        certificateHandler(true)
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL, withError error: Error?) {
        //do nothing
    }
    
    
}
