//
//  CustomTVC.swift
//  GOT-StudentVersion
//
//  Created by Sam Roman on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class CustomTVC: UITableViewCell {


    
    @IBOutlet weak var imageOut: UIImageView!
    

    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    @IBOutlet weak var episodeLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
