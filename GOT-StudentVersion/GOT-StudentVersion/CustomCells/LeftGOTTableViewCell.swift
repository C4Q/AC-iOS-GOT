//
//  LeftGOTTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Luis Calle on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class LeftGOTTableViewCell: UITableViewCell {

    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeNumAndSeasonLabel: UILabel!
    @IBOutlet weak var episodeTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
