//
//  CALayer.swift
//  Reminisce
//
//  Created by Tarun Mehta on 10/12/18.
//  Copyright © 2018 paige. All rights reserved.
//

import UIKit

extension CALayer {
    
    func bringToFront() {
        let superlayer: CALayer? = self.superlayer
        self.removeFromSuperlayer()
        superlayer?.insertSublayer(self, at: UInt32(UInt((superlayer?.sublayers?.count)!)))
    }
    
    func sendToBack() {
        let superlayer: CALayer? = self.superlayer
        self.removeFromSuperlayer()
        superlayer?.insertSublayer(self, at: 0)
    }

    var borderUIColor: UIColor {
        get {
            return UIColor(cgColor: self.borderColor!)
        }
        set {
            self.borderColor = newValue.cgColor
        }
    }
}


