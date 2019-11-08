//
//  episodeViewController.swift
//  GOT-StudentVersion
//
//  Created by Ahad Islam on 11/8/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    var episode: GOTEpisode!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seasonNumber: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var runTime: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: episode.originalImageID)
        titleLabel.text = episode.name
        seasonNumber.text = String(episode.season)
        episodeNumber.text = String(episode.number)
        dateLabel.text = episode.airdate
        runTime.text = String(episode.runtime)
        descriptionTextView.text = episode.summary
        
        // Do any additional setup after loading the view.
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
