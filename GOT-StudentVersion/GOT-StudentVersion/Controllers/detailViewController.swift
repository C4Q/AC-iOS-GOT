//
//  detailViewController.swift
//  GOT-StudentVersion
//
//  Created by Anthony Gonzalez on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation
import UIKit

class detailViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UITextView!
    
    @IBOutlet weak var imagePreview: UIImageView!
    
    @IBOutlet weak var seasonLabel: UILabel!
    
    @IBOutlet weak var episodeLabel: UILabel!
    
    @IBOutlet weak var runtimeLabel: UILabel!
    
    @IBOutlet weak var airDateLabel: UILabel!
    
    @IBOutlet weak var episodeNameLabel: UILabel!
    
    @IBAction func backButtonPress(_ sender: Any) {
        performSegue(withIdentifier: "backToTable", sender: self)
    }
   
    var myCurrentGOTEpisode: GOTEpisode!
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func viewDidLoad() {
        
        switch myCurrentGOTEpisode.season {
        case 1: backgroundImage.image = UIImage (named: "season1")
        case 2: backgroundImage.image = UIImage (named: "season2")
        case 3: backgroundImage.image = UIImage (named: "season3")
        case 4: backgroundImage.image = UIImage (named: "season4")
        default: ()
        }
        descriptionLabel.text = "\(myCurrentGOTEpisode.summary)"
        descriptionLabel.sizeToFit()
        imagePreview.image = myCurrentGOTEpisode.getBigImage()
        seasonLabel.text = "Season: \(myCurrentGOTEpisode.season)"
        episodeLabel.text = "Episode: \(myCurrentGOTEpisode.number)"
        runtimeLabel.text = "Runtime: \(myCurrentGOTEpisode.runtime) mins"
        airDateLabel.text = "Airdate: \(myCurrentGOTEpisode.airdate)"
        
        imagePreview.layer.cornerRadius = imagePreview.frame.height / 3.5
        imagePreview.layer.borderColor = UIColor.white.cgColor
        imagePreview.layer.borderWidth = 2.5
        super.viewDidLoad()
        
        let attrString = NSAttributedString(string: myCurrentGOTEpisode.name, attributes: [NSAttributedStringKey.strokeColor: UIColor.white, NSAttributedStringKey.foregroundColor: UIColor.yellow, NSAttributedStringKey.strokeWidth: -4.0, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20.0)])
        episodeNameLabel.attributedText = attrString
        self.navigationController?.isNavigationBarHidden = false
    
    }
}
