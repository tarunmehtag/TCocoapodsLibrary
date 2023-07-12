//
//  UIControlExtension.swift
//  Infinite BackUp
//
//  Created by Tarun Mehta on 05/12/18.
//  Copyright © 2018 paige. All rights reserved.
//

import UIKit

extension UIControl {
    func touchUpInsideBlock(_ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: .touchUpInside)
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
    
