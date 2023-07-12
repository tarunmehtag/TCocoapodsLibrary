//
//  FontExtension.swift
//  CustomerApp
//
//  Created by apple on 20/05/19.
//  Copyright © 2019 Pankaj_mac_mini. All rights reserved.
//

import Foundation
import UIKit

struct AppFontName {
    static let hairline = "Lato-Hairline"
    static let thin = "Lato-Thin"
    static let regular = "Lato-Regular"
    static let medium = "Lato-Medium"
    static let semibold = "Lato-Semibold"
    static let bold = "Lato-Bold"
    static let heavy = "Lato-Heavy"
    static let italic = "Lato-Italic"
    static let lightItalic = "Lato-LightItalic"
    static let boldItalic = "Lato-BoldItalic"
    static let black = "Lato-Black"
    static let blackItalic = "Lato-BlackItalic"
    static let light = "Lato-Light"
}



extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    
    @objc func systemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regular, size: size)!
    }
    
    @objc func boldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.bold, size: size)!
    }
    
    @objc func italicSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.italic, size: size)!
    }
    
    @objc class func myLightItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.lightItalic, size: size)!
    }
    
    @objc class func myBoldItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.boldItalic, size: size)!
    }
    
    @objc class func myBlackSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.black, size: size)!
    }
    
    @objc class func myBlackItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.blackItalic, size: size)!
    }
    
    @objc class func myLightSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.light, size: size)!
    }
    
    
    
    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[UIFontDescriptor.AttributeName.nsctFontUIUsage] as? String else {
                self.init(myCoder: aDecoder)
                return
        }
        var fontName = ""

        switch fontAttribute {
        case "CTFontUltraLightUsage":
            fontName = AppFontName.hairline
        case "CTFontThinUsage":
            fontName = AppFontName.thin
        case "CTFontLightUsage":
            fontName = AppFontName.light
        case "CTFontRegularUsage":
            fontName = AppFontName.regular
        case "CTFontMediumUsage":
            fontName = AppFontName.medium
        case "CTFontDemiUsage":
            fontName = AppFontName.semibold
        case "CTFontBoldUsage":
            fontName = AppFontName.bold
        case "CTFontHeavyUsage":
            fontName = AppFontName.heavy
        case "CTFontBlackUsage":
            fontName = AppFontName.black
        default:
            fontName = AppFontName.regular
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }
    
    class func  overrideInitialize() {
        guard self == UIFont.self else { return }
        
        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }
        
        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }
        
        if let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:))),
            let myItalicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:))) {
            method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
        }
        
        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), // Trick to get over the lack of UIFont.init(coder:))
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
}
