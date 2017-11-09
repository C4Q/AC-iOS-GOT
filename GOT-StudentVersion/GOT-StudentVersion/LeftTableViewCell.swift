//
//  LeftTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class LeftTableViewCell: UITableViewCell {

    
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var leftName: UILabel!
    @IBOutlet weak var leftEpisode: UILabel!
    
    func leftCell(to GOT: GOTEpisode) {
        leftImage.image = UIImage(named: String(GOT.mediumImageID))
        leftName.text = GOT.name
        leftEpisode.text = ("S:\(GOT.season) E:\(GOT.number)")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
