//
//  RightTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class RightTableViewCell: UITableViewCell {

    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var rightName: UILabel!
    @IBOutlet weak var rightEpisode: UILabel!
    
    func rightCell(to GOT: GOTEpisode) {
    rightImage.image = UIImage(named: String(GOT.mediumImageID))
    rightName.text = GOT.name
    rightEpisode.text = ("S:\(GOT.season) E:\(GOT.number)")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
