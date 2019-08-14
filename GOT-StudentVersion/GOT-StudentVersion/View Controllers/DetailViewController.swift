//
//  DetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Mr Wonderful on 8/11/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
 
    var gotEpisode: GOTEpisode!
    
    @IBOutlet var detailTitleLabel: UILabel!
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detailSeasonLabel: UILabel!
    @IBOutlet var detailEpisodeLabel: UILabel!
    @IBOutlet var detailRunningTime: UILabel!
    @IBOutlet var detailAirTime: UILabel!
    
    @IBOutlet var detailDiscription: UITextView!
  private  func loadDetailsToViewController(){
        detailImageView.image = UIImage(named: gotEpisode.originalImageID)
        detailSeasonLabel.text = "Season: \(gotEpisode.season)"
        detailEpisodeLabel.text = "Episode: \(gotEpisode.number)"
        detailRunningTime.text = "Run Time: \(gotEpisode.runtime)"
        detailAirTime.text = gotEpisode.airdate
        detailTitleLabel.text = gotEpisode.name
        detailDiscription.text = gotEpisode.summary
    }
    override func viewDidLoad() {
        super.viewDidLoad()
loadDetailsToViewController()
        
        
    }
}
