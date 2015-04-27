//
//  BusinessTableViewCell.swift
//  Yelp
//
//  Created by Joe Gasiorek on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessTableViewCell: UITableViewCell {

    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setFromBusiness(model: Business) {
        nameLabel.text = model.name
        distanceLabel.text = model.distance
//        priceLabel.text
        reviewCountLabel.text = "\(model.reviewCount!) reviews"
        ratingImageView.setImageWithURL(model.ratingImageURL)
        
        iconImageView.setImageWithURL(model.imageURL)
        addressLabel.text = model.address
        categoryLabel.text = model.categories
    }
}
