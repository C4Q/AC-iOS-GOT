//
//  GOTViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var gotEpisodes = [GOTEpisode]()
    
    @IBOutlet weak var gotTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotTableView.delegate = self
        gotTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        self.gotEpisodes = GOTEpisode.allEpisodes
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var seasons: Set<Int> = []
        GOTEpisode.allEpisodes.forEach{seasons.insert($0.season)}
        return seasons.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let season = section + 1
        let episodesThisSeason = gotEpisodes.filter { $0.season == season }
        return episodesThisSeason.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let season = indexPath.section + 1
        let episodesThisSeason = gotEpisodes.filter { $0.season == season }
        let episode = episodesThisSeason[indexPath.row]
        guard episode.season % 2 == 0 else {
            let episodeCell = tableView.dequeueReusableCell(withIdentifier: "leftAlignedEpisodeCells", for: indexPath)
            if let cell = episodeCell as? GOTLeftAlignedTableViewCell {
                cell.leftAlignedSet(to: episode)
                return cell
            }
            return episodeCell
        }
        let episodeCell = tableView.dequeueReusableCell(withIdentifier: "rightAlignedEpisodeCells", for: indexPath)
        if let episodeCell = episodeCell as? GOTRightAlignedTableViewCell {
            episodeCell.rightAlignedSet(to: episode)
            return episodeCell
        }
        return episodeCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let season = section + 1
        return "Season \(season)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var currentSeason = gotEpisodes.filter{$0.season == gotTableView.indexPathForSelectedRow!.section + 1 }
        switch segue.identifier! {
        case "LeftAlignedSegue":
            if let destination = segue.destination as? GOTDetailViewController {
                let selectedRow = gotTableView.indexPathForSelectedRow!.row
                let selectedEpisode = currentSeason[selectedRow]
                destination.gotEpisodeDetails = selectedEpisode
            }
        case "RightAlignedSegue":
            if let destination = segue.destination as? GOTDetailViewController {
                let selectedRow = gotTableView.indexPathForSelectedRow!.row
                let selectedEpisode = currentSeason[selectedRow]
                destination.gotEpisodeDetails = selectedEpisode
            }
        default:
            break
        }
    }
    
}