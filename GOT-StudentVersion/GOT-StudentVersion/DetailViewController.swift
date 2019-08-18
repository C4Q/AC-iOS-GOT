//
//  DetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Jason Ruan on 8/18/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var gotEpisode: GOTEpisode!
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeTItleLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews() {
        episodeImage.image = UIImage(named: gotEpisode.originalImageID)
        episodeTItleLabel.text = gotEpisode.name
        seasonLabel.text = "Season \(gotEpisode.season)"
        episodeLabel.text = "Episode \(gotEpisode.number)"
        runtimeLabel.text = "Runtime: \(gotEpisode.runtime)"
        airDateLabel.text = "Air Date: \(gotEpisode.airdate)"
        descriptionTextView.text = gotEpisode.summary
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
