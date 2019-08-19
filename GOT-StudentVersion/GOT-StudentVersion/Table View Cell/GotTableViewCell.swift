//
//  GotTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Mr Wonderful on 8/10/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class GotTableViewCell: UITableViewCell {

    @IBOutlet var gotName: UILabel!
    @IBOutlet var seasonAndEpisode: UILabel!
    @IBOutlet var gotImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
