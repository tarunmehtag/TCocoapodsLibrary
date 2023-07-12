//
//  UIRefreshControl.swift
//  Dropneed
//
//  Created by Tarun Mehta on 11/12/18.
//  Copyright © 2018 paige. All rights reserved.
//

import UIKit

extension UIRefreshControl {

    func endRefreshingIfNeeded() {
        if isRefreshing {
            endRefreshing()
        }
    }
}


