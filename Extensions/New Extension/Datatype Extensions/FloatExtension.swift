//
//  Float.swift
//  Dropneed
//
//  Created by Tarun Mehta on 11/29/18.
//  Copyright © 2018 paige. All rights reserved.
//

import UIKit

extension Float {

    func price(_ symbol: String) -> String {
        return NSString(format: "%@%.2f", symbol, self) as String
    }
    
    var string: String {
        return NSString(format: "%.2f", self) as String
    }
    
}
