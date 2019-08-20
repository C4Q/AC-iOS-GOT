//
//  EpisodeDetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Jack Wong on 8/19/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var seasonTitle: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var episodeTitle: UILabel!
    
    @IBOutlet weak var summaryTextView: UITextView!
    
    var delegate: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photo.image = UIImage(named: (delegate?.originalImageID)!)
        
        episodeTitle.text = delegate?.name
        
        seasonTitle.text = " Season: \(delegate!.season)"
        episodeNumber.text = " Episode: \(delegate!.number)"
        runtimeLabel.text = " Runtime: \(delegate!.runtime)"
        airDateLabel.text = " Airdate: \(delegate!.airdate)"
        
        summaryTextView.text = delegate?.summary
    }


}
