//
//  GoTDetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Radharani Ribas-Valongo on 9/4/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class GoTDetailViewController: UIViewController {

    
    //MARK: - Properties
    var episode: GOTEpisode!
    @IBOutlet weak var GOTImage: UIImageView!
    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airtimeLabel: UILabel!
    @IBOutlet weak var episodeDescription: UITextView!
    
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    func setUpView() {
        GOTImage.image = UIImage(named: episode.mediumImageID)
        episodeTitleLabel.text = episode.name
        seasonLabel.text = "Season: \(episode.season.description)"
        episodeLabel.text = "Episode: \(episode.number.description)"
        runtimeLabel.text = "Runtime: \(episode.runtime)"
        airtimeLabel.text = "Airdate: \(episode.airdate)"
        episodeDescription.text = episode.summary
        episodeDescription.font = UIFont.systemFont(ofSize: 17)
    }
}
