//
//  DetailEpisodeViewController.swift
//  GOT-StudentVersion
//
//  Created by Liana Norman on 8/18/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailEpisodeViewController: UIViewController {
    
    // MARK: - UI Objects
    @IBOutlet weak var detailPageImage: UIImageView!
    @IBOutlet weak var detailEpisodeTitle: UILabel!
    @IBOutlet weak var detailSeasonNumber: UILabel!
    @IBOutlet weak var detailEpisodeNumber: UILabel!
    @IBOutlet weak var detailRuntime: UILabel!
    @IBOutlet weak var detailAirtime: UILabel!
    @IBOutlet weak var detailEpisodeDescript: UITextView!
    
    // MARK: - Properties
    var episode: GOTEpisode!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Private Methods
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
