//
//  AlertControl.swift
//  Abstract Class Demo
//
//  Created by apple on 29/07/19.
//  Copyright © 2019 Mobile. All rights reserved.
//

import UIKit

class AlertControl: NSObject {
    
    //MARK:- Shared Instance
    static let shared = AlertControl()
    private override init() { }
    
    
    //MARK:- Alert Methods
    func showAlert(_ title: String, message: String, buttons: [String], alertStyle: UIAlertController.Style = .alert, view: UIView = UIView(), completion: ((Int) -> Void)?) {
        let alertView: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        for i in 0..<buttons.count {
            alertView.addAction(UIAlertAction(title: buttons[i], style: .default, handler: {(_ action: UIAlertAction) -> Void in
                if completion != nil {
                    completion!(i)
                }
            }))
        }
        if let popoverController = alertView.popoverPresentationController {
            popoverController.sourceView = view
            popoverController.sourceRect = view.frame
            popoverController.permittedArrowDirections = []
        }
        UIApplication.shared.keyWindow!.visibleViewController?.present(alertView, animated: true, completion: nil)
    }
    
}
