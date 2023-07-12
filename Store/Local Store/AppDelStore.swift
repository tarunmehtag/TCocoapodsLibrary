//
//  AppDelStore.swift
//  Quick Eats
//
//  Created by apple on 21/01/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class AppDelStore: NSObject {
    
    //MARK:- Shared Instance
    static let shared = AppDelStore()
    private override init() {
        super.init()
    }
    
    //MARK:- AppDelegate Instance
    var appDelegate:AppDelegate {
        return  UIApplication.shared.delegate as! AppDelegate
    }
    
}
