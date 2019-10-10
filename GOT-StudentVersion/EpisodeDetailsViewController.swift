//
//  EpisodeDetailsViewController.swift
//  GOT-StudentVersion
//
//  Created by Ian Cervone on 8/19/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class EpisodeDetailsViewController: UIViewController {

  @IBOutlet weak var detailImage: UIImageView!
  @IBOutlet weak var detailTitle: UILabel!
  @IBOutlet weak var detailSeason: UILabel!
  @IBOutlet weak var detailEpisode: UILabel!
  @IBOutlet weak var detailRuntime: UILabel!
  @IBOutlet weak var detailAirdate: UILabel!
  @IBOutlet weak var detailSummary: UILabel!
  
  var selectedEpisode: GOTEpisode!
  
  func updateViews(for movie: GOTEpisode) {
    self.detailImage.image = UIImage(named: selectedEpisode.originalImageID)!
    self.detailTitle.text = selectedEpisode.name
    self.detailSeason.text = "Season: \(selectedEpisode.number)"
    self.detailEpisode.text = "Episode: \(selectedEpisode.season)"
    self.detailRuntime.text = "RunTime: \(selectedEpisode.runtime) minutes"
    self.detailAirdate.text = "Airdate: \(selectedEpisode.airdate)"
    self.detailSummary.text = "Summary: \(selectedEpisode.summary)"
    
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
       setUpViews()
      self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fullThrone.png")!)

//        setUpFromStoryboard()
//      self.updateViews(for: selectedEpisode)
    }
  
  private func setUpViews() {
    detailTitle.text = selectedEpisode.name
    detailSeason.text = "Season: \(selectedEpisode.season)"
    detailEpisode.text = "Episode: \(selectedEpisode.number)"
    detailRuntime.text = "RunTime: \(selectedEpisode.runtime)"
    detailAirdate.text = "Date: \(selectedEpisode.airdate)"
    detailSummary.text = selectedEpisode.summary
    detailImage.image = UIImage(named: selectedEpisode.originalImageID)
  }
  
  private func setUpFromStoryboard() -> EpisodeDetailsViewController? {
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    if let viewController = storyBoard.instantiateViewController(withIdentifier: "EpisodeDetailsViewController") as? EpisodeDetailsViewController {
      return viewController
    }
    return nil
  }
  


}
