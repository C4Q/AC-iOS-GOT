//
//  GOTTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Levi Davis on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class GOTTableViewCell: UITableViewCell {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
