//
//  OddTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Sunni Tang on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class OddTableViewCell: UITableViewCell {

    @IBOutlet weak var oddImage: UIImageView!
    @IBOutlet weak var oddTitleLabel: UILabel!
    @IBOutlet weak var oddSeasonEpLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
