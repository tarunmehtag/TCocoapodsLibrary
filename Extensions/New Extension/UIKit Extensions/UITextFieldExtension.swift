//
//  UITextFieldExtension.swift
//  Infinite BackUp
//
//  Created by Tarun Mehta on 11/12/18.
//  Copyright © 2018 paige. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
extension UITextField {
    
    
    func addLeftImage(_ leftImage: UIImage) {
        leftViewMode = .always
        let size: CGSize = leftImage.size
        let view = UIView(frame: CGRect(x: 0, y: 0, width: size.width+5, height: bounds.size.height))
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: bounds.size.height))
        imgView.image = leftImage
        imgView.contentMode = .center
        view.addSubview(imgView)
        leftView = view
    }
    
    func addRightImage(_ rightImage: UIImage) {
        rightViewMode = .always
        let size: CGSize = rightImage.size
        let view = UIView(frame: CGRect(x: 0, y: 0, width: size.width+5, height: bounds.size.height))
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: bounds.size.height))
        imgView.image = rightImage
        imgView.contentMode = .center
        view.addSubview(imgView)
        rightView = view
    }
    
    func addBottomLabel(_ color: UIColor) {
        let lbl1 = UILabel()
        lbl1.backgroundColor = color
        addSubview(lbl1)
        addVisualConstraints(["H:|[label]|", "V:[label(4)]|"], subviews: ["label": lbl1])
    }
    
    func txtFieldLeftImage(_ leftImage:String) {
        self.leftViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 10, y: 0, width: 20, height: 20))
        let image = UIImage(named: leftImage)
        imageView.image = image
        self.leftView = imageView
    }
    
    func txtFieldRightImage(_ rightImage:String) {
        self.rightViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 10, y: 0, width: 20, height: 20))
        let image = UIImage(named: rightImage)
        imageView.image = image
        self.rightView = imageView
    }
    
    //MARK: Email validation variable
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: text)
    }
    
    func placeHolderColorWithName(_ placeHolder: String,_ color: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
}
