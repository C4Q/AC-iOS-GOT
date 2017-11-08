//
//  EpisodesViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class EpisodesViewController: UIViewController {
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeSeasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var episdoeRuntimeLabel: UILabel!
    @IBOutlet weak var episodeAirDateLabel: UILabel!
    @IBOutlet weak var episodeDescriptionTextView: UITextView!
    
    var episodes: GOTEpisode? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let episodes = episodes else{
            return
    }
     
         let borderColor = UIColor.black
        
        episodeImage.image = UIImage(named: String(episodes.originalImageID))
        episodeSeasonLabel.text = "Season: \(episodes.season)"
        episodeLabel.text = episodes.name
        episdoeRuntimeLabel.text = String(episodes.runtime) + " Minutes"
        episodeAirDateLabel.text = episodes.airdate
        episodeDescriptionTextView.text = episodes.summary
        
        //For picture
    
        episodeImage.layer.cornerRadius = 10.0
        episodeImage.clipsToBounds = true
        episodeImage.layer.borderColor = borderColor.cgColor
        episodeImage.layer.borderWidth = 1.0
        
        
        //For text view
        episodeDescriptionTextView.layer.borderWidth = 1.0
        episodeDescriptionTextView.layer.borderColor = borderColor.cgColor
        episodeDescriptionTextView.layer.shadowColor = UIColor.black.cgColor
        episodeDescriptionTextView.layer.shadowRadius = 1.0
        episodeDescriptionTextView.layer.shadowOpacity = 1.0
        episodeDescriptionTextView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        episodeDescriptionTextView.layer.cornerRadius = 10.0
        episodeDescriptionTextView.clipsToBounds = true
        
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
