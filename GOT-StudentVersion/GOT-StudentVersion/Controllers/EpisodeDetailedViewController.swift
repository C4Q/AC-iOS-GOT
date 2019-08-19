//
//  EpisodeDetailedViewController.swift
//  GOTE Project
//
//  Created by Mariel Hoepelman on 8/18/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import UIKit
import Foundation

class EpisodeDetailedViewController: UIViewController {
    var episode: GOTEpisode!
    @IBOutlet weak var GOTEimage: UIImageView!
    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var seasonNumberLabel: UILabel!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    
    @IBOutlet weak var episodeDescriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        episodeNameLabel.text = episode.name
        seasonNumberLabel.text = String(episode.season)
        episodeNumberLabel.text = String(episode.number)
        runtimeLabel.text = String(episode.runtime)
        airDateLabel.text = episode.airdate
        episodeDescriptionTextView.text = episode.summary
        GOTEimage.image = UIImage(named: episode.originalImageID)
    }
}
