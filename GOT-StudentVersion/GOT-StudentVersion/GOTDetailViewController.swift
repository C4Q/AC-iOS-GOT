//
//  GOTDetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Levi Davis on 8/13/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class GOTDetailViewController: UIViewController {
    
    var gotEpisode: GOTEpisode!

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airdateLabel: UILabel!
    @IBOutlet weak var summaryField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews() {
        episodeNameLabel.text = gotEpisode.name
        seasonLabel.text = "Season: \(gotEpisode.season)"
        episodeLabel.text = "Episode: \(gotEpisode.number)"
        runtimeLabel.text = "Runtime: \(gotEpisode.runtime)"
        airdateLabel.text = "Airdate: \(gotEpisode.airdate)"
        summaryField.text = gotEpisode.summary
        detailImage.image = gotEpisode.getImage()
    }
}
