//
//  FirstTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Kevin Natera on 8/13/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    
    @IBOutlet weak var firstCellPicOutlet: UIImageView!
    
    @IBOutlet weak var firstCellNameLabel: UILabel!
    
    @IBOutlet weak var firstCellEpisodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
