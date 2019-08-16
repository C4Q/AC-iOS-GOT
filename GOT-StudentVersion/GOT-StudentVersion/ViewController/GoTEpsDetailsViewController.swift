//
//  GoTEpsDetailsViewController.swift
//  GOT-StudentVersion
//
//  Created by Jocelyn Boyd on 8/14/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class GoTEpsDetailsViewController: UIViewController {
  
  var episode: GOTEpisode?

  @IBOutlet weak var detailsPageImageView: UIImageView!
  @IBOutlet weak var detailsEpsTitleLabel: UILabel!
  @IBOutlet weak var detailsSeasonNumLabel: UILabel!
  @IBOutlet weak var detailsEpsiodeNum: UILabel!
  @IBOutlet weak var detailsRuntimeLabel: UILabel!
  @IBOutlet weak var detailsAirdateLabel: UILabel!
  @IBOutlet weak var detailsSummaryTextView: UITextView!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      guard let episode = episode else { return }
      
      detailsPageImageView.image = UIImage(named: episode.mediumImageID)
      detailsEpsTitleLabel.text = "Title: \(episode.name)"
      detailsSeasonNumLabel.text = "Season \(episode.season)"
      detailsEpsiodeNum.text = "Episode \(episode.number)"
      detailsRuntimeLabel.text = "Runtime: \(episode.runtime)"
      detailsAirdateLabel.text = "Airdate: \(episode.airdate)"
      detailsSummaryTextView.text = episode.summary
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
