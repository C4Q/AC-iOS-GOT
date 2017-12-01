//
//  DetailViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/8/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var episodeInfo: GOTEpisode?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
   
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var runTimeLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let unwrappedEpisodeInfo = episodeInfo else {
            return
        }
        
        imageView.image = UIImage(named: unwrappedEpisodeInfo.originalImageID)
        episodeName.text = unwrappedEpisodeInfo.name
        seasonLabel.text = "Season: \(String(unwrappedEpisodeInfo.season))"
        episodeLabel.text = "Episode: \(String(unwrappedEpisodeInfo.number))"
        runTimeLabel.text = "Run time: \(String(unwrappedEpisodeInfo.runtime))"
        airDateLabel.text = "Air Date: \(String(unwrappedEpisodeInfo.airdate))"
        descriptionTextView.text = unwrappedEpisodeInfo.summary
    }
    
}



