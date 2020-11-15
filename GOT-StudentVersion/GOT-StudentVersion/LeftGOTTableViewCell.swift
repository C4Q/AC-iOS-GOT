//
//  LeftGOTTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Maryann Yin on 11/4/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class LeftGOTTableViewCell: UITableViewCell {

    @IBOutlet var gotEpisodeImageView: UIImageView!
    
    @IBOutlet var episodeTitleLabel: UILabel!
    
    @IBOutlet var seasonAndEpisodeNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
