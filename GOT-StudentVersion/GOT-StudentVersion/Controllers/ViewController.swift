//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let seasonOne = GOTEpisode.seasonOne
    let seasonTwo = GOTEpisode.seasonTwo
    let seasonThree = GOTEpisode.seasonThree
    let seasonFour = GOTEpisode.seasonFour
    let seasonFive = GOTEpisode.seasonFive
    let seasonSix = GOTEpisode.seasonSix
    let seasonSeven = GOTEpisode.seasonSeven
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    tableView.dataSource = self
    tableView.delegate = self
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == ""
    }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0:
                return "Season One"
            case 1:
                return "Season Two"
            case 2:
                return "Season Three"
            case 3:
                return "Season Four"
            case 4:
                return "Season Five"
            case 5:
                return "Season Six"
            case 6:
                return "Season Seven"
            default:
                return "N/A"
        }
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
            if let cell = tableView.dequeueReusableCell(withIdentifier: "EvenTableViewCell", for: indexPath) as? EvenTableViewCell {
                cell.evenTitleLabel?.text = seasonOne[indexPath.row].name
                cell.evenSeasonEpLabel?.text = "S: \(seasonOne[indexPath.row].season) E: \(seasonOne[indexPath.row].number)"
                cell.evenImage.image = UIImage(named: seasonOne[indexPath.row].originalImageID)
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "OddTableViewCell", for: indexPath) as? OddTableViewCell {
                cell.oddTitleLabel?.text = seasonTwo[indexPath.row].name
                cell.oddSeasonEpLabel?.text = "S: \(seasonTwo[indexPath.row].season) E: \(seasonTwo[indexPath.row].number)"
                cell.oddImage.image = UIImage(named: seasonTwo[indexPath.row].originalImageID)
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "EvenTableViewCell", for: indexPath) as? EvenTableViewCell {
                cell.evenTitleLabel?.text = seasonThree[indexPath.row].name
                cell.evenSeasonEpLabel?.text = "S: \(seasonThree[indexPath.row].season) E: \(seasonThree[indexPath.row].number)"
                cell.evenImage.image = UIImage(named: seasonThree[indexPath.row].originalImageID)
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "OddTableViewCell", for: indexPath) as? OddTableViewCell {
                cell.oddTitleLabel?.text = seasonFour[indexPath.row].name
                cell.oddSeasonEpLabel?.text = "S: \(seasonFour[indexPath.row].season) E: \(seasonFour[indexPath.row].number)"
                cell.oddImage.image = UIImage(named: seasonFour[indexPath.row].originalImageID)
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "EvenTableViewCell", for: indexPath) as? EvenTableViewCell {
                cell.evenTitleLabel?.text = seasonFive[indexPath.row].name
                cell.evenSeasonEpLabel?.text = "S: \(seasonFive[indexPath.row].season) E: \(seasonFive[indexPath.row].number)"
                cell.evenImage.image = UIImage(named: seasonFive[indexPath.row].originalImageID)
                return cell
            }
        case 5:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "OddTableViewCell", for: indexPath) as? OddTableViewCell {
                cell.oddTitleLabel?.text = seasonSix[indexPath.row].name
                cell.oddSeasonEpLabel?.text = "S: \(seasonSix[indexPath.row].season) E: \(seasonSix[indexPath.row].number)"
                cell.oddImage.image = UIImage(named: seasonSix[indexPath.row].originalImageID)
                return cell
            }
        case 6:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "EvenTableViewCell", for: indexPath) as? EvenTableViewCell {
                cell.evenTitleLabel?.text = seasonSeven[indexPath.row].name
                cell.evenSeasonEpLabel?.text = "S: \(seasonSeven[indexPath.row].season) E: \(seasonSeven[indexPath.row].number)"
                cell.evenImage.image = UIImage(named: seasonSeven[indexPath.row].originalImageID)
                return cell
            }
        default:
            UITableViewCell()
        }
        return UITableViewCell()
    }
    
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
    }
    
}
