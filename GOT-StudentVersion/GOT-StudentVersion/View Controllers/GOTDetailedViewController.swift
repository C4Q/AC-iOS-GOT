//
//  GOTDetailedViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTDetailedViewController: UIViewController {

    @IBOutlet weak var seasonEpisodeNavigationTitle: UINavigationItem!
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var runTimeLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    
    var episode: GOTEpisode!
    
    override func viewDidLoad() {
        setUpView()
        super.viewDidLoad()
    }

    func setUpView() {
        let seasonEpisodeTitle: String = ((episode.season < 10) ? "S0\(episode.season)" : "S\(episode.season)") + ((episode.number < 10) ? "E0\(episode.number)" : "E\(episode.number)")
        seasonEpisodeNavigationTitle.title = seasonEpisodeTitle
        episodeTitleLabel.text = episode.name
        episodeLabel.text = episode.number.description
        episodeImageView.image = UIImage(named: episode.originalImageID)
        seasonLabel.text = episode.season.description
        runTimeLabel.text = "\(episode.runtime) minutes"
        summaryTextView.text = episode.summary
        summaryTextView.layer.cornerRadius = 10
        summaryTextView.layer.masksToBounds = true
        summaryTextView.layer.borderWidth = 1
        summaryTextView.layer.borderColor = UIColor.darkGray.cgColor
    }
}
