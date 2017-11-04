//
//  GOTTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Richard Crichlow on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTTableViewCell: UITableViewCell {
    
    @IBOutlet weak var leftEpisodeImage: UIImageView!
    @IBOutlet weak var leftEpisodeTitleLabel: UILabel!
    @IBOutlet weak var leftSeasonNumEpisodeNumLabel: UILabel!
    @IBOutlet weak var rightEpisodeImage: UIImageView!
    @IBOutlet weak var rightEpisodeTitleLabel: UILabel!
    @IBOutlet weak var rightSeasonNumEpisodeNumLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
