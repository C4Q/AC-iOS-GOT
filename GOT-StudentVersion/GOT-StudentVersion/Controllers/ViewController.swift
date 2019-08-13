//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allEpisodes = GOTEpisode.allEpisodes
    
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
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section % 2 == 0 {
            case true:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "OddTableViewCell", for: indexPath) as? OddTableViewCell {
                    cell.oddTitleLabel?.text = allEpisodes[indexPath.row].name
                    cell.oddSeasonEpLabel?.text = "S: \(allEpisodes[indexPath.row].season) E: \(allEpisodes[indexPath.row].number)"
                    cell.oddImage.image = UIImage(named: allEpisodes[indexPath.row].originalImageID)
                }
            case false:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "EvenTableViewCell", for: indexPath) as? EvenTableViewCell {
                    cell.evenTitleLabel?.text = allEpisodes[indexPath.row].name
                    cell.evenSeasonEpLabel?.text = "S: \(allEpisodes[indexPath.row].season) E: \(allEpisodes[indexPath.row].number)"
                    cell.evenImage.image = UIImage(named: allEpisodes[indexPath.row].originalImageID)
                }
        }
        return UITableViewCell()
    }
    
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
    }
    
}
