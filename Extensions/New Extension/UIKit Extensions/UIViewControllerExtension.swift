//
//  UIViewControllerExtension.swift
//  Infinite BackUp
//
//  Created by Tarun Mehta on 12/14/18.
//  Copyright © 2018 paige. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    struct DataHolder {
        static var data:Any!
    }
    
    var dataFromLastVC:Any {
        get {
            return DataHolder.data
        }
        set(newValue) {
            DataHolder.data = newValue
        }
    }
    
    var screenSize : CGSize{
        return UIScreen.main.bounds.size
    }
    
    var navigationBarHeight: CGFloat {
        return (self.navigationController?.navigationBar.frame.size.height)!
    }
    
    var topPadding:CGFloat {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            return window?.safeAreaInsets.top ?? 0
        } else {
            return 0
        }
    }
    var bottomPadding : CGFloat {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            return window?.safeAreaInsets.bottom ?? 0
        } else {
            return 0
        }
    }
    
    func popUp(title:String?, message:String?, style: UIAlertController.Style, actionTitles:[String], actions:[((UIAlertAction) -> Void)]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        for (index,actionTitle) in actionTitles.enumerated() {
            let action = UIAlertAction(title: actionTitle, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.height, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        self.present(alert, animated: true, completion: nil)
    }
    
//    Example
//    popUp(nil, nil, ["ok","cancel"], [ { (action) in
//    print("Ok")
//    },{ (action) in
//    print("Cancel")
//    }])
    
    func pushOnly(_ controllerId: String) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: controllerId)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func pushWithData<T>(_ controllerId:String,_ data:T) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: controllerId)
        vc!.dataFromLastVC = data
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func popOnly() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func popToRoot() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func presentOnly(_ controllerId: String) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: controllerId)
        self.present(vc!, animated: true, completion: nil)
    }
    
    func presentWithData<T>(_ controllerId:String,_ data:T) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: controllerId)
        vc!.dataFromLastVC = data
        self.present(vc!, animated: true, completion: nil)
    }
    
    func dismissOnly() {
        self.dismiss(animated: true, completion: nil)
    }

}

extension UIViewController {
    
    func isPresentedModally() -> Bool {
        return self.presentingViewController?.presentedViewController == self
    }
    
    func findContentViewControllerRecursively() -> UIViewController {
        var childViewController: UIViewController?
        if (self is UITabBarController) {
            childViewController = (self as? UITabBarController)?.selectedViewController
        }
        else if (self is UINavigationController) {
            childViewController = (self as? UINavigationController)?.topViewController
        }
        else if (self is UISplitViewController) {
            childViewController = (self as? UISplitViewController)?.viewControllers.last
        }
        else if (self.presentedViewController != nil) {
            childViewController = self.presentedViewController
        }
        let shouldContinueSearch: Bool = (childViewController != nil) && !((childViewController?.isKind(of: UIAlertController.self))!)
        return shouldContinueSearch ? childViewController!.findContentViewControllerRecursively() : self
    }
    
    
    func popOrDismissViewController(_ animated: Bool) {
        if self.isPresentedModally() {
            self.dismiss(animated: animated, completion:nil)
        } else if (self.navigationController != nil) {
            _ = self.navigationController?.popViewController(animated: animated)
        }
    }
}
