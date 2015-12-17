//
//  ViewController.swift
//  Brewski Dewski
//
//  Created by Mike Weyandt on 11/24/15.
//  Copyright © 2015 iOS Dev Class - Brewski Dewski. All rights reserved.
//

import UIKit
import CloudKit


class ViewController: UIViewController, UITextFieldDelegate {
    
    
    let privateDB = CKContainer.defaultContainer().privateCloudDatabase
    let publicDB = CKContainer.defaultContainer().publicCloudDatabase
    let ratingPredicate = NSPredicate(format: "Rating >= 4")
    
    @IBOutlet weak var newPlaceName: UITextField!
    @IBOutlet weak var newPlaceType: UITextField!
    @IBOutlet weak var newPlaceFavoriteDish: UITextField!
    @IBOutlet weak var newPlaceRating: RatingControl!

    
    @IBOutlet weak var selectedLunch: UITextField!

    @IBAction func submitNewRestaurant() {
        
        
        // TODO: Better validation process, shake text box? display a message?
        if(newPlaceName.text! == "" || newPlaceType.text! == "" || newPlaceRating.rating == 0) {
            return
        }
        
        //  CKRecord for Private DB
        let privateRestaurant = CKRecord(recordType: "Restaurant")
        privateRestaurant["Name"] = newPlaceName.text!
        privateRestaurant["Type"] = newPlaceType.text!
        privateRestaurant["FavoriteDish"] = newPlaceFavoriteDish.text!
        privateRestaurant["Rating"] = newPlaceRating.rating
        
        //  CKRecord for Public DB
        let publicRestaurant = CKRecord(recordType: "Restaurant")
        publicRestaurant["Name"] = newPlaceName.text!
        publicRestaurant["Type"] = newPlaceType.text!
        publicRestaurant["FavoriteDish"] = newPlaceFavoriteDish.text!
        publicRestaurant["Rating"] = newPlaceRating.rating

        //  Saves restaurant to privateDB
        privateDB.saveRecord(privateRestaurant) {
            (record, error) -> Void in
            
            if error != nil {
                print(error)
                return
            }
            //  Saves restaurant to publicDB
            self.publicDB.saveRecord(publicRestaurant) {
                (record, error) -> Void in
                
                if error != nil {
                    print(error)
                    return
                }
            }
        }
        
      navigationController?.popToRootViewControllerAnimated(true)

    }
    
    //  Query private CloudKit DB for restaurants you have added, and randomly select one
  @IBAction func stickWithTheFamiliar() {
        
        let query = CKQuery(recordType: "Restaurant", predicate: ratingPredicate)
        
        selectedLunch.text = "Wait for it..."
        
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
                            if results.count == 0 {
                                self.selectedLunch.text = "You have not added any restaurants!"
                                self.selectedLunch.reloadInputViews()
                            } else {
                                let choosenRestaurant = results[random()%(results.count)]
                                self.selectedLunch.text = (choosenRestaurant["Name"]! as! String)
                                self.selectedLunch.reloadInputViews()
                            }
                        }

                    
                }
            }
        
  }
    
    //  Query public CloudKit DB for restaurants others have added, and randomly select one
    @IBAction func trySomethingNew() {
        
        let query = CKQuery(recordType: "Restaurant", predicate: ratingPredicate)
        
        selectedLunch.text = "Wait for it..."
        
        publicDB.performQuery(query, inZoneWithID: nil) {
            results, error in
            
            if error != nil {
                print(error!.localizedDescription)
            } else {
                guard let results = results else {
                    print("ERROR: Query returned nil")
                    return
                }
                
                dispatch_async(dispatch_get_main_queue()) {
                    let choosenRestaurant = results[random()%(results.count)]
                    self.selectedLunch.text = (choosenRestaurant["Name"]! as! String)
                    self.selectedLunch.reloadInputViews()
                }
                
            }
        }
        
    }
    
    
    //TODO: Check if user is signed into iCloud, and prompt for sign in if not
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

/*  
    
    Function to check if user is signed into iCloud....

    func iCloudIsAvailable() -> Bool {
        if let token = NSFileManager.defaultManager().ubiquityIdentityToken {
            return true
        } else {
            return false
        }
    }
*/

}

