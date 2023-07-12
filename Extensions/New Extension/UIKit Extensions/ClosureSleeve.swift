//
//  ClosureSleeve.swift
//  Infinite BackUp
//
//  Created by Tarun Mehta on 12/14/18.
//  Copyright © 2018 paige. All rights reserved.
//

import UIKit

class ClosureSleeve {
    let closure: ()->()
    
    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}
