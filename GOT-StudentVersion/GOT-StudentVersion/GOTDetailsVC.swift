//
//  GOTDetailsVC.swift
//  GOT-StudentVersion
//
//  Created by Krystal Campbell on 8/16/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class GOTDetailsVC: UIViewController {
    
    var gotEpisodeDetail:GOTEpisode!

    @IBOutlet weak var EpisodeImage: UIImageView!
    
    @IBOutlet weak var EpisodeName: UILabel!
//
    @IBOutlet weak var EpisodeNum: UILabel!
    
    @IBOutlet weak var Runtime: UILabel!
    
    @IBOutlet weak var Airdate: UILabel!
    
    @IBOutlet weak var EpisodeInfo: UITextView!
    
    @IBOutlet weak var SeasonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        EpisodeName.text = gotEpisodeDetail.name
        EpisodeImage.image = UIImage (named: String(gotEpisodeDetail.originalImageID))
        SeasonLabel.text = "Season: \(String(gotEpisodeDetail.season.description))"
        EpisodeNum.text = "Episode:  \(String(gotEpisodeDetail.number.description))"
        Runtime.text = "Runtime: \(String(gotEpisodeDetail.runtime.description))"
        Airdate.text = "Airdate: \(String(gotEpisodeDetail.airdate))"
        EpisodeInfo.text = gotEpisodeDetail.summary
        
        
        
        // Do any additional setup after loading the view.
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
