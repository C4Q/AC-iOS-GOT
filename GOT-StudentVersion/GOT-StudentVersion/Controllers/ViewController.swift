//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var GOTSeasons = GOTEpisode.seasons
    
    // to access static properties, use its' class
    
    @IBOutlet weak var GOTTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GOTTableView.dataSource = self
        GOTTableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return GOTSeasons.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GOTSeasons[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section % 2 == 0 {
            let episode = GOTSeasons[indexPath.section][indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "oddSeasonCell", for: indexPath) as? OddSeasonTableViewCell else {
                return UITableViewCell() }
            cell.oddSeasonLabel.text = "S: \(episode.season.description)   E: \(episode.number.description)"
            cell.oddEpisodeLabel.text = episode.name
            cell.oddSeasonImage.image = UIImage(named: episode.mediumImageID)
            return cell
        } else {
            let episode = GOTSeasons[indexPath.section][indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "evenSeasonCell", for: indexPath) as? EvenSeasonTableViewCell else {
                return UITableViewCell() }
            cell.evenSeasonLabel.text = "S: \(episode.season.description)   E: \(episode.number.description)"
            cell.evenEpisodeLabel.text = episode.name
            cell.evenSeasonImage.image = UIImage(named: episode.mediumImageID)
            return cell
        }
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
            return nil
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath =  GOTTableView.indexPathForSelectedRow, let detailedViewController = segue.destination as? DetailViewController else {return}

        let theEpisodes = GOTSeasons[indexPath.section][indexPath.row]
        detailedViewController.detailGOTEpisode = theEpisodes
    }

}
