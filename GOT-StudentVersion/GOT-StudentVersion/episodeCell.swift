//
//  episodeCell.swift
//  GOT-StudentVersion
//
//  Created by Krystal Campbell on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class episodeCell: UITableViewCell {

    @IBOutlet weak var episodeNameOutlet: UILabel!
    
    @IBOutlet weak var episodeDetailsOutlet: UILabel!
    
    
    @IBOutlet weak var episodeImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
