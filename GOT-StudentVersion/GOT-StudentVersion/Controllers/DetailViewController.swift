//
//  DetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Eric Widjaja on 8/18/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var detailGOTEpisode: GOTEpisode!
    
    @IBOutlet var detailTitleLabel: UILabel!
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detailSeasonLabel: UILabel!
    @IBOutlet var detailEpisodeLabel: UILabel!
    @IBOutlet var detailRunningTime: UILabel!
    @IBOutlet var detailAirTime: UILabel!
    @IBOutlet var detailDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        guard let detailGOTEpisode = detailGOTEpisode
//            else { return }
        detailImageView.image = UIImage(named: detailGOTEpisode.mediumImageID)
        detailTitleLabel.text = detailGOTEpisode.name
        detailSeasonLabel.text = "Season: \(detailGOTEpisode.season)"
        detailEpisodeLabel.text = "Episode: \(detailGOTEpisode.number)"
        detailRunningTime.text = "Running Time: \(detailGOTEpisode.runtime)"
        detailAirTime.text = "Air Date: \(detailGOTEpisode.airdate)"
        detailDescription.text = detailGOTEpisode.summary

    }
}
    

    
    // Do any additional setup after loading the view.
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
