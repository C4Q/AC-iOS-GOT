//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: -- Outlets
    @IBOutlet weak var gotTableView: UITableView!
    
    //MARK: -- Data Source Methods
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
            return "We don't talk about that one"
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
        switch indexPath.section {
        case 0:
            return populateCell(indexPath: indexPath, season: GOTEpisode.seasonOne)
        case 1:
            return populateCell(indexPath: indexPath, season: GOTEpisode.seasonTwo)
        case 2:
            return populateCell(indexPath: indexPath, season: GOTEpisode.seasonThree)
        case 3:
            return populateCell(indexPath: indexPath, season: GOTEpisode.seasonFour)
        case 4:
            return populateCell(indexPath: indexPath, season: GOTEpisode.seasonFive)
        case 5:
            return populateCell(indexPath: indexPath, season: GOTEpisode.seasonSix)
        case 6:
            return populateCell(indexPath: indexPath, season: GOTEpisode.seasonSeven)
        default:
            return UITableViewCell()
        }
    }
    
    //MARK: -- Custom Methods
    func populateCell(indexPath: IndexPath, season: [GOTEpisode]) -> UITableViewCell {
        if indexPath.section % 2 == 0 {
            if let evenCell = gotTableView.dequeueReusableCell(withIdentifier: "evenSeasons", for: indexPath) as? EvenSeasonsTableViewCell {
                evenCell.evenSeasonsTitleLabel?.text = season[indexPath.row].name
                evenCell.evenSeasonsEpisodeLabel?.text = "S:\(season[indexPath.row].season) E:\(season[indexPath.row].number)"
                return evenCell
            }
        } else if indexPath.section % 2 != 0 {
            if let oddCell = gotTableView.dequeueReusableCell(withIdentifier: "oddSeasons", for: indexPath) as? OddSeasonsTableViewCell {
                oddCell.oddSeasonsTitleLabel?.text = season[indexPath.row].name
                oddCell.oddSeasonsEpisodeLabel?.text = "S:\(season[indexPath.row].season) E:\(season[indexPath.row].number)"
                return oddCell
            }
        }
        return UITableViewCell()
    }

    //MARK: -- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        gotTableView.dataSource = self
        gotTableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

