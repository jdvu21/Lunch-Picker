//
//  Restaurant+CoreDataProperties.swift
//  Brewski Dewski
//
//  Created by Mike Weyandt on 12/14/15.
//  Copyright © 2015 iOS Dev Class - Brewski Dewski. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Restaurant {

    @NSManaged var name: String?
    @NSManaged var rating: NSNumber?
    @NSManaged var type: String?
    @NSManaged var favoritedish: String?

}
