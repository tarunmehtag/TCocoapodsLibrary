//
//  UIAlertController.swift
//  Reminisce
//
//  Created by Tarun Mehta on 05/12/18.
//  Copyright © 2018 paige. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    // Shows alert view with completion block
    class func alert(_ title: String, message: String, buttons: [String], completion: ((_ : UIAlertController, _ : Int) -> Void)?) -> UIAlertController {
        let alertView: UIAlertController? = self.init(title: title, message: message, preferredStyle: .alert)
        for i in 0..<buttons.count {
            alertView?.addAction(UIAlertAction(title: buttons[i], style: .default, handler: {(_ action: UIAlertAction) -> Void in
                if completion != nil {
                    completion!(alertView!, i)
                }
            }))
        }
        // Add all other buttons
        return alertView!
    }
    
    // Shows alert view with completion block
    
    class func showAlert(_ title: String, message: String, buttons: [String], completion: ((UIAlertController, Int) -> Void)?) {
        let alertView: UIAlertController? = self.init(title: title, message: message, preferredStyle: .alert)
        for i in 0..<buttons.count {
            alertView?.addAction(UIAlertAction(title: buttons[i], style: .default, handler: {(_ action: UIAlertAction) -> Void in
                if completion != nil {
                    completion!(alertView!, i)
                }
            }))
        }
        UIApplication.visibleViewController.present(alertView!, animated: true) {
            
        }
    }
    
    //! Shows action sheet with completion block
    class func showActionSheet(cancelBtn: String, destructiveBtnText: String, defaultBtnText: [String], completion: ((_ alert: UIAlertController, _ buttonIndex: Int) -> Void)?) -> UIAlertController {
        let alertView: UIAlertController? = self.init(title: nil, message: nil, preferredStyle: .actionSheet)
        var inc: Int = 0
        if (destructiveBtnText.count != 0) {
            inc += 1
            alertView?.addAction(UIAlertAction(title: destructiveBtnText, style: .destructive, handler: {(_ action: UIAlertAction) -> Void in
                if completion != nil {
                    completion!(alertView!, inc)
                }
            })) //Destructive button
        }
        if (cancelBtn.count != 0) {
            alertView?.addAction(UIAlertAction(title: cancelBtn, style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
                inc = 0
                if completion != nil {
                    completion!(alertView!, inc)
                }
            })) // Cancel button
        }
        if defaultBtnText.count != 0 {
            for i in 0..<defaultBtnText.count {
                alertView?.addAction(UIAlertAction(title: defaultBtnText[i], style: .default, handler: {(_ action: UIAlertAction) -> Void in
                    if completion != nil {
                        completion!(alertView!, i + inc + 1)
                         print("Defult btn",i + inc + 1)
                    }
                }))
            }
        }
        
        // Add all other buttons
        UIApplication.visibleViewController.present(alertView!, animated: true) {
        }
        return alertView!
    }
}


