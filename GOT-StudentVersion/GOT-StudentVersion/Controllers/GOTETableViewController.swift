//
//  GOTETableViewController.swift
//  GOTE Project
//
//  Created by Mariel Hoepelman on 8/18/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import UIKit

class GOTETableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 7
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return GOTEpisode.episodesBySeason(season: section + 1).count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
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
            return "Season not found"
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as? EpisodesTableViewCell {
            let episodes = GOTEpisode.episodesBySeason(season: indexPath.section + 1)
            cell.episodeNameLabel?.text = episodes[indexPath.row].name
            cell.seasonNumberLabel?.text = "S:\(episodes[indexPath.row].season) E:\(episodes[indexPath.row].number)"
            //            cell.episodeImage.contentMode = .scaleToFill
            //            cell.episodeImage.image = UIImage(named: episodes[indexPath.row].mediumImageID)
            //
            
            return cell
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { fatalError("No identifier in segue") }
        
        switch segueIdentifier {
        case "episodeID":
            guard let episodeDetailedViewController = segue.destination as? EpisodeDetailedViewController else {
                fatalError("Unexpected segue VC")
            }
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
                fatalError("No row was selected")
            }
            let episodes = GOTEpisode.episodesBySeason(season: selectedIndexPath.section + 1)
            episodeDetailedViewController.episode = episodes[selectedIndexPath.row]
        default:
            fatalError("Unexpected segue identifier")
        }
    }



}
