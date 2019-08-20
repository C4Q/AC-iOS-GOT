//
//  TableViewCellEvenSeasons.swift
//  GOT-StudentVersion
//
//  Created by Tia Lendor on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class TableViewCellEvenSeasons: UITableViewCell {

    @IBOutlet weak var uiImageViewEven: UIImageView!
    
    @IBOutlet weak var episodeTitleLabelEven: UILabel!
    
    @IBOutlet weak var seasonLabelEven: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
