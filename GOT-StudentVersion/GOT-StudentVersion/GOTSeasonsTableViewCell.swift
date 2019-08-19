//
//  GOTSeasonsTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Liana Norman on 8/13/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class GOTSeasonsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var oddSeasonEpLabel: UILabel!
    @IBOutlet weak var oddSeasonImageView: UIImageView!
    @IBOutlet weak var oddEpisodeName: UILabel!
    @IBOutlet weak var evenEpisodeName: UILabel!
    @IBOutlet weak var evenSeasEpLabel: UILabel!
    @IBOutlet weak var evenSeasonImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
