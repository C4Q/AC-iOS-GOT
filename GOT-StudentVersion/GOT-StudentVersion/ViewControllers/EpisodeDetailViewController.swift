//
//  EpisodeDetailViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/8/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airdateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: 
    UITextView!
    
    var episode: GOTEpisode!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScreen()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        setUpScreen()
//    }

    func setUpScreen() {
        imageView.image = UIImage(named: String(episode.originalImageID))
        titleLabel.text = episode.name
        seasonLabel.text = "Season: \(episode.season)"
        episodeLabel.text = "Episode: \(episode.number)"
        runtimeLabel.text = "Runtime: \(episode.runtime) min"
        airdateLabel.text = "Airdate: \(episode.airdate)"
        descriptionTextView.text = episode.summary
        
        navigationItem.title = episode.name
        
        // set all properties like labels and stuff from episode
    }
}
