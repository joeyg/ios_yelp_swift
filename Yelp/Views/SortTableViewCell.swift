//
//  SortTableViewCell.swift
//  Yelp
//
//  Created by Joe Gasiorek on 4/26/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

protocol SortTableViewCellDelegate {
    func sortTableViewCell(cell:SortTableViewCell, value:YelpSortMode)
}

class SortTableViewCell: UITableViewCell {
    var delegate: SortTableViewCellDelegate?
    
    @IBAction func valueChanged(sender: AnyObject) {
        if delegate != nil {
            let val = YelpSortMode(rawValue:segmentControl.selectedSegmentIndex)
            
            delegate?.sortTableViewCell(self, value: val!)
        }
    }
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
