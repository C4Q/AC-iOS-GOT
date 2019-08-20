//
//  OddNumberSeasonCell.swift
//  GOT-StudentVersion
//
//  Created by Jack Wong on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class OddNumberSeasonCell: UITableViewCell {

    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
