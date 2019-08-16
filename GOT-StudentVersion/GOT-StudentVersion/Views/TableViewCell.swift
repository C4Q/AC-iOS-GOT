//
//  TableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Phoenix McKnight on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var imageGoT: UIImageView!
    
    @IBOutlet var episodeName: UILabel!
    
    @IBOutlet var episodeID: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
