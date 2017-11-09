//  DetailViewController.swift
//  GOT-StudentVersion
//  Created by C4Q on 11/8/17.
//  Copyright © 2017 C4Q . All rights reserved.

import UIKit

class DetailViewController: UIViewController {
	
	//Outlets
	@IBOutlet weak var episodeImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var seasonLabel: UILabel!
	@IBOutlet weak var episodeLabel: UILabel!
	@IBOutlet weak var episodeRuntime: UILabel!
	@IBOutlet weak var episodeAirdate: UILabel!
	@IBOutlet weak var episodeSummary: UITextView!
	
	var episode: GOTEpisode?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		if let currentEpisode = episode {
			episodeImageView.image = UIImage(named: currentEpisode.originalImageID)
			titleLabel.text = currentEpisode.name
			seasonLabel.text = "Season: \(currentEpisode.season)"
			episodeLabel.text = "Episode: \(currentEpisode.number)"
			episodeRuntime.text = "Runtime: \(currentEpisode.runtime)"
			episodeAirdate.text = "Airdate: \(currentEpisode.airdate!)"
			episodeSummary.text = currentEpisode.summary
		}
	}
}
