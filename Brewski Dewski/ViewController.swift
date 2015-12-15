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
    
    var restaurants = [NSManagedObject]()
    
    
    
    
    
    
    
    
    
    //MARK: Add a new Restaurant
    
    @IBOutlet weak var newPlaceName: UITextField!
    @IBOutlet weak var newPlaceType: UITextField!
    @IBOutlet weak var newPlaceFavoriteDish: UITextField?
    @IBOutlet weak var newPlaceRating: RatingControl!


    @IBAction func submitNewRestaurant() {
        
        let name = newPlaceName.text
        let type = newPlaceType.text
        let favDish = newPlaceFavoriteDish?.text
        let restaurantRating = newPlaceRating.rating
        
        
        
       //let restaurant = Restaurant()
            
//        restaurant.name = name
//        restaurant.type = type
//        restaurant.favoritedish = favDish
//        restaurant.rating = restaurantRating
//        
//        //restaurants.append(restaurant)
//        
//        print(restaurant)
        
    }
    
    
    //  When "Submit" is pressed, newplace is saved to public CloudKit and to CoreData(or plsit)
    

    //
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

