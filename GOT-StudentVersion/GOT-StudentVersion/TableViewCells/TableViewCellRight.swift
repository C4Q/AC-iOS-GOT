//
//  TableViewCellRight.swift
//  GOT-StudentVersion
//
//  Created by Jocelyn Boyd on 8/11/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class TableViewCellRight: UITableViewCell {
  
  //content view
  @IBOutlet weak var rightImageView: UIImageView!
  @IBOutlet weak var EvenEpsTitleLabel: UILabel!
  @IBOutlet weak var EvenSeasonLabel: UILabel!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
