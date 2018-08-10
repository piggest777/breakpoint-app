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
    
    var gruopsArray = [Group]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllGroups { (returnedGroupArray) in
                self.gruopsArray = returnedGroupArray
                self.tableView.reloadData()
            }
        }

    }
    
}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gruopsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)  as? GroupCell else {
            return UITableViewCell()}
        
        let group = gruopsArray[indexPath.row]
        
        cell.configureCell(title: group.groupTitle, descripton: group.groupDescription, memberCount: group.memberCount)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groupFeedVC = storyboard?.instantiateViewController(withIdentifier: "GroupFeedVC") as? GroupFeedVC else {return}
        
        
        groupFeedVC.initGroupData(forGroup: gruopsArray[indexPath.row] )
        presentDetail(groupFeedVC)

    }
}



