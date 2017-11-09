//
//  DetailedEpisodeViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class DetailedEpisodeViewController: UIViewController {

    var episode:GOTEpisode? = nil
    
    @IBOutlet weak var episodeName: UILabel!
    
    @IBOutlet weak var episodePoster: UIImageView!
    
    @IBOutlet weak var season: UILabel!
    @IBOutlet weak var episodeId: UILabel!
    
    @IBOutlet weak var runTime: UILabel!
    
    @IBOutlet weak var airDate: UILabel!
    
    @IBOutlet weak var episodeDescription: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let episode = episode else {
            return
        }
        episodeName.text = episode.name
        episodePoster.image = UIImage(named: episode.originalImageID)
        season.text = "S: \(episode.season)"
        runTime.text = "Runtime: \(episode.runtime)"
        airDate.text = "Airdate: \(episode.airdate)"
        episodeDescription.text = episode.summary
        episodeId.text = "Episode ID: \(episode.id)"

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
