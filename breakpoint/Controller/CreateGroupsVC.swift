//
//  CreateGroupsVC.swift
//  breakpoint
//
//  Created by Molnár Csaba on 2019. 09. 07..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {
    @IBOutlet weak var titleText: InsetTextField!
    @IBOutlet weak var descriptionText: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var donebtn: UIButton!
    @IBOutlet weak var groupMemberLbl: UILabel!
    
    var emailArray = [String]()
    var chosenemailArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textfieldDidChange), for: .editingChanged)
    }
    
    @objc func textfieldDidChange() {
        if emailSearchTextField.text == "" {
            emailArray = []
            tableView.reloadData()
        } else {
            DataService.instance.getEmail(forSearchQuery: emailSearchTextField.text!) { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        donebtn.isHidden = true
    }
    
    @IBAction func doneBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func closeButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CreateGroupsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell else {return UITableViewCell() }
        let profileImage = #imageLiteral(resourceName: "defaultProfileImage")
        let email = emailArray[indexPath.row]
        
        cell.configureCell(profileImage: profileImage, email: email, isSelected: false)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else { return }
        if !chosenemailArray.contains(cell.emailLbl.text!) {
            chosenemailArray.append(cell.emailLbl.text!)
            groupMemberLbl.text = chosenemailArray.joined(separator: ", ")
            donebtn.isHidden = false
        } else {
            chosenemailArray = chosenemailArray.filter({ $0 != cell.emailLbl.text! })
            if chosenemailArray.count >= 1 {
                groupMemberLbl.text = chosenemailArray.joined(separator: ", ")
                donebtn.isHidden = false
            } else {
                groupMemberLbl.text = "add people to your group"
                donebtn.isHidden = true
            }
        }
    }
}

extension CreateGroupsVC: UITextFieldDelegate {
}





