//
//  DetailedViewController.swift
//  GOT-StudentVersion
//
//  Created by Richard Crichlow on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    var detailedEpisode: GOTEpisode?
    
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airdateLabel: UILabel!
    @IBOutlet weak var episodeDescriptionTextview: UITextView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    func randomBackground() {
        let randomInt = Int(arc4random_uniform(9))
        switch randomInt {
        case 1:
            backgroundImage.image = #imageLiteral(resourceName: "gameofthrones-aryahound")
        case 2:
            backgroundImage.image = #imageLiteral(resourceName: "gameofthrones-bensenstark")
        case 3:
            backgroundImage.image = #imageLiteral(resourceName: "gameofthrones-boltonbanner")
        case 4:
            backgroundImage.image = #imageLiteral(resourceName: "gameofthrones-greyjoybanner")
        case 5:
            backgroundImage.image = #imageLiteral(resourceName: "gameofthrones-lannisterbanner")
        case 6:
            backgroundImage.image = #imageLiteral(resourceName: "gameofthrones-martellbanner")
        case 7:
            backgroundImage.image = #imageLiteral(resourceName: "gameofthrones-nightswatch")
        case 8:
            backgroundImage.image = #imageLiteral(resourceName: "gameofthrones-starkbanner")
        case 9:
            backgroundImage.image = #imageLiteral(resourceName: "gameofthrones-targaryenbanner")
        default:
            backgroundImage.image = #imageLiteral(resourceName: "gameofthrones-nedstark")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let detailedEpisode = detailedEpisode else {
            return
        }//This is to make sure there is an episode to show details for
        
        episodeImageView.image = UIImage(named: detailedEpisode.originalImageID)
        episodeTitle.text = detailedEpisode.name
        seasonLabel.text = "Season \(detailedEpisode.season)"
        episodeNumberLabel.text = "Episode \(detailedEpisode.number)"
        runtimeLabel.text = "Runtime \(detailedEpisode.runtime)"
        airdateLabel.text = "Airdate \(detailedEpisode.airdate)"
        episodeDescriptionTextview.text = detailedEpisode.summary
        randomBackground()
        
    }

}
