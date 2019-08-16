//
//  GoTEpsListTableViewController.swift
//  GOT-StudentVersion
//
//  Created by Jocelyn Boyd on 8/14/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class GoTEpsListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
  
  

    // MARK: - Table view data source
  var gotInfoArr = GOTEpisode.allEpisodes
  
  var arrayOfSeason: [[GOTEpisode]]{
//    didSet {
      return makeArrayofArrays(from: GOTEpisode.allEpisodes)
//      tableView.reloadData()
//    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    guard let selectedIndexPath = tableView.indexPathForSelectedRow,
      let detailedViewController = segue.destination as? GoTEpsDetailsViewController else { return }
    
    let selectedEpisodes = arrayOfSeason[selectedIndexPath.section][selectedIndexPath.row]
    detailedViewController.episode = selectedEpisodes
    
  }
  
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
      }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      switch section % 2 {
      case 0:
        let seasonNumberOdd = section + 1
        let episodeNumberArrOdd = filterSeasonsBy(episode: gotInfoArr, andSeasonNum: seasonNumberOdd)
        return episodeNumberArrOdd.count
      case 1:
        let seasonNumberEven = section + 1
        let episodeNumberArrEven = filterSeasonsBy(episode: gotInfoArr, andSeasonNum: seasonNumberEven)
        return episodeNumberArrEven.count
      default:
        return gotInfoArr.count
      }
    }

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section % 2 {
    case 0:
      return "Season \(section + 1)"
    case 1:
      return "Season \(section + 1)"
    default:
      return "Every dies at the end."
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let customLeftCell = tableView.dequeueReusableCell(withIdentifier: "LeftImageOddSeason") as? TableViewCellLeft else {
      return UITableViewCell()
    }
    guard let customCellRight = tableView.dequeueReusableCell(withIdentifier: "RightImageEvenSeason") as? TableViewCellRight else {
      return UITableViewCell()
    }
    
    switch indexPath.section % 2 {
    case 0:
    let seasonArr0 = filterSeasonsBy(episode: gotInfoArr, andSeasonNum: indexPath.section + 1)
    let infoForLeftCell = seasonArr0[indexPath.row]
    
    customLeftCell.OddEpsTitleLabel.text = infoForLeftCell.name
    customLeftCell.OddSeasonNumberLabel.text = "S:\(infoForLeftCell.season) E:\(infoForLeftCell.number)"
    customLeftCell.leftImageView?.image = UIImage(named: infoForLeftCell.mediumImageID)
    return customLeftCell
      
    case 1:
    let seasonArr1 = filterSeasonsBy(episode: gotInfoArr, andSeasonNum: indexPath.section + 1)
    let infoForRightCell = seasonArr1[indexPath.row]
    
    customCellRight.EvenEpsTitleLabel.text = infoForRightCell.name
    customCellRight.EvenSeasonLabel.text = "S:\(infoForRightCell.season) E:\(infoForRightCell.number)"
    customCellRight.rightImageView?.image = UIImage(named: infoForRightCell.mediumImageID)
    return customCellRight
      
    default:
    return UITableViewCell()

    }
  }
  override func tableView(_ tableView: UITableView, heightForRowAt: IndexPath) -> CGFloat{
      return 120
    }
    
    
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  
      
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }




