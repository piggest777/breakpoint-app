//
//  MeVC.swift
//  breakpoint-app
//
//  Created by Denis Rakitin on 2018-07-31.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var messageArray = [Message]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
        

        self.profileImage.imageFromURL(urlString: "https://api.adorable.io/avatars/150/\(Auth.auth().currentUser?.uid ?? "defaultProfile").png")
        
        DataService.instance.REF_FEED.observe(.value) { (feedSnapshot) in
            DataService.instance.getAllMessagesForCurrentUser { (returnedMessageArray) in
                self.messageArray = returnedMessageArray
                self.tableView.reloadData()
            }
        }

    }

    @IBAction func signOutBtnWasPressed(_ sender: Any) {
        
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
           
            do
            {
                try Auth.auth().signOut()
                self.messageArray = []
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
                
            } catch{
                print(error)
            }

    }
        logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated: true, completion: nil)
    
    }
}

extension MeVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "meCell", for: indexPath) as? MeCell else {return UITableViewCell()}
        
        let message = messageArray[indexPath.row]
        let profileImageView: UIImageView = UIImageView()
        
        profileImageView.imageFromURL(urlString: "\(avatarURL)\(Auth.auth().currentUser?.uid ?? "defaultProfile").png")
        
        DataService.instance.getUsername(forUID: message.senderId) { (email) in
            cell.configureCell(profileImage: profileImageView.image! , content: message.content)
        }
        
        return cell
    }
    
    
}











