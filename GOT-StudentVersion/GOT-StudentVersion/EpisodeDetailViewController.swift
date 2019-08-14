//
//  EpisodeDetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Michelle Cueva on 8/13/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    
    var episode: GOTEpisode!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var seasonLabel: UILabel!
    
    @IBOutlet weak var episodeLabel: UILabel!
    
    @IBOutlet weak var runTimeLabel: UILabel!
    
    @IBOutlet weak var airDateLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllVars()
        descriptionLabel.isEditable = false
    }
    
    func getAllVars() {
        
        nameLabel.text = episode.name
        seasonLabel.text = "Season: \(episode.season)"
        episodeLabel.text = "Episode: \(episode.number)"
        runTimeLabel.text = "Episode: \(episode.runtime)"
        airDateLabel.text = "Airdate: \(episode.airdate)"
        descriptionLabel.text = episode.summary
        imageView.image = UIImage(named: episode.originalImageID)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
