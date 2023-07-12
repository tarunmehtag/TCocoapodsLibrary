//
//  File.swift
//  CustomerApp
//
//  Created by apple on 30/11/18.
//  Copyright © 2018 Pankaj_mac_mini. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

