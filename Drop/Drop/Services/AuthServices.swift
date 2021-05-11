//
//  AuthServices.swift
//  Drop
//
//  Created by Urmat on 1/24/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    // Check if the user is logged in
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    // Registration
    var auth: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }

    // User registration
    func registerUser(phoneNumber: Int, password: String, completion: @escaping CompletionHandler) {
        
        let body: [String: Any] = [ //Атрибуты которые переводим
            "phoneNumber": phoneNumber,
            "password": password
        ]
        
        AF.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            switch response.result {
            case .success( _):
                completion(true)
            case .failure(let error):
                completion(false)
                debugPrint(error as Any)
            }
        }
    }
    
    // User loginization
    func loginUser(phoneNumber: Int, password: String, completion: @escaping CompletionHandler) {
        
        let body: [String: Any] = [ //Атрибуты которые переводим
            "phoneNumber": phoneNumber,
            "password": password
        ]
        
        AF.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            switch response.result {
            case .success( _):
                //Using SwiftyJSON
                guard let data = response.data else { return }
                let json = JSON(data : data)
                self.userEmail = json["user"].stringValue
                self.auth = json["token"].stringValue
                
                self.isLoggedIn = true
                completion(true)
            case .failure(let error):
                completion(false)
                debugPrint(error as Any)
            }
        }
    }
    
    func createUser(name: String, phoneNumber: Int, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
        
        let body: [String: Any] = [ //Атрибуты которые переводим
            "name": name,
            "phoneNumber": phoneNumber,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        AF.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            switch response.result {
            case .success( _):
                guard let data = response.data else { return }
                self.setUserInfo(data: data)
                completion(true)
                
            case .failure(let error):
                completion(false)
                debugPrint(error as Any)
            }
        }
    }
    
    func setUserInfo(data: Data){
        let json = JSON(data: data)
        let id = json["_id"].stringValue
        let color = json["avatarColor"].stringValue
        let avatarName = json["avatarName"].stringValue
        let email = json["email"].stringValue
        let name = json["name"].stringValue
        
        UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email
            , name: name)
    }
}
