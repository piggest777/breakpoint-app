//
//  MeVC.swift
//  breakpoint-app
//
//  Created by Denis Rakitin on 2018-07-31.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

class MeVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signOutBtnWasPressed(_ sender: Any) {
    }
    
}
