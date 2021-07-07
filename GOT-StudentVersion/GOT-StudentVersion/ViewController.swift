//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var allEpisodes = [[GOTEpisode]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.delegate = self
        tableView.dataSource = self
        self.searchBar.delegate = self
    }
    
    func loadData() {
        //        self.allEpisodes = GOTEpisode.allEpisodes
        var seasons = [Int]()
        for episode in GOTEpisode.allEpisodes {
            seasons.append(episode.season)
        }
        
        let seasonNums = Set(seasons)
        
        allEpisodes = Array(repeating: [GOTEpisode](), count: seasonNums.count)
        
        for episode in GOTEpisode.allEpisodes {
            allEpisodes[episode.season - 1].append(episode)
        }
    }
    
    var searchTerm: String? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchTerm = searchBar.text?.lowercased()
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchText
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        tableView.reloadData()
    }
    
    
    var filteredSearch: [[GOTEpisode]] {
        guard let searchTerm = searchTerm, searchTerm != "" else {
            return allEpisodes
        }
        guard let scopeTitles = self.searchBar.scopeButtonTitles else {
            return allEpisodes
        }
        let selectedIndex = self.searchBar.selectedScopeButtonIndex
        let filteringCriteria = scopeTitles[selectedIndex]
        switch filteringCriteria {
        case "Title":
            var all = [[GOTEpisode]]()
            for season in 0..<allEpisodes.count {
                all.append(allEpisodes[season].filter{ (episode) in
                    episode.name.lowercased().contains(searchTerm.lowercased())
                })
            }
            return all
        case "Description":
            var all = [[GOTEpisode]]()
            for season in 0..<allEpisodes.count {
                all.append(allEpisodes[season].filter{ (episode) in
                    episode.summary.lowercased().contains(searchTerm.lowercased())
                })
            }
            return all
        default:
            return allEpisodes
        }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredSearch.count // season
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        var season = 1
        //        let episodesPerSeason = allEpisodes.filter{$0.season == season}
        //        season += 1
        return filteredSearch[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season " + String(section + 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(filteredSearch[0].count)
        if indexPath.section % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "photoLeft", for: indexPath)
            let episode = filteredSearch[indexPath.section][indexPath.row]
            if let episodeCell = cell as? LeftTableViewCell {
                episodeCell.episodeImage.image = UIImage(named: episode.mediumImageID)
                episodeCell.episodeNumber.text = "S: " + String(episode.season) + " E: " + String(episode.number)
                episodeCell.episodeTitle.text = episode.name
                return episodeCell
            } else {
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "photoRight", for: indexPath)
            let episode = filteredSearch[indexPath.section][indexPath.row]
            if let episodeCell = cell as? RightTableViewCell {
                episodeCell.rightEpisodeImage.image = UIImage(named: episode.mediumImageID)
                episodeCell.rightEpisodeNumber.text  = "S: " + String(episode.season) + " E: " + String(episode.number)
                episodeCell.rightEpisodeTitle.text = episode.name
                return episodeCell
            } else {
                return cell
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            let index = self.tableView.indexPathForSelectedRow!
            let selectedEpisode = self.filteredSearch[index.section][index.row]
            destination.episode = selectedEpisode
        }
    }
    
}





