//
//  PostVC.swift
//  breakpoint
//
//  Created by Molnár Csaba on 2019. 09. 07..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        sendbtn.bindToKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if textView.text != nil && textView.text != "Say something here..." {
            sendbtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: textView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil) { (isComplete) in
                if isComplete {
                    self.sendbtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendbtn.isEnabled = true
                    print("there was an error")
                }
            }
        }
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
