//
//  Date.swift
//  Dropneed
//
//  Created by Tarun Mehta on 11/29/18.
//  Copyright © 2018 paige. All rights reserved.
//

import UIKit

extension Date {

    func string(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func StringFromStyle(_ datestyle: DateFormatter.Style,timeStyle: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = datestyle
        dateFormatter.timeStyle = timeStyle
        return dateFormatter.string(from: self)

    }
}

//////////////////////////////////////////////////////////////////////////////////////////

/*
 String extension only for date methods
 */
extension String {
    
    func date(_ format: String) -> Date {
        print(self)
        print(format)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)!
    }
    
    func dateFromStyle(_ datestyle: DateFormatter.Style,timeStyle: DateFormatter.Style) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = datestyle
        dateFormatter.timeStyle = timeStyle
        return dateFormatter.date(from: self)!
    }
    
}



