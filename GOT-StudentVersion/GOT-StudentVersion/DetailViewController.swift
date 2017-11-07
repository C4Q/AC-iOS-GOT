//
//  DetailViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    
    @IBOutlet weak var runtimeLabel: UILabel!
    
    @IBOutlet weak var airdateLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    var episode: GOTEpisode?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let episode = episode else {
            return
        }
        imageView.image = UIImage(named: episode.mediumImageID)
        nameLabel.text = episode.name
        seasonLabel.text = "Season: \(episode.season)"
        episodeLabel.text = "Episode: \(episode.number)"
        runtimeLabel.text = "Runtime: \(episode.runtime)"
        airdateLabel.text = "Airdate: \(episode.airdate)"
        textView.text = episode.summary
        
    }

   
    


}
