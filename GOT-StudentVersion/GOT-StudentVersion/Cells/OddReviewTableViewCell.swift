//
//  ReviewTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by hildy abreu on 8/14/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var oddImage: UIImageView!
    @IBOutlet weak var oddTitle: UILabel!

    @IBOutlet weak var oddEpisode: UILabel!
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
