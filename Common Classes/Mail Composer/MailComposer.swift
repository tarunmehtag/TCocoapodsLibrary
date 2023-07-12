//
//  Mail Composer.swift
//  Abstract Class Demo
//
//  Created by Mobile on 05/04/19.
//  Copyright © 2019 Mobile. All rights reserved.
//

import UIKit
import MessageUI

class MailComposer: NSObject, MFMailComposeViewControllerDelegate {
   
    //MARK:- variables
    static let shared = MailComposer()
    
    //MARK:- Send Message
    func sendMail(_ viewController: UIViewController , _ toRecipients:[String] ,_ ccRecipients:[String] , _ bccRecepients:[String] , _ subject:String , _ body: String, _ isHTML:Bool) {
        if MFMailComposeViewController.canSendMail() {
            let controller = MFMailComposeViewController()
            controller.mailComposeDelegate = self
            controller.setToRecipients(toRecipients)
            controller.setCcRecipients(ccRecipients)
            controller.setBccRecipients(bccRecepients)
            controller.setSubject(subject)
            controller.setMessageBody(body, isHTML: isHTML)
            viewController.present(controller, animated: true, completion: nil)
        } else {
            UIAlertController.showAlert("", message: "Cann't send Mail", buttons: ["Ok"], completion: nil)
        }
    }
    
    //MARK: MFMail Composer View Controller Delegate
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}


//MARK: How to use

/*
 MailComposer.shared.sendMail(self, ["toRecepient@gmail.com"], ["ccRecepient@gmail.com"], ["bccRecepient@gmail.com"], "Subject", "Body", false)
 */
