//
//  GOTDetailViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTDetailViewController: UIViewController {

    @IBOutlet weak var gotImage: UIImageView!
    @IBOutlet weak var gotTitle: UILabel!
    @IBOutlet weak var gotEpisode: UILabel!
    @IBOutlet weak var GotSeason: UILabel!
    @IBOutlet weak var gotRuntime: UILabel!
    @IBOutlet weak var gotAirdate: UILabel!
    @IBOutlet weak var gotSummary: UITextView!
    var episode: GOTEpisode?
    
    
    override func viewDidLoad() {
       
        gotImage.image = UIImage(named: (episode?.mediumImageID.description)!)
        gotTitle.text = episode?.name
        GotSeason.text = "Season: " + (episode?.season.description)!
        gotEpisode.text = "Episode: " + (episode?.number.description)!
        gotRuntime.text = "Runtime: " + (episode?.runtime.description)!
        gotAirdate.text = "Airdate: " + (episode?.airdate.debugDescription)!
        gotSummary.text = episode!.summary
        

        
    }
    
    
}
