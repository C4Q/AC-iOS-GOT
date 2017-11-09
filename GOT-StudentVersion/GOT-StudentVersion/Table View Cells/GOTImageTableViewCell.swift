//
//  RightImageTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Masai Young on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(with episode: GOTEpisode) {
        self.titleLabel.text = episode.name
        self.seasonLabel.text = "S:\(episode.season) E:\(episode.number)"
        self.episodeImageView.image = UIImage(named: episode.originalImageID)
        
        self.backgroundColor = UIColor.ProjectColors.backgroundColor
    }
    
}

class RightImageTableViewCell: GOTImageTableViewCell  {
    
}

class LeftImageTableViewCell: GOTImageTableViewCell {
    
}
