//
//  DoubleExtension.swift
//  CustomerApp
//
//  Created by apple on 11/02/19.
//  Copyright © 2019 Pankaj_mac_mini. All rights reserved.
//

import Foundation

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
    
    var string: String {
        return NSString(format: "%.2f", self) as String
    }
}
