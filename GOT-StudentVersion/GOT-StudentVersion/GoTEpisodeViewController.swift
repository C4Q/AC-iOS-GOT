//
//  GoTEpisodeViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/4/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GoTEpisodeViewController: UIViewController {

    
    @IBOutlet weak var bigImage: UIImageView!
    
    @IBOutlet weak var episodeTitle: UILabel!
    
    @IBOutlet weak var season: UILabel!
    
    @IBOutlet weak var episode: UILabel!
    
    @IBOutlet weak var runTime: UILabel!
   
    
    @IBOutlet weak var airDate: UILabel!
    
    @IBOutlet weak var summary: UITextView!
    
    var myEpisode: GOTEpisode?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let myEpisode = myEpisode else {
            return
        }
        bigImage.image = UIImage(named: myEpisode.mediumImageID)
        episodeTitle.text = myEpisode.name
        season.text = "Season \(myEpisode.season)"
        episode.text = "Episode \(myEpisode.number)"
        runTime.text = "RunTime \(myEpisode.runtime)"
        airDate.text = "AirDate \(myEpisode.airdate)"
        summary.text = myEpisode.summary

        // Do any additional setup after loading the view.
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
