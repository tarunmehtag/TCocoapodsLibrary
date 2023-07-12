//
//  UIDatePicker.swift
//  SNAKEMAIL
//
//  Created by Tarun Mehta on 05/12/18.
//  Copyright © 2018 paige. All rights reserved.
//

import Foundation
import UIKit

extension UIDatePicker {
    
    func stringFromDate(format: String,date: Date) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.string(from: date)
    }
}
