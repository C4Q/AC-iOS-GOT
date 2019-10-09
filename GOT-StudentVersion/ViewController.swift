//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
  

  @IBOutlet weak var GOTTableView: UITableView!
  
  let seasonOne = GOTEpisode.seasonOneEpisodes
  let seasonTwo = GOTEpisode.seasonTwoEpisodes
  let seasonThree = GOTEpisode.seasonThreeEpisodes
  let seasonFour = GOTEpisode.seasonFourEpisodes
  let seasonFive = GOTEpisode.seasonFiveEpisodes
  let seasonSix = GOTEpisode.seasonSixEpisodes
  let seasonSeven = GOTEpisode.seasonSevenEpisodes
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Season \(section + 1)"
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return seasonOne.count
    case 1:
      return seasonTwo.count
    case 2:
      return seasonThree.count
    case 3:
      return seasonFour.count
    case 4:
      return seasonFive.count
    case 5:
      return seasonSix.count
    case 6:
      return seasonSeven.count
    default:
      return 0
    }
  }

  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      if let cell = GOTTableView.dequeueReusableCell(withIdentifier: "oddSeason", for: indexPath) as? EpisodeTableViewCell {
      cell.episodeTitleLabel.text = seasonOne[indexPath.row].name
      cell.seasonEpisodeLabel.text = "S:1 E:\(seasonOne[indexPath.row].number)"
        cell.episodeImageView.image = seasonOne[indexPath.row].getImage()
      return cell
      }
    case 1:
      if let cell = GOTTableView.dequeueReusableCell(withIdentifier: "evenSeason", for: indexPath) as? EpisodeTableViewCell {
        cell.episodeTitleLabel.text = seasonTwo[indexPath.row].name
        cell.seasonEpisodeLabel.text = "S:2 E:\(seasonTwo[indexPath.row].number)"
        cell.episodeImageView.image = seasonTwo[indexPath.row].getImage()
        return cell
      }
    case 2:
      if let cell = GOTTableView.dequeueReusableCell(withIdentifier: "oddSeason", for: indexPath) as? EpisodeTableViewCell {
        cell.episodeTitleLabel.text = seasonThree[indexPath.row].name
        cell.seasonEpisodeLabel.text = "S:3 E:\(seasonThree[indexPath.row].number)"
        cell.episodeImageView.image = seasonThree[indexPath.row].getImage()
        return cell
      }
    case 3:
      if let cell = GOTTableView.dequeueReusableCell(withIdentifier: "evenSeason", for: indexPath) as? EpisodeTableViewCell {
        cell.episodeTitleLabel.text = seasonFour[indexPath.row].name
        cell.seasonEpisodeLabel.text = "S:4 E:\(seasonFour[indexPath.row].number)"
        cell.episodeImageView.image = seasonFour[indexPath.row].getImage()
        return cell
      }
    case 4:
      if let cell = GOTTableView.dequeueReusableCell(withIdentifier: "oddSeason", for: indexPath) as? EpisodeTableViewCell {
        cell.episodeTitleLabel.text = seasonFive[indexPath.row].name
        cell.seasonEpisodeLabel.text = "S:5 E:\(seasonFive[indexPath.row].number)"
        cell.episodeImageView.image = seasonFive[indexPath.row].getImage()
        return cell
      }
    case 5:
      if let cell = GOTTableView.dequeueReusableCell(withIdentifier: "evenSeason", for: indexPath) as? EpisodeTableViewCell {
        cell.episodeTitleLabel.text = seasonSix[indexPath.row].name
        cell.seasonEpisodeLabel.text = "S:6 E:\(seasonSix[indexPath.row].number)"
        cell.episodeImageView.image = seasonSix[indexPath.row].getImage()
        return cell
      }
    case 6:
      if let cell = GOTTableView.dequeueReusableCell(withIdentifier: "oddSeason", for: indexPath) as? EpisodeTableViewCell {
        cell.episodeTitleLabel.text = seasonSeven[indexPath.row].name
        cell.seasonEpisodeLabel.text = "S:7 E:\(seasonSeven[indexPath.row].number)"
        cell.episodeImageView.image = seasonSeven[indexPath.row].getImage()
        return cell
      }
    default:
      break
    }
    return UITableViewCell()
  }
  
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
  
  
   func numberOfSections(in tableView: UITableView) -> Int {
    return 7
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      GOTTableView.delegate = self
      GOTTableView.dataSource = self
    }

  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let tappedEpisode: EpisodeTableViewCell = sender as? EpisodeTableViewCell {
      if segue.identifier == "EpisodeDetailViewSeque" {
        let episodeDetailViewController: EpisodeDetailsViewController = segue.destination as! EpisodeDetailsViewController
        let cellIndexPath = GOTTableView.indexPathForSelectedRow?.row
      }
    }
  }
  
  
  
//  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    guard let segueIdentifier = segue.identifier
//      else { fatalError("No identifier in segue")}
//    switch segueIdentifier {
//    case "EpisodeDetailViewSegue":
//      guard let EpisodeDetails = segue.destination as? EpisodeDetailsViewController else {
//        fatalError()
//        guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
//          fatalError("No row selected")
//        }
//        EpisoDetails.name =
//      }
//    }

  
//  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    guard let indexPath = GOTTableView.indexPathForSelectedRow,
//      let detailVC = segue.destination as? EpisodeDetailsViewController else { return }
//    let episode = GOTEpisode.allEpisodes[indexPath.section][indexPath.row]
//    detailVC.delegate = episode
//  }


}

