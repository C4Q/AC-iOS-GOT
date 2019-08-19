//
//  EpisodesTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Kary Martinez on 8/16/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {

    @IBOutlet weak var seasonEpisodeImage: UIImageView!
    @IBOutlet weak var EpisodeName: UILabel!
    @IBOutlet weak var seasonEpisodeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
