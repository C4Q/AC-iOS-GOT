//
//  GOTTableViewCell2.swift
//  GOT-StudentVersion
//
//  Created by God on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit


class GOTTableViewCell2: UITableViewCell {
    
  
    @IBOutlet weak var rightImage: UIImageView!
    
    @IBOutlet weak var epTitle: UILabel!
    
    
    @IBOutlet weak var seasonAndEp: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        rightImage.layer.shadowColor = UIColor.cyan.cgColor
        rightImage.layer.shadowOffset = CGSize(width: 0, height: 2)
        rightImage.layer.shadowOpacity = 2
        rightImage.layer.shadowRadius = 2.0
        rightImage.clipsToBounds = false
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
    
}
