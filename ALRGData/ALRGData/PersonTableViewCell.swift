//
//  PersonTableViewCell.swift
//  ALRGData
//
//  Created by Paul Rudolph on 1/24/15.
//  Copyright (c) 2015 Paul Rudolph. All rights reserved.
//

import UIKit
import QuartzCore

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Round Person View
        
        personImageView.layer.cornerRadius = 25
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
