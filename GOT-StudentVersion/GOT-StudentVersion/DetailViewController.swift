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
    
    var episodeTitle = ""
    
    var seasonNumber = ""
    
    var episodeNumber = ""
    
    var episodeRunTime = ""
    
    var episodeAirDate = ""
    
    var episodeSummary = ""
    
    var episodeImageID = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gotEpisodeTitleLabel.text = episodeTitle
        gotSeasonNumberLabel.text = seasonNumber
        gotEpisodeNumberLabel.text = episodeNumber
        gotEpisodeRuntimeLabel.text = episodeRunTime
        gotEpisodeAirDate.text = episodeAirDate
        gotEpisodeSummary.text = episodeSummary
        if let gotEpisodeImage = UIImage(named: episodeImageID) {
            gotEpisodeImageView.image = gotEpisodeImage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
