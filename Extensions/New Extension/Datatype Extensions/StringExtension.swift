//
//  StringExtension.swift
//  Infinite BackUp
//
//  Created by Tarun Mehta on 11/29/18.
//  Copyright © 2018 paige. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var isEmpty: Bool {
        return count == 0 && trimmingCharacters(in: .whitespaces).count == 0
    }
    
    var float: Float {
        return Float(self)!
    }
    
    var int: Int {
        return Int(self)!
    }
    
    
    var Timestamp: String {
        return "\(NSDate().timeIntervalSince1970 * 1000)"
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidUserName() -> Bool {
        let RegEx = "\\w{7,18}"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: self)
    }
    
    func makeAttriburedBoldString(color: UIColor,fontSize: CGFloat? = 13.0) -> NSMutableAttributedString {
        let impTakeAwayMS = NSMutableAttributedString(string: self)
        let range = NSMakeRange(0, self.count )
        impTakeAwayMS.addAttributes([NSAttributedString.Key.foregroundColor:color, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize!) as Any], range: range)
        return impTakeAwayMS
    }
    
    func makeAttriburedString(color: UIColor,fontSize: CGFloat? = 13.0) -> NSMutableAttributedString {
        let impTakeAwayMS = NSMutableAttributedString(string: self)
        let range = NSMakeRange(0, self.count )
        impTakeAwayMS.addAttributes([NSAttributedString.Key.foregroundColor:color, NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize!)], range: range)
        return impTakeAwayMS
    }
    
    func nsdecimalNumber() -> NSDecimalNumber {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        return formatter.number(from: self) as? NSDecimalNumber ?? 0
    }
    
    func inserting(separator: String, every n: Int) -> String {
        var result: String = ""
        let characters = Array(self)
        stride(from: 0, to: characters.count, by: n).forEach {
            result += String(characters[$0..<min($0+n, characters.count)])
            if $0+n < characters.count {
                result += separator
            }
        }
        return result
    }
    
    func containsOnlyDigits() -> Bool {
        let notDigits = NSCharacterSet.decimalDigits.inverted
        if rangeOfCharacter(from: notDigits, options: String.CompareOptions.literal, range: nil) == nil {
            return true
        }
        return false
    }
    
    //MARK:- Make Attributed String
    func makeAttriburedString(_ fontColor:UIColor? = .black) -> NSMutableAttributedString{
        let impTakeAwayMS = NSMutableAttributedString(string: self)
        let range = NSMakeRange(0, self.count )
        impTakeAwayMS.addAttributes([NSAttributedString.Key.foregroundColor:fontColor as Any,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14)], range: range)
        return impTakeAwayMS
    }
}
