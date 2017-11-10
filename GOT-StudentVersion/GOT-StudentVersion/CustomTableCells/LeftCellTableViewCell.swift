//
//  LeftCellTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class LeftCellTableViewCell: UITableViewCell {

    @IBOutlet weak var episodePoster: UIImageView!
    
    @IBOutlet weak var episodeName: UILabel!
    
    @IBOutlet weak var episodeNameAndSeason: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
