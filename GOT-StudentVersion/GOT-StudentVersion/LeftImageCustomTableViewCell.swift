//
//  LeftImageCustomTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Reiaz Gafar on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class LeftImageCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var episodeInformationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
