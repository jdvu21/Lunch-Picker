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




//Sorting public should not be difficult, linking resturants to users will be difficult
class ViewController: UIViewController {
    
    
    
    
    
    // MARK: CoreData
    //var restaurants = [NSManagedObject]()
    
    
    
    
    
    
    
    
    
    

    @IBOutlet weak var newPlaceName: UITextField!
    @IBOutlet weak var newPlaceType: UITextField!
    @IBOutlet weak var newPlaceFavoriteDish: UITextField?
    
    @IBOutlet weak var newPlaceRating: RatingControl!


    @IBAction func submitNewRestaurant() {
        
        var name = newPlaceName.text
        var type = newPlaceType.text
        var favDish = newPlaceFavoriteDish?.text
        var restaurantRating = newPlaceRating.rating
        
        

        print(name, type, favDish, restaurantRating)
        
    }
    
    
    //  When "Submit" is pressed, newplace is saved to public CloudKit and to CoreData
    

    //
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

