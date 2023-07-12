//
//  MessageComposer.swift
//  Abstract Class Demo
//
//  Created by Mobile on 05/04/19.
//  Copyright © 2019 Mobile. All rights reserved.
//

import UIKit
import MessageUI

class MessageComposer: NSObject, MFMessageComposeViewControllerDelegate {
    
    //MARK:- variables
    static let shared = MessageComposer()
    
    //MARK:- Send Message
    func sendMessage(_ viewController: UIViewController, _ recipient:[String], _ body: String) {
        if MFMessageComposeViewController.canSendText() {
            let controller = MFMessageComposeViewController()
            controller.messageComposeDelegate = self
            controller.recipients = recipient
            controller.body = body
            viewController.present(controller, animated: true, completion: nil)
        } else {
            UIAlertController.showAlert("", message: "Cann't send message", buttons: ["Ok"], completion: nil)
        }
    }
    
    //MARK: MFMessage Composer View Controller Delegate
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}


//MARK: How to use

/*
 MessageComposer.shared.sendMessage(self,["9876543210"], "Message Body")
 */
