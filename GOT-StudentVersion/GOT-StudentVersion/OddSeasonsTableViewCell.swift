//
//  OddSeasonsTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Pursuit on 8/18/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class OddSeasonsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var oddImageView: UIImageView!
    
    @IBOutlet weak var oddTitleLabel: UILabel!
    
    @IBOutlet weak var oddEpisodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
