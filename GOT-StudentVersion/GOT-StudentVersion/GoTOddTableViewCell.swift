//
//  GoTOddTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Anthony Gonzalez on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class GoTOddTableViewCell: UITableViewCell {

    
    @IBOutlet weak var episodePreviewImage: UIImageView!
    @IBOutlet weak var episodeNameLabel: UILabel!
    
    @IBOutlet weak var episodeNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
