//
//  ReverseTVC.swift
//  GOT-StudentVersion
//
//  Created by Sam Roman on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class ReverseTVC: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var episodeLabel: UILabel!
    
    @IBOutlet weak var imageOut: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
