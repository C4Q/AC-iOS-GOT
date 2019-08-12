//
//  OddSeasonsTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Jason Ruan on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class OddSeasonsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var oddSeasonsImageView: UIImageView!
    @IBOutlet weak var oddSeasonsTitleLabel: UILabel!
    @IBOutlet weak var oddSeasonsEpisodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
