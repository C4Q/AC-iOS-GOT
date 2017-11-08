//
//  SummaryViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var summaryImage: UIImageView!
    @IBOutlet weak var summaryTitle: UILabel!
    @IBOutlet weak var summarySeason: UILabel!
    @IBOutlet weak var summaryEpisode: UILabel!
    @IBOutlet weak var summaryRuntime: UILabel!
    @IBOutlet weak var summaryAirdate: UILabel!
    @IBOutlet weak var summaryTextfield: UITextView!
    
    var episodeDetails: GOTEpisode? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let episode = episodeDetails else {
            return
        }
        summaryImage.image = UIImage(named: episode.mediumImageID)
        summaryTitle.text = episode.name
        summarySeason.text = "Season: \(String(episode.season))"
        summaryEpisode.text = "Episode: \(String(episode.number))"
        summaryRuntime.text = "Runtime: \(String(episode.runtime))"
        summaryAirdate.text = "Airdate: \(episode.airdate)"
        summaryTextfield.text = episode.summary
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
