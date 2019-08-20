//
//  EvenSeasonsTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Pursuit on 8/18/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class EvenSeasonsTableViewCell: UITableViewCell {

    @IBOutlet weak var evenImageView: UIImageView!
    
    @IBOutlet weak var evenTitleLabel: UILabel!
    
    @IBOutlet weak var evenEpisodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
