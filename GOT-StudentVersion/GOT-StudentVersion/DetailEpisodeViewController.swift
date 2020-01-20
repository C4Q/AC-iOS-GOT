//
//  DetailEpisodeViewController.swift
//  GOT-StudentVersion
//
//  Created by Liana Norman on 8/18/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailEpisodeViewController: UIViewController {
    
    var episode: GOTEpisode!
    
    @IBOutlet weak var detailPageImage: UIImageView!
    @IBOutlet weak var detailEpisodeTitle: UILabel!
    @IBOutlet weak var detailSeasonNumber: UILabel!
    @IBOutlet weak var detailEpisodeNumber: UILabel!
    @IBOutlet weak var detailRuntime: UILabel!
    @IBOutlet weak var detailAirtime: UILabel!
    @IBOutlet weak var detailEpisodeDescript: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews() {
        detailPageImage.image = UIImage(named: episode.originalImageID)
        detailEpisodeTitle.text = episode.name
        detailSeasonNumber.text = episode.descriptionDetailSeasonNumber
        detailEpisodeNumber.text = episode.descriptionDetailEpisodeNumber
        detailRuntime.text = episode.descriptionDetailRuntime
        detailAirtime.text = episode.descriptionDetailAirtime
        detailEpisodeDescript.text = episode.summary
        
    }
}
