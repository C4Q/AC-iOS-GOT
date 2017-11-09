//
//  GotOtherTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/5/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GotOtherTableViewCell: UITableViewCell {

    @IBOutlet weak var GOTImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
