//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     var GOTDetail: GOTEpisode?
    var allGOTEpisodes = GOTEpisode.allEpisodes
    var seasons: [(season: Int, episode: Int)] = []
    //list of all seasons - 1-7, no repeats
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGOTEpisodes.count
        var numberOfRows: Int
        switch section {
        case 0:
            //season 1
            let theSeason1 = seasons.filter { $0.season == 1 }
            numberOfRows = theSeason1.count
        case 1:
            let theSeason2 = seasons.filter { $0.season == 2 }
            numberOfRows = theSeason2.count
        case 2:
            let theSeason3 = seasons.filter { $0.season == 3 }
            numberOfRows = theSeason3.count
        case 3:
            let theSeason4 = seasons.filter { $0.season == 4 }
            numberOfRows = theSeason4.count
        case 4:
            let theSeason5 = seasons.filter { $0.season ==  5 }
            numberOfRows = theSeason5.count
        case 5:
            let theSeason6 = seasons.filter { $0.season ==  6 }
            numberOfRows = theSeason6.count
        case 6:
            let theSeason7 = seasons.filter { $0.season == 7 }
            numberOfRows = theSeason7.count
        default:
            numberOfRows = 0
        }
        return numberOfRows
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episode = allGOTEpisodes[indexPath.row]
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath)
        tableViewCell.imageView?.image = UIImage(named: episode.mediumImageID )
        tableViewCell.textLabel?.text = episode.name
        tableViewCell.detailTextLabel?.text = "S: \(episode.season), E: \(episode.number)"
        return tableViewCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var numberOfSeasons: [Int] = [] //should contain seasons 1-7, .count = 7 b/c 7 seasons total
        //for-loop used to populate numberOfSeason
        for episode in seasons where !numberOfSeasons.contains(episode.season) {
            numberOfSeasons.append(episode.season)
        }
        return numberOfSeasons.count
        }
   
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let seasonTitle = ""
        return seasonTitle
    }
    @IBOutlet weak var tableViewGOT: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewGOT.delegate = self
        self.tableViewGOT.dataSource = self
        //for-loop populates seasons variable
        for episode in allGOTEpisodes {
            seasons.append((episode.season, episode.number))
        }
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK: - SEGUE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EpisodeDescriptionViewController {
            let selectedRow = self.tableView.indexPathForSelectedRow!.row
            let selectedEpisode = self.allGOTEpisodes[selectedRow]
            destination.GOTDetail = selectedEpisode
    
        }

}

}
