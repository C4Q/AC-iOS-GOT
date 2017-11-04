//
//  DetailedViewController.swift
//  GOT-StudentVersion
//
//  Created by Richard Crichlow on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    var detailedEpisode: GOTEpisode?
    
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airdateLabel: UILabel!
    @IBOutlet weak var episodeDescriptionTextview: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let detailedEpisode = detailedEpisode else {
            return
        }//This is to make sure there is an episode to show details for
        
        episodeImageView.image = UIImage(named: detailedEpisode.originalImageID)
        episodeTitle.text = detailedEpisode.name
        seasonLabel.text = "Season \(detailedEpisode.season)"
        episodeNumberLabel.text = "Episode \(detailedEpisode.number)"
        runtimeLabel.text = "Runtime \(detailedEpisode.runtime)"
        airdateLabel.text = "Airdate \(detailedEpisode.airdate)"
        episodeDescriptionTextview.text = detailedEpisode.summary
        
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
