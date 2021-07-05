//
//  EpisodeDetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Lisa J on 11/9/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    var episode : GOTEpisode? 
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailEpTitle: UILabel!
    
    @IBOutlet weak var seasonLabel: UILabel!
    
    @IBOutlet weak var epLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
   
    @IBOutlet weak var airdateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        guard let episode = episode else {
//            return
//        }
        //detailEpTitle.text = episode.name
    
        loadEpisodeDetail()
        
    }
//    episodeArr
    func loadEpisodeDetail() {
        detailImageView.image = UIImage(named: episode!.originalImageID)
        detailEpTitle.text = episode!.name
        seasonLabel.text = "Season: " + String(episode!.season)
        epLabel.text = "Episode " + String(episode!.number)
        runtimeLabel.text = "Runtime: " + String(episode!.runtime) + " minutes"
        airdateLabel.text = "Airdate: " + String(episode!.airdate)
        summaryLabel.text = episode!.summary
        
        
        //        print(detailImageView.image!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
