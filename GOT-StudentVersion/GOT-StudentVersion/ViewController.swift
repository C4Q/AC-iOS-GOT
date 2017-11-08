//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var episodeArray = [GOTEpisode]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        loadData()
    }
    func loadData() {
        self.episodeArray = GOTEpisode.allEpisodes
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let season = section + 1
        let episodesInSeason = episodeArray.filter{$0.season == season}
        return episodesInSeason.count
//        return episodeArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let season = indexPath.section + 1
        let episodesInSeason = episodeArray.filter{$0.season == season}
        
        let episode = episodesInSeason[indexPath.row]
        guard episode.season % 2 == 0 else {
        let episodeCell = tableView.dequeueReusableCell(withIdentifier: "Episode Cell Left", for: indexPath)
            if let cell = episodeCell as? LeftTableViewCell {
                cell.leftCell(to: episode)
                return cell
            }
        return episodeCell
    }
        let episodeCell = tableView.dequeueReusableCell(withIdentifier: "Episode Cell Right", for: indexPath)
        if let cell = episodeCell as? RightTableViewCell {
            cell.rightCell(to: episode)
            return cell
        }
        return episodeCell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let season = section + 1
        return "Season \(season)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var currentSeason = episodeArray.filter{$0.season == tableView.indexPathForSelectedRow!.section + 1 }
        switch segue.identifier! {
        case "leftSegue":
            if let destination = segue.destination as? SummaryViewController {
                let selectedRow = tableView.indexPathForSelectedRow!.row
                let selectedEpisode = currentSeason[selectedRow]
                destination.episodeDetails = selectedEpisode
            }
        case "rightSegue":
            if let destination = segue.destination as? SummaryViewController {
                let selectedRow = tableView.indexPathForSelectedRow!.row
                let selectedEpisode = currentSeason[selectedRow]
                destination.episodeDetails = selectedEpisode
            }
        default:
            break
        }
    }
    
}

