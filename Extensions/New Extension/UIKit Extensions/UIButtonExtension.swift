//
//  UIButtonExtension.swift
//  The LIQUOR
//
//  Created by apple on 15/02/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func alignTextBelow(_ spacing: CGFloat = 6.0) {
        if let image = self.imageView?.image {
            let imageSize: CGSize = image.size
            self.titleEdgeInsets = UIEdgeInsets(top: spacing, left: -imageSize.width, bottom: -(imageSize.height), right: 0.0)
            let labelString = NSString(string: self.titleLabel!.text!)
            let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: self.titleLabel!.font!])
            self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
        }
    }

    func setImageWithColor(_ image:UIImage, _ imageColor: UIColor) {
        let origImage = image
        let tintedImage = origImage.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.setImage(tintedImage, for: .normal)
        self.tintColor = imageColor
    }
    
    
    
    func leftImage(_ image:UIImage) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 10, width: 20, height: 13))
        imageView.image = image
        self.addSubview(imageView)
    }
}
