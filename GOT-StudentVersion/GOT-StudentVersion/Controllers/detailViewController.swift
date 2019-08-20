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
    
    //MARK: -- Outlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var imagePreview: UIImageView!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var episodeNameLabel: UILabel!
    
    //MARK: -- Properties
    var myCurrentGOTEpisode: GOTEpisode!
    
    //MARK: -- Methods
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewLayout()
        setSeasonViewBGs()
    }
    
    private func configureViewLayout() {
        descriptionText.text = "\(myCurrentGOTEpisode.summary)"
        imagePreview.image = myCurrentGOTEpisode.getBigImage()
        seasonLabel.text = "Season: \(myCurrentGOTEpisode.season)"
        episodeLabel.text = "Episode: \(myCurrentGOTEpisode.number)"
        runtimeLabel.text = "Runtime: \(myCurrentGOTEpisode.runtime) mins"
        airDateLabel.text = "Airdate: \(myCurrentGOTEpisode.airdate)"
        
        imagePreview.layer.cornerRadius = imagePreview.frame.height / 3.5
        imagePreview.layer.borderColor = UIColor.white.cgColor
        imagePreview.layer.borderWidth = 2.5
        
        let attrString = NSAttributedString(string: myCurrentGOTEpisode.name, attributes: [NSAttributedString.Key.strokeColor: UIColor.white, NSAttributedString.Key.foregroundColor: UIColor.yellow, NSAttributedString.Key.strokeWidth: -4.0, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0)])
        episodeNameLabel.attributedText = attrString
    }
    
    
    private func setSeasonViewBGs() {
        switch myCurrentGOTEpisode.season {
        case 1: backgroundImage.image = UIImage (named: "season1")
        case 2: backgroundImage.image = UIImage (named: "season2")
        case 3: backgroundImage.image = UIImage (named: "season3")
        case 4: backgroundImage.image = UIImage (named: "season4")
        case 5: backgroundImage.image = UIImage (named: "season5")
        case 6: backgroundImage.image = UIImage (named: "season6")
        case 7: backgroundImage.image = UIImage (named: "season7")
        case 8: backgroundImage.image = UIImage (named: "season8")
        default: ()
        }
    }
}

