//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   
    
    // to access static properties, use its' class
    @IBOutlet weak var GOTTableView: UITableView!
    
    
    var arrOfSeason = GOTEpisode.seasons {
        didSet {
            print("arr of seasons set")
        }
    }
    
//    var GOTSeasons = GOTEpisode.seasons {
//        didSet {
//            GOTTableView.reloadData()
//        }
//    }
    
    var episodes = GOTEpisode.allEpisodes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        GOTTableView.dataSource = self
        GOTTableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrOfSeason.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return arrOfSeason[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episode = arrOfSeason[indexPath.section][indexPath.row]
        var cellToSet = UITableViewCell()
        
        if episode.season % 2 == 0 {
        //    let episode = GOTSeasons[indexPath.section][indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "oddSeasonCellTwo", for: indexPath) as? OddSeasonTableViewCell else {
                return UITableViewCell() }
            cell.oddSeasonLabel.text = "S: \(episode.season.description)   E: \(episode.number.description)"
            cell.oddEpisodeLabel.text = episode.name
            cell.oddSeasonImage.image = UIImage(named: episode.mediumImageID)
            cellToSet = cell
        } else {
            //let episode = GOTSeasons[indexPath.section][indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "oddSeasonCell", for: indexPath) as? OddSeasonTableViewCell else {
                return UITableViewCell() }
            cell.oddSeasonLabel.text = "S: \(episode.season.description)   E: \(episode.number.description)"
            cell.oddEpisodeLabel.text = episode.name
            cell.oddSeasonImage.image = UIImage(named: episode.mediumImageID)
            cellToSet = cell
        }
        return cellToSet
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Seson \(section + 1)"
//        switch section {
//        case 0:
//            return "Season 1"
//        case 1:
//            return "Season 2"
//        case 2:
//            return "Season 3"
//        case 3:
//            return "Season 4"
//        case 4:
//            return "Season 5"
//        case 5:
//            return "Season 6"
//        case 6:
//            return "Season 7"
//        default:
//            return nil
//        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let indexPath =  GOTTableView.indexPathForSelectedRow else {return}
        let theEpisode = arrOfSeason[indexPath.section][indexPath.row]

        guard let detailedViewController = segue.destination as? DetailViewController else {return}
        
        detailedViewController.detailGOTEpisode = theEpisode
        
//        if segue.identifier == "oddSegue" {
//        let selectedEpisode = GOTSeasons[indexPath.section][indexPath.row]
//        detailedViewController.detailGOTEpisode = selectedEpisode
//        } else if segue.identifier == "evenSegue"{
//            let selectedEpisode = GOTSeasons[indexPath.section][indexPath.row]
//            detailedViewController.detailGOTEpisode = selectedEpisode
//        }
    }
}


