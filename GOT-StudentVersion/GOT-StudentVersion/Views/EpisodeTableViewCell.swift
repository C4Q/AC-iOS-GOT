//
//  episodeTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Ian Cervone on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

  
  @IBOutlet weak var episodeImageView: UIImageView!
  
  @IBOutlet weak var episodeTitleLabel: UILabel!
  
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
