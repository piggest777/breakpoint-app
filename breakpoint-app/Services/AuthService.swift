//
//  AuthService.swift
//  breakpoint-app
//
//  Created by Denis Rakitin on 2018-07-26.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?)->()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            guard let authDataResult = authDataResult else {
                userCreationComplete(false, error)
                return
            }
            let userData = ["provider": authDataResult.user.providerID, "email": authDataResult.user.email]
            DataService.instance.createDBUser(uid: authDataResult.user.uid, userData: userData)
            userCreationComplete(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?)->())  {
        
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            if error != nil {
                loginComplete(false,error)
                return
            }
            
            loginComplete(true, nil)
            
        }
    }
}
