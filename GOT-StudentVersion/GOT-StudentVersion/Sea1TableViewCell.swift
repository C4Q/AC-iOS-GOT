//
//  Sea1TableViewCell.swift
//  GOT-StudentVersion
//
//  Created by EricM on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class Sea1TableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var epNumber: UILabel!
    @IBOutlet weak var image1: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
