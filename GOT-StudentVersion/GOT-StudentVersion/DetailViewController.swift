//
//  DetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Angela Garrovillas on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeNumLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airtimeLabel: UILabel!
    @IBOutlet weak var summaryText: UITextView!
    //make constraints and stretch for labels
    
    var episode: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let episode = episode else {
            return
        }
        self.episodeImage.image = UIImage(named: episode.mediumImageID)
        self.titleLabel.text = episode.name
        self.seasonLabel.text = "Season: \(episode.season)"
        self.episodeNumLabel.text = "Episode: \(episode.number)"
        self.runtimeLabel.text = "Runtime: \(episode.runtime)"
        self.airtimeLabel.text = "Airdate: \(episode.airdate)"
        self.summaryText.text = episode.summary

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
