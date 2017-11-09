//
//  LeftImageTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/8/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class LeftImageTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var episodeImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var episodeDetailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
