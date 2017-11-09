//
//  DetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Maryann Yin on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var gotEpisodeTitleLabel: UILabel!
    
    @IBOutlet var gotSeasonNumberLabel: UILabel!
    
    @IBOutlet var gotEpisodeNumberLabel: UILabel!
    
    @IBOutlet var gotEpisodeRuntimeLabel: UILabel!
    
    @IBOutlet var gotEpisodeAirDate: UILabel!
    
    @IBOutlet var gotEpisodeSummary: UILabel!
    
    @IBOutlet var gotEpisodeImageView: UIImageView!
    
    //disconnect this outlet and reconnect it as a UILabel
    
    //add the outlet for the summary
    
    //continue this pattern for the image view, season number, episode number, episode run timem, episode air date, episode summary
    //(1) declare the empty string (2) in view will appear function, set the text of the relevant label
    
    
    var GOTEpisode : GOTEpisode?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        gotEpisodeTitleLabel.text = GOTEpisode?.name
        gotSeasonNumberLabel.text = "Season: " + GOTEpisode!.season.description
        gotEpisodeNumberLabel.text = "Episode: " + GOTEpisode!.number.description
        gotEpisodeRuntimeLabel.text = "Run Time: " + GOTEpisode!.runtime.description + " minutes"
        gotEpisodeAirDate.text = "Air Date: " + GOTEpisode!.airdate
        gotEpisodeSummary.text = "Summary: " + GOTEpisode!.summary
        if let gotEpisodeImage = UIImage(named: GOTEpisode!.originalImageID) {
            gotEpisodeImageView.image = gotEpisodeImage
        }
    }
}
