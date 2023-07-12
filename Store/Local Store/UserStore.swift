//
//  UserStore.swift
//  Quick Eats
//
//  Created by apple on 21/01/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class UserStore: NSObject {
    
    //MARK:- Shared Instance
    static var shared = UserStore()
    
    private override init() {
        super.init()
    }
    
    //MARK:- Key Vales
    let AUTH_KEY = "auth_token"
    let CUSTOMER_ID_KEY = "customer_id"
    let FIRST_NAME_KEY = "first_name"
    let EMAIL_KEY = "email"
    
    //MARK:- Auth Token
    var authToken: String {
        get {
            return UserDefaults.standard.value(forKey: AUTH_KEY) as? String ?? ""
        } set {
            UserDefaults.standard.setValue(newValue, forKey: AUTH_KEY)
        }
    }
    
    //MARK:- Customer ID
    var customerID: Int {
        get {
            return UserDefaults.standard.value(forKey: CUSTOMER_ID_KEY) as? Int ?? 0
        } set {
            UserDefaults.standard.setValue(newValue, forKey: CUSTOMER_ID_KEY)
        }
    }
    
    //MARK:- First Name
    var firstName: String {
        get {
            return UserDefaults.standard.value(forKey: FIRST_NAME_KEY) as? String ?? ""
        } set {
            UserDefaults.standard.setValue(newValue, forKey: FIRST_NAME_KEY)
        }
    }
    
    //MARK:- Email
    var email: String {
        get {
            return UserDefaults.standard.value(forKey: EMAIL_KEY) as? String ?? ""
        } set {
            UserDefaults.standard.setValue(newValue, forKey: EMAIL_KEY)
        }
    }
    
}
