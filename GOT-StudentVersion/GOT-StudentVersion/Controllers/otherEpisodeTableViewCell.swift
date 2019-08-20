//
//  otherEpisodeTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Kary Martinez on 8/16/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class otherEpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var othersideImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
