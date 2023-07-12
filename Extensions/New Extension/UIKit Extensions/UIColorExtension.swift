//
//  UIColorExtension.swift
//  The LIQUOR
//
//  Created by apple on 20/02/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    func isLight() -> Bool {
        guard let components = cgColor.components else { return false }
        let redBrightness = components[0] * 299
        let greenBrightness = components[1] * 587
        let blueBrightness = components[2] * 114
        let brightness = (redBrightness + greenBrightness + blueBrightness) / 1000
        return brightness > 0.5
    }
}
