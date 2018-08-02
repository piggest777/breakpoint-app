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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
    }

    @IBAction func signOutBtnWasPressed(_ sender: Any) {
        
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
           
            do
            {
                try Auth.auth().signOut()
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
