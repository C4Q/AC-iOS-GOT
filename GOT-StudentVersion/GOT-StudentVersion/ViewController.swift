//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var GOTDetail: GOTEpisode?
    
    var allGOTEpisodes = GOTEpisode.allEpisodes
    var seasons: [(season: Int, episode: Int)] = []
    //list of all seasons - 1-7, no repeats
    
    
    
    
    // MARK - DATASOURCE METHODS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotSeasons[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let section = indexPath.section
        let season = gotSeasons[section]
        let row = indexPath.row
        let episode = season[row]
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath)
        tableViewCell.imageView?.image = UIImage(named: episode.mediumImageID.description)
        tableViewCell.textLabel?.text = episode.name
        tableViewCell.detailTextLabel?.text = "S: \(episode.season), E: \(episode.number)"
        return tableViewCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       
        return gotSeasons.count
        }
   
    // MARK - HEADER
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let seasonTitle = "Season " + (section + 1).description
        
        return seasonTitle
    }
    
    @IBOutlet weak var tableViewGOT: UITableView!
    var gotSeasons: [[GOTEpisode]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewGOT.delegate = self
        self.tableViewGOT.dataSource = self
        //for-loop populates seasons variable
//        for episode in allGOTEpisodes {
//            seasons.append((episode.season, episode.number))
//        }
        var seasons: Set<Int> = []
        allGOTEpisodes.forEach{seasons.insert($0.season)}
        var seasonArr = [Int]()
        for season in seasons {
            seasonArr.append(season)
        }
        seasonArr = seasonArr.sorted()
        print(seasonArr)
        for season in seasonArr{
            gotSeasons.append(GOTEpisode.allEpisodes.filter{$0.season == season})     // this is  magic that will filter items if the season is the same as the season we are searching, spits out an array of these items and then you append this array into our array of arrays
        }
}
    
    
    

    // MARK - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let destination = segue.destination as? EpisodeDescriptionViewController {
        var season = tableViewGOT.indexPathForSelectedRow?.section
        var episode = tableViewGOT.indexPathForSelectedRow?.row
        var selectedSeason = gotSeasons[season!]
        var selectedEpisode = selectedSeason[episode!]
        destination.GOTDetail = selectedEpisode
        
        
        
        }
    }
    
    
    
    
    
    
    
}












