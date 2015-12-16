//
//  ViewController.swift
//  Brewski Dewski
//
//  Created by Mike Weyandt on 11/24/15.
//  Copyright © 2015 iOS Dev Class - Brewski Dewski. All rights reserved.
//

import UIKit
import CloudKit
import CoreData
//
import Darwin



//Sorting public should not be difficult, linking resturants to users will be difficult
class ViewController: UIViewController {
    
    
    //let privateDB = CKContainer.defaultContainer().privateCloudDatabase
    //let publicDB = CKContainer.defaultContainer().publicCloudDatabase
    let ratingPredicate = NSPredicate(format: "Rating >= 4")
    
    @IBOutlet weak var newPlaceName: UITextField!
    @IBOutlet weak var newPlaceType: UITextField!
    @IBOutlet weak var newPlaceFavoriteDish: UITextField!
    @IBOutlet weak var newPlaceRating: RatingControl!

    
    @IBOutlet weak var selectedLunch: UITextField!

//    @IBAction func submitNewRestaurant() {
//        
//        //  CKRecord for Private DB
//        let privateRestaurant = CKRecord(recordType: "Restaurant")
//        privateRestaurant["Name"] = newPlaceName.text!
//        privateRestaurant["Type"] = newPlaceType.text!
//        privateRestaurant["FavoriteDish"] = newPlaceFavoriteDish.text!
//        privateRestaurant["Rating"] = newPlaceRating.rating
//        
//        //  CKRecord for Public DB
//        let publicRestaurant = CKRecord(recordType: "Restaurant")
//        publicRestaurant["Name"] = newPlaceName.text!
//        publicRestaurant["Type"] = newPlaceType.text!
//        publicRestaurant["FavoriteDish"] = newPlaceFavoriteDish.text!
//        publicRestaurant["Rating"] = newPlaceRating.rating
//
//        //  Saves New Place to privateDB
//        privateDB.saveRecord(privateRestaurant) {
//            (record, error) -> Void in
//            
//            if error != nil {
//                print(error)
//                return
//            }
//            //  Saves New Place to publicDB
//            self.publicDB.saveRecord(publicRestaurant) {
//                (record, error) -> Void in
//                
//                if error != nil {
//                    print(error)
//                    return
//                }
//            }
//        }
//
//    }
    
  @IBAction func stickWithTheFamiliar() {
//        
//        let query = CKQuery(recordType: "Restaurant", predicate: ratingPredicate)
//        
//        selectedLunch.text = "Wait for it..."
//        
//        privateDB.performQuery(query, inZoneWithID: nil) {
//                results, error in
//            
//                if error != nil {
//                    print(error!.localizedDescription)
//                    print("This is an Error")
//                } else {
//                    // Insert guard!!
//                    print(results?.count)
//                    let choosenRestaurant = results![random()%(results?.count)!]
//                    print(choosenRestaurant["Name"]!)
//                    
//                    self.selectedLunch.text = (choosenRestaurant["Name"]! as! String)
//                    
//                }
//            }
//        
  }
    
    @IBAction func trySomethingNew() {
        
//        let query = CKQuery(recordType: "Restaurant", predicate: ratingPredicate)
//        
//        selectedLunch.text = "Wait for it..."
//        
//        publicDB.performQuery(query, inZoneWithID: nil) {
//            results, error in
//            
//            if error != nil {
//                print(error!.localizedDescription)
//                print("This is an Error")
//            } else {
//                // Insert guard!!
//                print(results?.count)
//                let choosenRestaurant = results![random()%(results?.count)!]
//                print(choosenRestaurant["Name"]!)
//                
//                self.selectedLunch.text = (choosenRestaurant["Name"]! as! String)
//                
//            }
//        }
//        
//        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

