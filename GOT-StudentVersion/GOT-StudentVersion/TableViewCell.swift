//
//  TableViewCell.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/9/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var seasonAndEpisodeLabel: UILabel!
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
