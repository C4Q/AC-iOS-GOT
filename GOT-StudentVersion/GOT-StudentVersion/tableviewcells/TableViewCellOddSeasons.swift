//
//  TableViewCellOddSeasons.swift
//  GOT-StudentVersion
//
//  Created by Tia Lendor on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class TableViewCellOddSeasons: UITableViewCell {

    @IBOutlet weak var uiImageViewOdd: UIImageView!
    
    @IBOutlet weak var episodeTitleLabelOdd: UILabel!
    @IBOutlet weak var seasonLabelOdd: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
