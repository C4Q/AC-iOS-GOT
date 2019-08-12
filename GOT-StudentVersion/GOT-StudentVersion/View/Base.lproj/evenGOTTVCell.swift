//
//  evenGOTTVCell.swift
//  GOT-StudentVersion
//
//  Created by Alyson Abril on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class evenGOTTVCell: UITableViewCell {

    
    @IBOutlet weak var evenTitleLabel: UILabel!
    @IBOutlet weak var evenEpisodeLabel: UILabel!
    @IBOutlet weak var evenImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
