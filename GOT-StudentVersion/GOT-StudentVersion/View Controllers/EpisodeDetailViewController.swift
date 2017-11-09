//
//  EpisodeDetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Masai Young on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit

class EpisodeDetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailSeasonLabel: UILabel!
    @IBOutlet weak var detailEpisodeLabel: UILabel!
    @IBOutlet weak var detailRuntimeLabel: UILabel!
    @IBOutlet weak var detailAirdateLabel: UILabel!
    @IBOutlet weak var detailInfoLabel: UILabel!
    
    var currentEpisode: GOTEpisode!
    
    func setUpLabels(with episode: GOTEpisode) {
        detailImageView.image = UIImage(named: episode.originalImageID)
        detailNameLabel.text = episode.name
        detailSeasonLabel.text = "Season \(episode.season)"
        detailEpisodeLabel.text = "Episode \(episode.number)"
        detailRuntimeLabel.text = String(episode.runtime)
        detailAirdateLabel.text = episode.airdate
        detailInfoLabel.text = episode.summary
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels(with: currentEpisode)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
