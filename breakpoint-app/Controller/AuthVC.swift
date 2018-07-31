//
//  AuthVC.swift
//  breakpoint-app
//
//  Created by Denis Rakitin on 2018-07-25.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func signInWithEmailWasPressed(_ sender: Any) {
   let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func googleSignInButtonWasPressed(_ sender: Any) {
    }
    
    @IBAction func facebookSignInButtonWasPressed(_ sender: Any) {
    }
    
    
}
