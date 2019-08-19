//
//  DetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Alyson Abril on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var gotEpisodeImage: UIImageView!
    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var seasonNumLabel: UILabel!
    @IBOutlet weak var episodeNumLabel: UILabel!
    
    @IBOutlet weak var episodeRuntimeLabel: UILabel!
    @IBOutlet weak var airdateLabel: UILabel!
    @IBOutlet weak var episodeSummaryTextView: UITextView!
    
    var gotData: GOTEpisode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 12/255, green: 29/255, blue: 66/255, alpha: 1)
        updateGotUI()
    }
    
    private func updateGotUI() {
        gotEpisodeImage.image = UIImage(named: (gotData.originalImageID))
        episodeNameLabel.textColor = .white
        episodeNameLabel.text = gotData.name
        
        seasonNumLabel.textColor = .lightText
        seasonNumLabel.text = "Season: \(gotData.season)"
        
        episodeNumLabel.textColor = .lightText
        episodeNumLabel.text = "Episode: \(gotData.number)"
        
        episodeRuntimeLabel.textColor = .lightText
        episodeRuntimeLabel.text = "Runtime: \(gotData.runtime) minutes"
        
        airdateLabel.textColor = .lightText
        airdateLabel.text = "Air Date: \(gotData.airdate)"
        episodeSummaryTextView.text = gotData.summary
        
    }

}
