//
//  DetailViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/8/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var detailedInfo: GOTEpisode?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
   
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var runTimeLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    
    
    var episode: GOTEpisode? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let unwrappedEpisode = detailedInfo else {
            return
        }
        imageView.image = UIImage(named: unwrappedEpisode.originalImageID)
        episodeName.text = unwrappedEpisode.name
        seasonLabel.text = "Season: \(String(unwrappedEpisode.season))"
        episodeLabel.text = "Episode: \(String(unwrappedEpisode.number))"
        runTimeLabel.text = "Run time: \(String(unwrappedEpisode.runtime))"
        airDateLabel.text = "Air Date: \(String(unwrappedEpisode.airdate))"
        descriptionTextView.text = unwrappedEpisode.summary
    }
    
}
        


//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


