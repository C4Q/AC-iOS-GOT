//
//  EpisodeDetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Sunni Tang on 8/13/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    
    var episode: GOTEpisode!
    
    @IBOutlet weak var episodeDetailImage: UIImageView!
    @IBOutlet weak var episodeDetailName: UILabel!
    @IBOutlet weak var episodeDetailSeason: UILabel!
    @IBOutlet weak var episodeDetailEpisode: UILabel!
    @IBOutlet weak var episodeDetailRuntime: UILabel!
    @IBOutlet weak var episodeDetailAirdate: UILabel!
    @IBOutlet weak var episodeDetailDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        episodeDetailImage.image = UIImage(named: episode.mediumImageID)
        episodeDetailName.text = episode.name
        episodeDetailSeason.text = "Season: \(episode.season)"
        episodeDetailEpisode.text = "Episode: \(episode.number)"
        episodeDetailRuntime.text = "Runtime: \(episode.runtime)"
        episodeDetailAirdate.text = "Air date: \(episode.airdate)"
        episodeDetailDescription.text = episode.summary
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
