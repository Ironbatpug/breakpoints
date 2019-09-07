//
//  AuthServices.swift
//  breakpoint
//
//  Created by Molnár Csaba on 2019. 09. 07..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let  instance = AuthService()
    
    func registerUser(withEmail email: String, adnPassword password: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userCreationComplete(false, error)
                return
            }
            
            let userData = ["provider": user.user.providerID, "email": user.user.email]
            
            DataService.instance.createDBUser(uid: user.user.uid, userData: userData)
            userCreationComplete(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, adnPassword password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                loginComplete(false, error)
                return
            }
            loginComplete(true, nil)
        }
    }
}








