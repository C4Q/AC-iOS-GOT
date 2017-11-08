//
//  GOTDetailViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTDetailViewController: UIViewController {
    var gotEpisodeDetail: GOTEpisode?
    @IBOutlet weak var gotOriginalImage: UIImageView!
    @IBOutlet weak var gotEpisode: UILabel!
    @IBOutlet weak var gotSeasonNro: UILabel!
    @IBOutlet weak var gotEpisodeNro: UILabel!
    @IBOutlet weak var gotRuntime: UILabel!
    @IBOutlet weak var gotAirdate: UILabel!
    @IBOutlet weak var gotSumary: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let episode = gotEpisodeDetail {
            gotOriginalImage.image = UIImage(named: episode.originalImageID)
            gotEpisode.text = episode.name
            gotSeasonNro.text = "Season: \(episode.season)"
            gotEpisodeNro.text = "Episode: \(episode.number)"
            gotRuntime.text = "Runtime: \(episode.runtime)"
            gotAirdate.text = "Airdate: \(episode.airdate)"
            gotSumary.text = episode.summary
        }
    }
}
