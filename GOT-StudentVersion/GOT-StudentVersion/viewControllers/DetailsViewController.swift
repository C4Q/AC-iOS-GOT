//
//  DetailsViewController.swift
//  GOT-StudentVersion
//
//  Created by Tia Lendor on 8/19/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var episodeDetails: GOTEpisode!

//    MARK -- Outlets and Labels
    
    @IBOutlet weak var detailedImageView: UIImageView!
    
    @IBOutlet weak var seasonLabel: UILabel!
    
    @IBOutlet weak var episodeLabel: UILabel!
    
    @IBOutlet weak var runtimeLabel: UILabel!
    
    @IBOutlet weak var airdateLabel: UILabel!
    
    @IBOutlet weak var detailedTextView: UITextView!
    
    @IBOutlet weak var episodeNumberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailedImageView.image = UIImage(named: episodeDetails.originalImageID)
        
        seasonLabel.text = "Season: \(episodeDetails.season)"
        
        episodeLabel.text = episodeDetails.name
        
        runtimeLabel.text = "Runtime: \(episodeDetails.runtime)"
        
        airdateLabel.text = "Airdate \(episodeDetails.airdate)"
        
        detailedTextView.text = episodeDetails.summary
        
        episodeNumberLabel.text = "Episode \(episodeDetails.number)"
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
