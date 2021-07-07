//
//  DetailViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/8/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var seasonNumber: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var episodeRuntime: UILabel!
    @IBOutlet weak var episodeAirdate: UILabel!
    @IBOutlet weak var episodeDescription: UITextView!
    
    var episode: GOTEpisode?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let episode = episode else {
            return
        }
        episodeImage.image = UIImage(named: (episode.originalImageID))
        episodeName?.text = episode.name
        seasonNumber.text = "Season: " + String(episode.season)
        episodeNumber.text = "Episode: " + String(episode.number)
        episodeRuntime.text = "Runtime: " + String(episode.runtime) + " Minutes"
        episodeAirdate.text = "Airdate: " + String(episode.airdate)
        episodeDescription.text = episode.summary
    }



}
