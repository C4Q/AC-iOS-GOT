//
//  EvenTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Sunni Tang on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class EvenTableViewCell: UITableViewCell {

    @IBOutlet weak var evenImage: UIImageView!
    @IBOutlet weak var evenTitleLabel: UILabel!
    @IBOutlet weak var evenSeasonEpLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
