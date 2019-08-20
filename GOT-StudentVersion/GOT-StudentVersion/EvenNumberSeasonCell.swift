//
//  EvenNumberSeasonCell.swift
//  GOT-StudentVersion
//
//  Created by Jack Wong on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class EvenNumberSeasonCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
