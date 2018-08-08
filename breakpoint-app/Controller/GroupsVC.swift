//
//  SecondViewController.swift
//  breakpoint-app
//
//  Created by Denis Rakitin on 2018-07-18.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)  as? GroupCell else {
            return UITableViewCell()}
        
        cell.configureCell(title: "evil plans", descripton: "plans to conque world", memberCount: 3)
        
        
        return cell
    }
}

