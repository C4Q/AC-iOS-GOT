//
//  DetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Alexander George Legaspi on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var got: GOTEpisode!
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailSeason: UILabel!
    @IBOutlet weak var detailEpisode: UILabel!
    @IBOutlet weak var detailRuntime: UILabel!
    @IBOutlet weak var detailAirdate: UILabel!
    @IBOutlet weak var detailDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImage.image = UIImage(named: got.originalImageID)
        detailTitle.text = got.name
        detailSeason.text = "Season: \(got.season)"
        detailEpisode.text = "Episode: \(got.number)"
        detailRuntime.text = "Runtime \(got.runtime)"
        detailAirdate.text = "Airdate: \(got.airdate)"
        detailDescription.text = got.summary

        // Do any additional setup after loading the view.
    }
    

}
