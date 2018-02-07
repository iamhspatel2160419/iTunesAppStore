//
//  AppStoreTableViewController.swift
//  iTunesAppStore
//
//  Created by hp ios on 2/6/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import UIKit

class AppStoreTableViewController: UITableViewController {

    var apps : [App]?
    var appStoreClient = AppStoreClient()
    
    
    struct StroryBoardId {
        static let appCell = "AppCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "App Store"
        fetchApps()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
   
    }
    func fetchApps()
    {
        appStoreClient.fetchApps(withTerm: "instagram", inEntity: "software")
        { (apps) in
          
            self.apps = apps
            self.tableView.reloadData()
            
        }
    }

  

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if let apps = apps
        {
            return apps.count
        }
        return 0
     }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: StroryBoardId.appCell, for: indexPath) as! AppleTableViewCell
        cell.app = apps?[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }


}
