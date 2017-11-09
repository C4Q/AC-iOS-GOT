//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/4/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var selectedEpisode: GOTEpisode!

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var descriptionTextBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews(for: selectedEpisode)
    }
    
    func updateViews(for episode: GOTEpisode) {
        //self.detailImageView.image
        self.episodeLabel.text = "Episode: \(selectedEpisode.name)"
        self.seasonLabel.text = "Season: \(selectedEpisode.season)"
    }

}
