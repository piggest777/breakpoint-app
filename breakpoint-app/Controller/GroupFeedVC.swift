//
//  GroupFeedVC.swift
//  breakpoint-app
//
//  Created by Denis Rakitin on 2018-08-08.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var groupTitleLbl: UILabel!
    
    @IBOutlet weak var membersLbl: UILabel!
    
    @IBOutlet weak var sendBtnView: UIView!
    
    @IBOutlet weak var messageTxtField: InsetTextField!
    
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyboard()
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
    }
    

}

extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
