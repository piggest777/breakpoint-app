//
//  CreateGroupsVC.swift
//  breakpoint-app
//
//  Created by Denis Rakitin on 2018-08-06.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit
import Firebase

class CreateGroupsVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var titleTxtField: InsetTextField!
    
    @IBOutlet weak var descriptionTxtField: InsetTextField!
    
    @IBOutlet weak var emailTxtField: InsetTextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var doneBtn: UIButton!
    
    @IBOutlet weak var groupMemberLbl: UILabel!
    
    var emailArray = [String]()
    var choosenUserArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        emailTxtField.delegate = self
        emailTxtField.addTarget(self, action: #selector (textFieldDidChange), for: .editingChanged)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        doneBtn.isHidden = true
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
        if titleTxtField.text != "" && descriptionTxtField.text != "" {
            DataService.instance.getIds(forUsernames: choosenUserArray) { (idsArray) in
                var userIds  = idsArray
                userIds.append((Auth.auth().currentUser?.uid)!)
                
                DataService.instance.createGroup(withTitle: self.titleTxtField.text!, andDescription: self.descriptionTxtField.text!, forUserIds: userIds, handler: { (success) in
                    if success {
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        print("Group can not created, please try again")
                    }
                })
            }
        }
        
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
        
        if choosenUserArray.contains(emailArray[indexPath.row]){
             cell.configureCell(profileImg: profileImage!, email: emailArray[indexPath.row], isSelected: true)
        } else {
             cell.configureCell(profileImg: profileImage!, email: emailArray[indexPath.row], isSelected: false)
        }
        
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else {return}
        
        if !choosenUserArray.contains(cell.emailLbl.text!) {
            choosenUserArray.append(cell.emailLbl.text!)
            groupMemberLbl.text = choosenUserArray.joined(separator: ", ")
            doneBtn.isHidden = false
        } else {
            choosenUserArray = choosenUserArray.filter({ $0 != cell.emailLbl.text! })
            if choosenUserArray.count >= 1{
                groupMemberLbl.text = choosenUserArray.joined(separator: ", ")
            } else {
                groupMemberLbl.text = "add people to your group"
                doneBtn.isHidden = true
            }
        }
    }
}

extension CreateGroupsVC: UITextFieldDelegate {
    
    
    
}
