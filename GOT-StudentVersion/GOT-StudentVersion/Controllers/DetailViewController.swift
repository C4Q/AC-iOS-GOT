//
//  DetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Eric Widjaja on 8/18/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: ViewController {

    
    var detailGOT: GOTEpisode!
    
    @IBOutlet var detailTitleLabel: UILabel!
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detailSeasonLabel: UILabel!
    @IBOutlet var detailEpisodeLabel: UILabel!
    @IBOutlet var detailRunningTime: UILabel!
    @IBOutlet var detailAirTime: UILabel!
    @IBOutlet var detailDescription: UITextView!
    
    
    
    private  func showDetailsViewController() {
        detailImageView.image = UIImage(named: detailGOT.originalImageID)
        detailSeasonLabel.text = "Season: \(detailGOT.season.description)"
        detailEpisodeLabel.text = "Episode: \(detailGOT.number.description)"
        detailRunningTime.text = "Run Time: \(detailGOT.runtime.description)"
        detailAirTime.text = detailGOT?.airdate.description
        detailTitleLabel.text = detailGOT?.name
        detailDescription.text = detailGOT?.summary
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetailsViewController()
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
