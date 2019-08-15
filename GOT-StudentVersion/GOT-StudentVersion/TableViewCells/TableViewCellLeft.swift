//
//  TableViewCellLeft.swift
//  GOT-StudentVersion
//
//  Created by Jocelyn Boyd on 8/11/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class TableViewCellLeft: UITableViewCell {
  
  //content view
  @IBOutlet weak var leftImageView: UIImageView!
  @IBOutlet weak var OddEpsTitleLabel: UILabel!
  @IBOutlet weak var OddSeasonNumberLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        self.isSelected
        // Configure the view for the selected state
    }

}
