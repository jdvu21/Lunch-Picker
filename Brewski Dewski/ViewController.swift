//
//  ViewController.swift
//  Brewski Dewski
//
//  Created by Mike Weyandt on 11/24/15.
//  Copyright © 2015 iOS Dev Class - Brewski Dewski. All rights reserved.
//

import UIKit
import CloudKit


//Sorting public should not be difficult, linking resturants to users will be difficult
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let publicDatabase = CKContainer.defaultContainer().publicCloudDatabase
        //Will probably inclose all CloudKit stuff, cannot do much without UserID
        CKContainer.defaultContainer().fetchUserRecordIDWithCompletionHandler() {
            myID, error in
            
            if error != nil {
                print(error!.localizedDescription)
                return
            }
        
            guard let myID = myID else {
                print("Unable to get unique user ID")
                return
            }
            
            publicDatabase.fetchRecordWithID(myID) {
                ID, error in
                
                guard let ID = ID else {
                    print("Unable to find ID")
                    return
                }
                
                
                guard var myResturants = ID["MyResturants"] as? [CKReference] else {
                    print("You do not have any resturants!")
                    return
                }
                
//                for resturant in myResturants {
//                    print(resturant.recordID.recordName)
//                }
                
                //print(myResturants[2])
                
                let newRef = CKReference(recordID: myResturants[0].recordID, action: CKReferenceAction.None)
                //function that takes resturant, returns CKReference to new object in CloudKit to add to array of references....
                
                
                
                myResturants.append(newRef)
                
                print(myResturants)
                //TODO: Figure out how to save a reference to the list of resturants under users...
                
                
        }
            
            



//        //creates naming issues, better to let CloudKit handle naming on its own
//        //let resturantRecordID = CKRecordID(recordName: "NewResturant")
//        
//        
//        let resturant = CKRecord(recordType: "Resturant")
//        
//        
//        resturant["LastVisit"] = NSDate()
//        resturant["Location"] = CLLocation(latitude: 15, longitude: 105)
//        resturant["Name"] = "Taco Bell"
//        resturant["Rating"] = 3
//        resturant["Type"] = "Fast Food"
//        
//        
//        //let publicDatabase = CKContainer.defaultContainer().publicCloudDatabase
//        //        //publicDatabase.saveRecord(resturant, completionHandler: <#T##(CKRecord?, NSError?) -> Void#>)
//                publicDatabase.saveRecord(resturant) {
//                    resturant, error in
//                    if error != nil {
//                        print(error!.localizedDescription)
//        
//                    } else {
//                        print("Should have been saved")
//                    }
//                }
//        
            
            
            // Searching for suggestions....
//        let ratingPredicate = NSPredicate(format: "Rating == 4")
//        
//        let query = CKQuery(recordType: "Resturant", predicate: ratingPredicate)
//        
//        
//        publicDatabase.performQuery(query, inZoneWithID: nil) {
//            results, error in
//            
//            if error != nil {
//                print(error!.localizedDescription)
//            } else {
//                let result0 = results![0]
//                print(result0["Name"]!)
//            }
//        }
//        
        
    }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

