//
//  RestTableViewController.swift
//  Brewski Dewski
//
//  Created by Jeff Vu on 12/16/15.
//  Copyright © 2015 iOS Dev Class - Brewski Dewski. All rights reserved.
//

import UIKit
import CloudKit

class RestTableViewController: UITableViewController {

    var restaurants = [CKRecord]()
    let privateDB = CKContainer.defaultContainer().privateCloudDatabase
    let truePredicate = NSPredicate(value: true)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = CKQuery(recordType: "Restaurant", predicate: truePredicate)
        
        
        //  Query for restaurants you have added, and display them as a list
        privateDB.performQuery(query, inZoneWithID: nil) {
                results, error in
        
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    guard let results = results else {
                        print("ERROR: Query returned nil")
                        return
                    }
                            
                    dispatch_async(dispatch_get_main_queue()) {
                        self.restaurants = results
                        self.tableView.reloadData()
                    }
                            
                }
            }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "RestTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestTableViewCell
        
        let restaurant = restaurants[indexPath.row]

        cell.nameLabel.text = restaurant["Name"] as? String
        cell.dishLabel.text = restaurant["FavoriteDish"] as? String
        cell.ratingControl.rating = restaurant["Rating"] as! Int

        return cell
    }



}
