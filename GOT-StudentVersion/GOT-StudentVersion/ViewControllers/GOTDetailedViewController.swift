//
//  GOTDetailedViewController.swift
//  GOT-StudentVersion
//
//  Created by Luis Calle on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTDetailedViewController: UIViewController {

    @IBOutlet weak var episodeSummary: UITextView!
    @IBOutlet weak var episodeAirdate: UILabel!
    @IBOutlet weak var episodeRuntime: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var episodeSeason: UILabel!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var episodeImage: UIImageView!
    
    var episodeGOT: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let episodeGOT = episodeGOT else {
            return
        }
        self.episodeName.text = episodeGOT.name
        self.episodeSeason.text = "Season: \(String(episodeGOT.season))"
        self.episodeNumber.text = "Episode: \(String(episodeGOT.number))"
        self.episodeRuntime.text = "Runtime: \(String(episodeGOT.runtime))"
        self.episodeAirdate.text = "Airdate: \(episodeGOT.airdate)"
        self.episodeSummary.text = episodeGOT.summary
        self.episodeSummary.backgroundColor = UIColor.clear
        self.episodeImage.image = UIImage(named: episodeGOT.originalImageID)
        /*
        https://stackoverflow.com/questions/46475446/best-practices-to-add-background-image-in-all-viewcontrollers-swift-ios-11
         used this as reference in order to add background picture for each season respectively
        */
        let seasonBG = UIImageView()
        seasonBG.image = UIImage(named: "season\(episodeGOT.season)")
        seasonBG.frame = view.bounds
        seasonBG.contentMode = .scaleAspectFill
        seasonBG.clipsToBounds = true
        view.insertSubview(seasonBG, at: 0)
    }
    
    /*
     https://stackoverflow.com/questions/28053140/uitextview-is-not-scrolled-to-top-when-loaded
     used this link to fix the TextView text not being in place
    */
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.episodeSummary.setContentOffset(CGPoint.zero, animated: false)
    }
    
}
