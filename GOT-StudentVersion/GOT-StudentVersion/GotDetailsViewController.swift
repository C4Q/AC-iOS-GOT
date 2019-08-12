//
//  TableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Mr Wonderful on 8/11/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class GotDetailedViewController: UITableViewCell {

    @IBOutlet var detailDiscription: UITextView!
    @IBOutlet var detailAirTime: UILabel!
    @IBOutlet var detailRunTime: UILabel!
    @IBOutlet var detailEpisodes: UILabel!
    @IBOutlet var detailSeasonNUmber: UILabel!
    @IBOutlet var detailTitleLabel: UILabel!
    @IBOutlet var detailsImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
