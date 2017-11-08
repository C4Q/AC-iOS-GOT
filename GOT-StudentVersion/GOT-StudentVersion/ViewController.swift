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
        return gotSeasons[section].count
    }
//        return allGOTEpisodes.count
//        var numberOfRows: Int
//        switch section {
//        case 0:
//            //season 1
//            let theSeason1 = seasons.filter { $0.season == 1 }
//            numberOfRows = theSeason1.count
//        case 1:
//            let theSeason2 = seasons.filter { $0.season == 2 }
//            numberOfRows = theSeason2.count
//        case 2:
//            let theSeason3 = seasons.filter { $0.season == 3 }
//            numberOfRows = theSeason3.count
//        case 3:
//            let theSeason4 = seasons.filter { $0.season == 4 }
//            numberOfRows = theSeason4.count
//        case 4:
//            let theSeason5 = seasons.filter { $0.season ==  5 }
//            numberOfRows = theSeason5.count
//        case 5:
//            let theSeason6 = seasons.filter { $0.season ==  6 }
//            numberOfRows = theSeason6.count
//        case 6:
//            let theSeason7 = seasons.filter { $0.season == 7 }
//            numberOfRows = theSeason7.count
//        default:
//            numberOfRows = 0
//        }
//        print(numberOfRows)
//        return numberOfRows
//
//    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let section = indexPath.section
        let season = gotSeasons[section]
        
        let row = indexPath.row
        let episode = season[row]
        
        
        
//        let episode = allGOTEpisodes[indexPath.row]
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath)
        tableViewCell.imageView?.image = UIImage(named: episode.mediumImageID.description)
        tableViewCell.textLabel?.text = episode.name
        tableViewCell.detailTextLabel?.text = "S: \(episode.season), E: \(episode.number)"
        return tableViewCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       
        return gotSeasons.count
        }
   
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












//ignore this
//func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//            let section = section + 1
//            return "Season: " + section.description
// this is setting up the header of the sections. since sections start at 0, I created a variable section that just adds 1 to whatever section its looking at so it spits out the right number
//        }
//
