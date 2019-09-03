//
//  GoTLeftTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Radharani Ribas-Valongo on 9/3/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class GoTLeftTableViewCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
