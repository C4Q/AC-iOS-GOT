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
        return GOTEpisode.gotEpisodeDirectory[section]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return populateCell(indexPath: indexPath, season: GOTEpisode.gotEpisodeDirectory[indexPath.section]!)
    }
    
    //MARK: -- Custom Methods
    func populateCell(indexPath: IndexPath, season: [GOTEpisode]) -> UITableViewCell {
        if indexPath.section % 2 != 0 {
            if let evenCell = gotTableView.dequeueReusableCell(withIdentifier: "evenSeasons", for: indexPath) as? EvenSeasonsTableViewCell {
                evenCell.evenSeasonsImageView.image = UIImage(named: season[indexPath.row].originalImageID)
                evenCell.evenSeasonsTitleLabel?.text = season[indexPath.row].name
                evenCell.evenSeasonsEpisodeLabel?.text = "S:\(season[indexPath.row].season) E:\(season[indexPath.row].number)"
                return evenCell
            }
        } else if indexPath.section % 2 == 0 {
            if let oddCell = gotTableView.dequeueReusableCell(withIdentifier: "oddSeasons", for: indexPath) as? OddSeasonsTableViewCell {
                oddCell.oddSeasonsImageView.image = UIImage(named: season[indexPath.row].originalImageID)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let oddCell = sender as? OddSeasonsTableViewCell {
            if segue.identifier == "oddCellDetails" {
                let detailViewController = segue.destination as! DetailViewController
                let cellIndexPath = gotTableView.indexPath(for: oddCell)!
                detailViewController.gotEpisode = GOTEpisode.gotEpisodeDirectory[cellIndexPath.section]![cellIndexPath.row]
            }
        } else if let evenCell = sender as? EvenSeasonsTableViewCell {
            if segue.identifier == "evenCellDetails" {
                let detailViewController = segue.destination as! DetailViewController
                let cellIndexPath = gotTableView.indexPath(for: evenCell)!
                detailViewController.gotEpisode = GOTEpisode.gotEpisodeDirectory[cellIndexPath.section]![cellIndexPath.row]
            }
        }
    }
}

