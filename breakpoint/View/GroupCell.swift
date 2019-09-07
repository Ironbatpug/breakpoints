//
//  GroupCell.swift
//  breakpoint
//
//  Created by Molnár Csaba on 2019. 09. 07..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var memberLbl: UILabel!
    
    func configureCell(title: String, description: String, membercount: Int){
        self.titleLbl.text = title
        self.descriptionLbl.text = description
        self.memberLbl.text = "\(membercount) members"
    }
}
