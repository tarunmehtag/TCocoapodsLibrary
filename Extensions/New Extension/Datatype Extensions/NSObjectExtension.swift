//
//  NSObject.swift
//  SNAKEMAIL
//
//  Created by Tarun Mehta on 11/29/18.
//  Copyright © 2018 paige. All rights reserved.
//

import Foundation
extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}

