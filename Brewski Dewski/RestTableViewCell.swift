//
//  RestTableViewCell.swift
//  Brewski Dewski
//
//  Created by Jeff Vu on 12/16/15.
//  Copyright © 2015 iOS Dev Class - Brewski Dewski. All rights reserved.
//

import UIKit

class RestTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dishLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
