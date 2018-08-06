//
//  CreateGroupsVC.swift
//  breakpoint-app
//
//  Created by Denis Rakitin on 2018-08-06.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {

    //outlets
    
    @IBOutlet weak var titleTxtField: InsetTextField!
    
    @IBOutlet weak var descriptionTxtField: InsetTextField!
    
    @IBOutlet weak var emailTxtField: InsetTextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var doneBtn: UIButton!
    
    @IBOutlet weak var groupMemberLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func doneBtnWasPressed(_ sender: Any) {
    }
    
    @IBOutlet weak var closeBtnWasPressed: UIButton!
    
    
    

}
