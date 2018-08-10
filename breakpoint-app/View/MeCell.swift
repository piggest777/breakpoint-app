//
//  MeCell.swift
//  breakpoint-app
//
//  Created by Denis Rakitin on 2018-08-09.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

class MeCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    

    
    @IBOutlet weak var myMessage: UILabel!
    
    func configureCell (profileImage: UIImage,  content: String) {
        self.profileImage.image = profileImage

        self.myMessage.text = content
        
    }
}
