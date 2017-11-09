//
//  TableViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/4/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var episodeArr = [GOTEpisode]()

    override func viewDidLoad() {
        super.viewDidLoad()
        episodeArr = GOTEpisode.allEpisodes
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeArr.filter{$0.season == section + 1}.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indexPath.section % 2 == 0 ? "Left Cell" : "Right Cell", for: indexPath)
        
        if let cell = cell as? TableViewCell {
            cell.episodeTextLabel?.text = episodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].name
            cell.seasonAndEpisodeTextLabel?.text = "S:" + "\(episodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].season) " + "E:" + "\(episodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].number)"
            cell.episodeImageView?.image = UIImage(named: episodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].mediumImageID)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cellSelected =  sender as? UITableViewCell {
            
            if segue.identifier == "Details" {
                let season = ((tableView.indexPath(for: cellSelected)?.section)! + 1)
                let episode = ((tableView.indexPath(for: cellSelected)?.row)! + 1)
                
                if let destination = segue.destination as? ViewController {
                    destination.selectedEpisode = episodeArr.filter{$0.season == season}[episode - 1]
                }
            }
        }
    }
}
