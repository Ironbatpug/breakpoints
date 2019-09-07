//
//  LoginVC.swift
//  breakpoint
//
//  Created by Molnár Csaba on 2019. 09. 07..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
    }

    @IBAction func signinBtnWasPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, adnPassword: passwordField.text!) { (succes, error) in
                if succes {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: error?.localizedDescription))
                }
                
                AuthService.instance.registerUser(withEmail: self.emailField.text!, adnPassword: self.passwordField.text!, userCreationComplete: { (succes, error) in
                    if succes {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, adnPassword: self.passwordField.text!, loginComplete: { (succes, nil) in
                            self.dismiss(animated: true, completion: nil)
                            print("succes regist")
                        })
                    } else {
                        print(String(describing: error?.localizedDescription))
                    }
                })
            }
        }
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension LoginVC: UITextFieldDelegate {
    
}




