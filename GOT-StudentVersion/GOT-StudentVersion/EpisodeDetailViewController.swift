//
//  EpisodeDetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Reiaz Gafar on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailSeasonLabel: UILabel!
    @IBOutlet weak var detailEpisodeLabel: UILabel!
    @IBOutlet weak var detailRuntimeLabel: UILabel!
    @IBOutlet weak var detailAirdateLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    
    var episode: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let episode = episode else {
            return
        }
        
        detailImageView.image = UIImage(named: episode.originalImageID)
        detailNameLabel.text = episode.name
        detailSeasonLabel.text = "Season: " + String(episode.season)
        detailEpisodeLabel.text = "Episode: " + String(episode.number)
        detailRuntimeLabel.text = "Runtime: " + String(episode.runtime)
        detailAirdateLabel.text = "Airdate: " + String(episode.airdate)
        detailTextView.text = String(episode.summary)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
