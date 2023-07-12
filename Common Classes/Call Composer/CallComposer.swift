//
//  CallComposer.swift
//  Abstract Class Demo
//
//  Created by Mobile on 08/04/19.
//  Copyright © 2019 Mobile. All rights reserved.
//

import Foundation
import UIKit

class CallComposer: NSObject {
    
    static var shared = CallComposer()
    
    func makePhoneCall(_ Number: String) {
        if let url = URL(string: "tel://\(Number)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}

//MARK: How to use

/*
 CallComposer.shared.makePhoneCall("123456789")
 */

