//
//  NotificationCenterNameExtension.swift
//  Infinite BackUp
//
//  Created by Tarun Mehta on 11/29/18.
//  Copyright © 2018 paige. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let logout = Notification.Name("logout")
    static let didCompleteTask = Notification.Name("didCompleteTask")
    static let completedLengthyDownload = Notification.Name("completedLengthyDownload")
}
