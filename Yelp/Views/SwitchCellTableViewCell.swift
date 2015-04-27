//
//  SwitchCellTableViewCell.swift
//  Yelp
//
//  Created by Joe Gasiorek on 4/26/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol SwitchCellTableViewCellDelegate {
    optional func switchCellTableViewCell(cell:SwitchCellTableViewCell, didChangedValue: Bool)
}

class SwitchCellTableViewCell: UITableViewCell {

    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var onSwitch: UISwitch!
    
    weak var delegate: SwitchCellTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        onSwitch.addTarget(self, action: "switchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func switchValueChanged() {
        delegate?.switchCellTableViewCell?(self, didChangedValue: onSwitch.on)
    }
}
