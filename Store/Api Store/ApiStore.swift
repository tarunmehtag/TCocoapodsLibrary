//
//  ApiStore.swift
//  Infinite BackUp
//
//  Created by Mobile on 25/10/18.
//  Copyright © 2018 Mobile. All rights reserved.
//

import UIKit
import Alamofire
import PKHUD
import NVActivityIndicatorView

typealias StrToStr = [String:String]
typealias StrToAny = [String:Any]

protocol JsonMappable {
    init(fromDictionary dictionary: [String:Any])
}

class ApiStore: NSObject {
    
//    //MARK:- Shared Instance
//    static let shared = ApiStore()
//    private override init() {
//        super.init()
//    }
    
    //MARK:- Indicator
    func indicatorOn() {
        let activityData = ActivityData(size: CGSize(width: 45.0, height: 45.0), type: NVActivityIndicatorType.ballClipRotateMultiple)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
    }
    
    func indicatorOff() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }
    
    //MARK:- Header for request
    func getHeaders() -> [String:String] {
        let httpHeaders: [String:String]!
        if UserStore.shared.authToken == "" {
            httpHeaders = ["Content-Type":"application/json"]
        } else {
            httpHeaders = ["Content-Type":"application/json",
                           "Authorization":UserStore.shared.authToken]
        }
        return httpHeaders
    }
    
    //MARK:- Call Api with different Methods
//    func callApi(_ urlString: String, _ method:HTTPMethod = .get, _ parameters:Parameters? = nil, _ completion: @escaping(_ : Any?) -> Void) {
//        indicatorOn()
//
//
//        Alamofire.request(urlString, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: dict).responseJSON { (response) in
//            self.indicatorOff()
//            self.getValidData(response.result, completion: { (value, error) in
//                if let data = value{
//                    completion(data)
//                }
//            })
//        }
//    }
    
    func callApi<T:JsonMappable>(_ urlString: String, _ method:HTTPMethod = .get, _ parameters:Parameters? = nil, _ completion: @escaping(_ : T?) -> Void) {
        indicatorOn()

        Alamofire.request(urlString, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: getHeaders()).responseJSON { (response) in
            self.indicatorOff()
            self.getValidData(response.result, completion: { (value, error) in
                if let data = value {
                    print(value)
                    if let status = data["statusCode"] as? Int, status == 200 {
                        completion(T.init(fromDictionary: data))
                    } else if let status = data["status"] as? Int, status == 200 {
                        completion(T.init(fromDictionary: data))
                    } else {
                        AlertControl.shared.showAlert("Error!", message: data["message"] as? String ?? "Something went wrong.", buttons: ["OK"]) { (_) in
                            
                        }
                    }
                }
            })
        }
    }
    
    //MARK:- Get Valid data if available
    func getValidData(_ result: Result<Any>, completion: @escaping (_ : [String:Any]?, _ : NSError?) -> Void) {
        var data : [String:Any]?
        let error = result.error as NSError?
        switch result{
        case .success(_) :
            if let json = result.value as? StrToAny {
                data = json
            } else {
                HUD.flash(.label("Json could not be serialized."), delay: 1.5, completion: { (value) in
                    print(value)
                })
            }
            break
        case .failure(_) :
            HUD.flash(.label(error!.localizedDescription), delay: 1.5, completion: { (value) in
                print(value)
            })
            break
        }
        completion(data,error)
    }
}
