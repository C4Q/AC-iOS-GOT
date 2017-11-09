//
//  GOTRightAlignedTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Clint Mejia on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTRightAlignedTableViewCell: UITableViewCell {

    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var episodeIndexLabel: UILabel!
    @IBOutlet weak var episodeMediumImage: UIImageView!
    
    func rightAlignedSet(to GOT: GOTEpisode) {
        episodeNameLabel.text = GOT.name
        episodeIndexLabel.text = "S:\(GOT.season) E: \(GOT.number)"
        episodeMediumImage.image = UIImage(named: String(GOT.mediumImageID))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
