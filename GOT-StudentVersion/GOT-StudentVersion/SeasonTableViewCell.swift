//
//  SeasonTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Michelle Cueva on 8/10/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class SeasonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var seasonAndNumberLabel: UILabel!
    
    @IBOutlet weak var mediumImageLabel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // if you want to change the UI of the cell then do it here 
    }

}
