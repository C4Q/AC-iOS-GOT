//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    let gotData = GOTEpisode.allEpisodes

    @IBOutlet weak var tableViewOutlet: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return GOTEpisode.seasonOne.count
        case 1:
            return GOTEpisode.seasonTwo.count
        case 2:
            return GOTEpisode.seasonThree.count
        case 3:
            return GOTEpisode.seasonFour.count
        case 4:
            return GOTEpisode.seasonFive.count
        case 5:
            return GOTEpisode.seasonSix.count
        case 6:
            return GOTEpisode.seasonSeven.count
        default:
            return 0
        }
//        return gotData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as? GOTTableViewCell {
                cell.topLabel.text = GOTEpisode.seasonOne[indexPath.row].name
                cell.bottomLabel.text = GOTEpisode.seasonOne[indexPath.row].description
                cell.imageOutlet.image = GOTEpisode.seasonOne[indexPath.row].getImage()
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell2", for: indexPath) as? GOTTableViewCell {
                cell.topLabel.text = GOTEpisode.seasonTwo[indexPath.row].name
                cell.bottomLabel.text = GOTEpisode.seasonTwo[indexPath.row].description
                cell.imageOutlet.image = GOTEpisode.seasonTwo[indexPath.row].getImage()
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as? GOTTableViewCell {
                cell.topLabel.text = GOTEpisode.seasonThree[indexPath.row].name
                cell.bottomLabel.text = GOTEpisode.seasonThree[indexPath.row].description
                cell.imageOutlet.image = GOTEpisode.seasonThree[indexPath.row].getImage()
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell2", for: indexPath) as? GOTTableViewCell {
                cell.topLabel.text = GOTEpisode.seasonFour[indexPath.row].name
                cell.bottomLabel.text = GOTEpisode.seasonFour[indexPath.row].description
                cell.imageOutlet.image = GOTEpisode.seasonFour[indexPath.row].getImage()
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as? GOTTableViewCell {
                cell.topLabel.text = GOTEpisode.seasonFive[indexPath.row].name
                cell.bottomLabel.text = GOTEpisode.seasonFive[indexPath.row].description
                cell.imageOutlet.image = GOTEpisode.seasonFive[indexPath.row].getImage()
                return cell
            }
        case 5:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell2", for: indexPath) as? GOTTableViewCell {
                cell.topLabel.text = GOTEpisode.seasonSix[indexPath.row].name
                cell.bottomLabel.text = GOTEpisode.seasonSix[indexPath.row].description
                cell.imageOutlet.image = GOTEpisode.seasonSix[indexPath.row].getImage()
                return cell
            }
        case 6:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as? GOTTableViewCell {
                cell.topLabel.text = GOTEpisode.seasonSeven[indexPath.row].name
                cell.bottomLabel.text = GOTEpisode.seasonSeven[indexPath.row].description
                cell.imageOutlet.image = GOTEpisode.seasonSeven[indexPath.row].getImage()
                return cell
            }
        default:
            return UITableViewCell()
        }
        
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as? GOTTableViewCell {
//            cell.topLabel.text = gotData[indexPath.row].name
//            cell.bottomLabel.text = gotData[indexPath.row].description
//            cell.imageOutlet.image = gotData[indexPath.row].getImage()
//            return cell
//        }
//        return UITableViewCell()
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Season 1"
        case 1:
            return "Season 2"
        case 2:
            return "Season 3"
        case 3:
            return "Season 4"
        case 4:
            return "Season 5"
        case 5:
            return "Season 6"
        case 6:
            return "Season 7"
        default:
            return "error: season not found"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

