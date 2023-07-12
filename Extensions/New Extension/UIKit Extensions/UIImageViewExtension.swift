//
//  UIImageView.swift
//  CHOP
//
//  Created by Tarun Mehta on 05/12/18.
//  Copyright © 2018 paige. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func setUserImage(_ url: URL!) {
        if url != nil {
            sd_imageIndicator = SDWebImageActivityIndicator.gray
            sd_setImage(with: url!, placeholderImage: nil)
        } else {
            image = #imageLiteral(resourceName: "image_5")
        }
    }
    
    func setURL(_ url: URL!) {
        if url != nil {
            sd_imageIndicator = SDWebImageActivityIndicator.gray
            sd_setImage(with: url!, placeholderImage: nil)
        } else {
            image = #imageLiteral(resourceName: "user_icon")
        }
    }
    
    func setURLString(_ urlString: String) {
        let url = URL(string: urlString)
        if url != nil {
            sd_imageIndicator = SDWebImageActivityIndicator.gray
            sd_setImage(with: url!, placeholderImage: nil)
        } else {
            image = #imageLiteral(resourceName: "dummy_bottle")
        }
    }
   
}


