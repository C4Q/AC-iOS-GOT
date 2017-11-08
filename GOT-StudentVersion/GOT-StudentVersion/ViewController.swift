//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating {

    var episodeArray = [GOTEpisode]()
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredepisodeArr: [GOTEpisode] {
        guard let searchTerm = searchTerm, searchTerm != "" else {
            return episodeArray
        }
        guard let scopeTitles = self.searchController.searchBar.scopeButtonTitles else {
            return episodeArray
        }
        let selectedIndex = self.searchController.searchBar.selectedScopeButtonIndex
        let filteringCriteria = scopeTitles[selectedIndex]
        switch filteringCriteria {
        case "Title":
            return episodeArray.filter{$0.name.lowercased().contains(searchTerm.lowercased())}
        case "Description":
            return episodeArray.filter{$0.summary.lowercased().contains(searchTerm.lowercased())}
        default:
            return episodeArray
        }
    }
    var searchTerm: String? {
        didSet {
            self.tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        loadData()
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search Episodes"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        searchController.searchBar.scopeButtonTitles = ["Title", "Description"]
        searchController.searchBar.delegate = self
    }
    func loadData() {
        self.episodeArray = GOTEpisode.allEpisodes
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        self.searchTerm = searchController.searchBar.text
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchTerm = searchBar.text
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let season = section + 1
        let episodesInSeason = filteredepisodeArr.filter{$0.season == season}
        return episodesInSeason.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let season = indexPath.section + 1
        let episodesInSeason = filteredepisodeArr.filter{$0.season == season}
        
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
        
        
        var currentSeason = filteredepisodeArr.filter{$0.season == tableView.indexPathForSelectedRow!.section + 1 }
//        navigationController?.dismiss(animated: false, completion: nil)
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

