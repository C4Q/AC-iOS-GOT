//
//  EpisodeDetailViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/9/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var episodeSeason: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var episodeRuntime: UILabel!
    @IBOutlet weak var episodeAirDate: UILabel!
    @IBOutlet weak var episodeSummary: UITextView!
    
    var selectedEpisode: GOTEpisode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpView()
    }

    func setUpView() {
        guard let selectedEpisode = selectedEpisode else {
            return
        }
        episodeImage.image = UIImage(named:  selectedEpisode.originalImageID)
        episodeTitle.text = selectedEpisode.name
        episodeSeason.text = "Season: \(selectedEpisode.season)"
        episodeNumber.text = "Episode: \(selectedEpisode.number)"
        episodeRuntime.text = "Runtime: \(selectedEpisode.runtime)"
        episodeAirDate.text = "Airdate: \(selectedEpisode.airdate)"
        episodeSummary.text = "\(selectedEpisode.summary)"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
