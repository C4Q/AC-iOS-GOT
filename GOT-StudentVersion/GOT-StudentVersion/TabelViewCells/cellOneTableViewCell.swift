//
//  cellOneTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Angela Garrovillas on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class cellOneTableViewCell: UITableViewCell {
    @IBOutlet weak var imageCellOne: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seasonEpisodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
