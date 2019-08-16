//
//  reverseEpisodeTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Krystal Campbell on 8/16/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class reverseEpisodeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var episodeImage: UIImageView!
    
    @IBOutlet weak var episodeNameOutlet: UILabel!
    
    @IBOutlet weak var episodeDetailOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
