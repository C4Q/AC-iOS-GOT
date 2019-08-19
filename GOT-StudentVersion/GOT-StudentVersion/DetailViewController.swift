//
//  DetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Kevin Natera on 8/13/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation
import UIKit

class DetailViewController : UIViewController {
    
    var gotep: GOTEpisode!
    
    
    @IBOutlet weak var gotImageOutlet: UIImageView!
    
    @IBOutlet weak var seasonLabel: UILabel!
    
    @IBOutlet weak var episodeLabel: UILabel!
    
    @IBOutlet weak var runtimeLabel: UILabel!
    
    @IBOutlet weak var airdateLabel: UILabel!
    
    @IBOutlet weak var descriptionOutlet: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gotImageOutlet.image = UIImage(named: "\(gotep.originalImageID)")
        seasonLabel.text = "Season: \(gotep.season)"
        episodeLabel.text = "Episode: \(gotep.number)"
        runtimeLabel.text = "Runtime: \(gotep.runtime)"
        airdateLabel.text = "Airdate: \(gotep.airdate)"
        descriptionOutlet.text = gotep.summary
    }
}
