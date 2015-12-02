//
//  ViewController.swift
//  Brewski Dewski
//
//  Created by Mike Weyandt on 11/24/15.
//  Copyright © 2015 iOS Dev Class - Brewski Dewski. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        //creates naming issues, better to let CloudKit handle naming on its own
        //let resturantRecordID = CKRecordID(recordName: "NewResturant")
        
        
        let resturant = CKRecord(recordType: "Resturant")
        
        
        resturant["LastVisit"] = NSDate()
        resturant["Location"] = CLLocation(latitude: 15, longitude: 105)
        resturant["Name"] = "Wendys"
        resturant["Rating"] = 5
        resturant["Type"] = "Fast Food"
        
        
        let publicDatabase = CKContainer.defaultContainer().publicCloudDatabase
        //        //publicDatabase.saveRecord(resturant, completionHandler: <#T##(CKRecord?, NSError?) -> Void#>)
        //        publicDatabase.saveRecord(resturant) {
        //            resturant, error in
        //            if error != nil {
        //                print(error!.localizedDescription)
        //
        //            } else {
        //                print("Should have been saved")
        //            }
        //        }
        
        let predicate = NSPredicate(format: "Rating == 4")
        
        let query = CKQuery(recordType: "Resturant", predicate: predicate)
        
        
        publicDatabase.performQuery(query, inZoneWithID: nil) {
            results, error in
            
            if error != nil {
                print(error!.localizedDescription)
            } else {
                let result0 = results![0]
                print(result0["Name"]!)
            }
        }
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

