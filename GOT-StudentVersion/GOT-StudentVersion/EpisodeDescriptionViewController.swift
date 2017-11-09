//
//  EpisodeDescriptionViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class EpisodeDescriptionViewController: UIViewController {
    
    @IBOutlet weak var episodeDescriptionDetail: UITextView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var airDate: UILabel!
    @IBOutlet weak var runTime: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var seasonNumber: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    var GOTDetail: GOTEpisode?
    
    override func viewDidLoad() {
        episodeDescriptionDetail.text = GOTDetail?.summary
        episodeName.text = GOTDetail?.name
        airDate.text = GOTDetail?.airdate
        runTime.text = GOTDetail?.runtime.description
        episodeNumber.text = GOTDetail?.number.description
        seasonNumber.text = GOTDetail?.season.description
        detailImage.image = UIImage(named: GOTDetail!.mediumImageID.description)
        
    }
    
}
