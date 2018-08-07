//
//  CreateGroupsVC.swift
//  breakpoint-app
//
//  Created by Denis Rakitin on 2018-08-06.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var titleTxtField: InsetTextField!
    
    @IBOutlet weak var descriptionTxtField: InsetTextField!
    
    @IBOutlet weak var emailTxtField: InsetTextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var doneBtn: UIButton!
    
    @IBOutlet weak var groupMemberLbl: UILabel!
    
    var emailArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        emailTxtField.delegate = self
        emailTxtField.addTarget(self, action: #selector (textFieldDidChange), for: .editingChanged)

    }
    
  @objc func textFieldDidChange() {
        if emailTxtField.text == "" {
            emailArray = []
            tableView.reloadData()
            } else {
            
            DataService.instance.getEmail(forSearchQuery: emailTxtField.text! , handler: { (returnedEmailArray) in
                                self.emailArray = returnedEmailArray
                                self.tableView.reloadData()
            })
          


            }
        }

    @IBAction func doneBtnWasPressed(_ sender: Any) {
        
    }

    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
}

extension CreateGroupsVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell else {return UITableViewCell()}
        let profileImage = UIImage(named: "defaultProfileImage")
        
        cell.configureCell(profileImg: profileImage!, email: emailArray[indexPath.row], isSelected: true)
        
        return cell
    }
}

extension CreateGroupsVC: UITextFieldDelegate {
    
    
    
}
