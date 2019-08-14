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
    let seasonOne = GOTEpisode.seasonOne
    let seasonTwo = GOTEpisode.seasonTwo
    let seasonThree = GOTEpisode.seasonThree
    let seasonFour = GOTEpisode.seasonFour
    let seasonFive = GOTEpisode.seasonFive
    let seasonSix = GOTEpisode.seasonSix
    let seasonSeven = GOTEpisode.seasonSeven
    
    

    @IBOutlet weak var tableViewOutlet: UITableView!
    
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
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as? GOTTableViewCell {
                cell.topLabel.text = seasonOne[indexPath.row].name
                cell.bottomLabel.text = seasonOne[indexPath.row].description
                cell.imageOutlet.image = seasonOne[indexPath.row].getImage()
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell2", for: indexPath) as? GOTTableViewCell {
                cell.topLabel.text = seasonTwo[indexPath.row].name
                cell.bottomLabel.text = seasonTwo[indexPath.row].description
                cell.imageOutlet.image = seasonTwo[indexPath.row].getImage()
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as? GOTTableViewCell {
                cell.topLabel.text = seasonThree[indexPath.row].name
                cell.bottomLabel.text = seasonThree[indexPath.row].description
                cell.imageOutlet.image = seasonThree[indexPath.row].getImage()
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell2", for: indexPath) as? GOTTableViewCell {
                cell.topLabel.text = seasonFour[indexPath.row].name
                cell.bottomLabel.text = seasonFour[indexPath.row].description
                cell.imageOutlet.image = seasonFour[indexPath.row].getImage()
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as? GOTTableViewCell {
                cell.topLabel.text = seasonFive[indexPath.row].name
                cell.bottomLabel.text = seasonFive[indexPath.row].description
                cell.imageOutlet.image = seasonFive[indexPath.row].getImage()
                return cell
            }
        case 5:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell2", for: indexPath) as? GOTTableViewCell {
                cell.topLabel.text = seasonSix[indexPath.row].name
                cell.bottomLabel.text = seasonSix[indexPath.row].description
                cell.imageOutlet.image = seasonSix[indexPath.row].getImage()
                return cell
            }
        case 6:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as? GOTTableViewCell {
                cell.topLabel.text = seasonSeven[indexPath.row].name
                cell.bottomLabel.text = seasonSeven[indexPath.row].description
                cell.imageOutlet.image = seasonSeven[indexPath.row].getImage()
                return cell
            }
        default:
            return UITableViewCell()
        }
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //we want to move to the vc with the storyboard ID "movieDetailViewController"
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "GOTDetailViewController") as? GOTDetailViewController {
            switch indexPath.section {
            case 0:
                viewController.gotEpisode = seasonOne[indexPath.row]
                navigationController?.pushViewController(viewController, animated: true)
            case 1:
                viewController.gotEpisode = seasonTwo[indexPath.row]
                navigationController?.pushViewController(viewController, animated: true)
            case 2:
                viewController.gotEpisode = seasonThree[indexPath.row]
                navigationController?.pushViewController(viewController, animated: true)
            case 3:
                viewController.gotEpisode = seasonFour[indexPath.row]
                navigationController?.pushViewController(viewController, animated: true)
            case 4:
                viewController.gotEpisode = seasonFive[indexPath.row]
                navigationController?.pushViewController(viewController, animated: true)
            case 5:
                viewController.gotEpisode = seasonSix[indexPath.row]
                navigationController?.pushViewController(viewController, animated: true)
            case 6:
                viewController.gotEpisode = seasonSeven[indexPath.row]
                navigationController?.pushViewController(viewController, animated: true)
            default:
                print("error")
            }
            
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

