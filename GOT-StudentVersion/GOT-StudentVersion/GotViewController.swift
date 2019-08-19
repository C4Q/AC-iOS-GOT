//
//  GotViewController.swift
//  GOT-StudentVersion
//
//  Created by EricM on 8/19/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class GotViewController: UIViewController {
    var GoT : GOTEpisode!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var newSeason: UILabel!
    @IBOutlet weak var newEpisode: UILabel!
    @IBOutlet weak var newRun: UILabel!
    @IBOutlet weak var airDate: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // used text coalescing to make it appear nicer
        image2.image = UIImage(named: GoT.originalImageID)
        newSeason.text = "Season: \(GoT.season)"
        newEpisode.text = "Episode: \(GoT.number)"
        newRun.text = "Run Time: \(GoT.runtime)"
        airDate.text = "Air Date: \(GoT.airdate)"
        textView.text = GoT.summary
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
