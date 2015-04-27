//
//  TextTableViewCell.swift
//  Yelp
//
//  Created by Joe Gasiorek on 4/27/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol TextTableViewCellDelegate {
    optional func textTableViewCell(cell: TextTableViewCell, value: String)
}

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextField!
    
    weak var delegate: TextTableViewCellDelegate?
    
    @IBAction func editingEnded(sender: AnyObject) {
        if delegate != nil {
            delegate?.textTableViewCell?(self, value:textView.text)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
