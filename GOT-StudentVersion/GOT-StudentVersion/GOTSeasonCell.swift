//
//  GOTSeasonCell.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTSeasonCell: UITableViewCell {

    @IBOutlet weak var rightSideEpisodeNumberSeasonLabel: UILabel!
    
    @IBOutlet weak var rightSideEpisodeNameLabel: UILabel!
    @IBOutlet weak var rightSideSeasonImage: UIImageView!
    @IBOutlet weak var seasonImage: UIImageView!
    @IBOutlet weak var seasonEpisodeNameLabel: UILabel!
    @IBOutlet weak var seasonEpisodeNumberSeasonLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
