//
//  DetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Sam Roman on 8/14/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selected: GOTEpisode!
    
    @IBOutlet weak var imageOut: UIImageView!
    
    @IBOutlet weak var nameOut: UILabel!
    
    @IBOutlet weak var seasonOut: UILabel!
    
    @IBOutlet weak var episodeOut: UILabel!
    
    @IBOutlet weak var runtimeOut: UILabel!
    
    @IBOutlet weak var airdateOut: UILabel!
    
    @IBOutlet weak var summaryOut: UILabel!
    
    override func viewDidLoad() {
        imageOut.image = UIImage(named: String(selected.originalImageID))
        nameOut.text = selected.name
        airdateOut.text = selected.airdate
        episodeOut.text = "Episode: \(selected.number)"
        runtimeOut.text = "Runtime: \(selected.runtime)"
        summaryOut.text = selected.summary
        seasonOut.text = "Season: \(selected.season)"
        super.viewDidLoad()

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
