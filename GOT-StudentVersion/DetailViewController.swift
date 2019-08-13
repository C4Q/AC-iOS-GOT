//
//  DetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Mr Wonderful on 8/11/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
var getImage = UIImage()
    var getTitle = String()
    var getSeason = String()
    var getEpisode = String()
    var getRunningTime = String()
    var getAirTime = String()
    var getDiscription = String()
    
    @IBOutlet var detailTitleLabel: UILabel!
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detailSeasonLabel: UILabel!
    @IBOutlet var detailEpisodeLabel: UILabel!
    @IBOutlet var detailRunningTime: UILabel!
    @IBOutlet var detailAirTime: UILabel!
    
    @IBOutlet var detailDiscription: UITextView!
    func loadDetailsToViewController(){
        detailImageView.image = getImage
        detailSeasonLabel.text = getSeason
        detailEpisodeLabel.text = getEpisode
        detailRunningTime.text = getRunningTime
        detailAirTime.text = getAirTime
        detailTitleLabel.text = getTitle
        detailDiscription.text = getDiscription
    }
    override func viewDidLoad() {
        super.viewDidLoad()
loadDetailsToViewController()
        
       detailImageView.layer.cornerRadius = detailImageView.frame.size.width/2.3
        detailImageView.clipsToBounds = true
        
        detailImageView.layer.masksToBounds = true
        
      //  detailImageView.layer.borderColor = [UIColor colorWithRed:148/255. green:79/255. blue:216/255. alpha:1.0].CGColor
       detailImageView.layer.borderWidth=3
        
    }
}
