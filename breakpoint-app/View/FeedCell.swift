//
//  FeedCell.swift
//  breakpoint-app
//
//  Created by Denis Rakitin on 2018-08-01.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var messageLbl: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String){
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.messageLbl.text = content
    }
    

}
