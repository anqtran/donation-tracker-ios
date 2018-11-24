//
//  AuthService.swift
//  donation-tracker
//
//  Created by An Tran on 11/22/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class APIService {
    static let instance = APIService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    var userType: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }

    var userLocation: String {
        get {
            return defaults.value(forKey: USER_LOCATION) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_LOCATION)
        }
    }

    func registerAccount(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }

    func createUser(email: String, password: String, type: String, location: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password,
            "userType": type,
            "location": location
        ]
        
        Alamofire.request(URL_CREATE_USER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }

    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let dataFromServer = response.data else { return }
                let json = try! JSON(data: dataFromServer)
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue
                self.getUser(email: self.userEmail, completion: { (done) in
                    if(done) {
                        print("\(self.userType) logging in!")
                        completion(true)
                    }
                })
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }

    func getUser(email: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let getUserURL = URL_GET_USER + lowerCaseEmail
        Alamofire.request(getUserURL, method: .get, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let dataFromServer = response.data else { return }
                let json = try! JSON(data: dataFromServer)
                self.userType = json["userType"].stringValue
                self.userLocation = json["location"].stringValue
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func addItem(description: String, category: String, location: String, longDescription: String, value: Int, completion: @escaping CompletionHandler) {
        
        let body: [String: Any] = [
            "description": description,
            "category": category,
            "location": location,
            "longDescription": longDescription,
            "value" : value
        ]
        Alamofire.request(URL_ADD_ITEM, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            if (response.result.error == nil) {
                print("Item successfully added")
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
}
