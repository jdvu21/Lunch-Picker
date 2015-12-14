//
//  ViewController.swift
//  Brewski Dewski
//
//  Created by Mike Weyandt on 11/24/15.
//  Copyright © 2015 iOS Dev Class - Brewski Dewski. All rights reserved.
//

import UIKit
import CloudKit

struct Restuant {
    
    var name: String
    var type: String
    var favoriteDish: String?
    
    
}


//Sorting public should not be difficult, linking resturants to users will be difficult
class ViewController: UIViewController {

    @IBOutlet weak var newPlaceName: UITextField!
    @IBOutlet weak var newPlaceType: UITextField!
    @IBOutlet weak var newPlaceFavoriteDish: UITextField?
    
    //  Submit new place
    @IBOutlet weak var newPlaceSubmit: UIButton!
    
    
    //  When "Submit" is pressed, newplace is saved to public CloudKit and to personal plist data.
    

    //
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

