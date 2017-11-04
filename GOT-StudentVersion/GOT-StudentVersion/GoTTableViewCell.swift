//
//  GoTTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GoTTableViewCell: UITableViewCell {

    @IBOutlet weak var episodeImage: UIImageView!
    
    
    @IBOutlet weak var episodeTitle: UILabel!
    
    
    @IBOutlet weak var seasonEpisode: UILabel!
    
    @IBOutlet weak var episodeImageRight: UIImageView!
    
    @IBOutlet weak var episodeTitleRight: UILabel!
    
    @IBOutlet weak var seasonEpisodeRIght: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
