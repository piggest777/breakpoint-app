//
//  GroupCell.swift
//  breakpoint-app
//
//  Created by Denis Rakitin on 2018-08-08.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {


    @IBOutlet weak var groupTitleLbl: UILabel!
    
    @IBOutlet weak var groupDescriptionLbl: UILabel!
    
    @IBOutlet weak var memberCountLbl: UILabel!
    
    func configureCell(title: String, descripton: String, memberCount: Int) {
        self.groupTitleLbl.text = title
        self.groupDescriptionLbl.text = descripton
        self.memberCountLbl.text = "\(memberCount) members"
    }
    
}
