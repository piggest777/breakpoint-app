//
//  GroupFeedVC.swift
//  breakpoint-app
//
//  Created by Denis Rakitin on 2018-08-08.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var groupTitleLbl: UILabel!
    
    @IBOutlet weak var membersLbl: UILabel!
    
    @IBOutlet weak var sendBtnView: UIView!
    
    @IBOutlet weak var messageTxtField: InsetTextField!
    
    @IBOutlet weak var sendBtn: UIButton!

    @IBOutlet weak var kostili: UIView!
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var constraintForKeyboard: NSLayoutConstraint!
    
    @IBOutlet weak var topConstraintofTopView: NSLayoutConstraint!
    
    @IBOutlet weak var topView: UIView!
    
    
    var group: Group?
    var groupMessages = [Message]()
    
    
    
    
    func initGroupData(forGroup group: Group) {
        self.group = group
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        sendBtnView.bindToKeyboard()
//        kostili.bindToKeyboard()
        mainView.bindToKeyboard()
        tableView.delegate = self
        tableView.dataSource = self

        
//        constraintForKeyboard.constant = DataService.instance.constraintHigh
    
    }
    
    deinit {
        mainView.unbindFromKeyboard()
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupTitleLbl.text = group?.groupTitle
        DataService.instance.getEmailsfor(group: group!) { (returnedEmails) in
            self.membersLbl.text = returnedEmails.joined(separator: ", ")
        }
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllMessagesFor(desiredGroup: self.group!, handler: { (returnedGroupMessages) in
                self.groupMessages = returnedGroupMessages
 
                self.tableView.reloadData()
            })
        }
    }
    
    

    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        
        dismissDetail()
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if messageTxtField.text != "" {
            messageTxtField.isEnabled = false
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageTxtField.text!, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: group!.key) { (success) in
                if success {
                    self.messageTxtField.text = ""
                    self.messageTxtField.isEnabled = true
                    self.sendBtn.isEnabled = true
               
               
                }
            }
        }
        
    }
    

}

extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupFeedCell", for: indexPath) as? GroupFeedCell else { return UITableViewCell()}
        let message = groupMessages[indexPath.row]
        
        DataService.instance.getUsername(forUID: message.senderId) { (email) in
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage")!, email: email, content: message.content)
        }
        
        return cell
    }
}
