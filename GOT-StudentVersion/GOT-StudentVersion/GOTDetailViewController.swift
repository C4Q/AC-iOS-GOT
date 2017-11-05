//
//  GOTDetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Clint Mejia on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTDetailViewController: UIViewController {

    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var epsisodeNameTitle: UILabel!
    @IBOutlet weak var episodeSeasonTitle: UILabel!
    @IBOutlet weak var episodeNumberTitle: UILabel!
    @IBOutlet weak var episodeRuntimeTitle: UILabel!
    @IBOutlet weak var episodeAirDateTitle: UILabel!
    @IBOutlet weak var episodeDescriptionTextView: UITextView!
    
    var gotEpisodeDetails: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let gotEpisodeDetails = gotEpisodeDetails else {
            return
        }
        episodeImage.image = UIImage(named: String(gotEpisodeDetails.mediumImageID))
        epsisodeNameTitle.text = gotEpisodeDetails.name
        episodeSeasonTitle.text = "Season: \(gotEpisodeDetails.season)"
        episodeNumberTitle.text = "Episode: \(gotEpisodeDetails.number)"
        episodeRuntimeTitle.text = "Runtime: \(gotEpisodeDetails.runtime)"
        episodeAirDateTitle.text = "Airdate: \(gotEpisodeDetails.airdate)"
        episodeDescriptionTextView.text = gotEpisodeDetails.summary
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
