//
//  GoTViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/9/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GoTViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var episodeArr = [GOTEpisode]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var filteredEpisodeArr: [GOTEpisode] {
        guard let searchTerm = searchTerm, searchTerm != "" else {
            return episodeArr
        }
        guard let scopeTitles = self.searchBar.scopeButtonTitles else {
            return episodeArr
        }
        let selectedIndex = self.searchBar.selectedScopeButtonIndex
        let filteringCriteria = scopeTitles[selectedIndex]
        
        switch filteringCriteria {
        case "Title":
            return episodeArr.filter{(episode) in
                episode.name.lowercased().contains(searchTerm.lowercased())
            }
        case "Description":
            return episodeArr.filter{(episode) in
                episode.summary.lowercased().contains(searchTerm.lowercased())
            }
        default:
            return episodeArr
        }
    }
    
    var searchTerm: String? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        episodeArr = GOTEpisode.allEpisodes
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredEpisodeArr.filter{$0.season == section + 1}.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indexPath.section % 2 == 0 ? "Left Cell" : "Right Cell", for: indexPath)
        
        if let cell = cell as? TableViewCell {
            cell.episodeTextLabel?.text = filteredEpisodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].name
            cell.seasonAndEpisodeTextLabel?.text = "S:" + "\(filteredEpisodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].season) " + "E:" + "\(filteredEpisodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].number)"
            cell.episodeImageView?.image = UIImage(named: filteredEpisodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].mediumImageID)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cellSelected =  sender as? UITableViewCell {
            
            if segue.identifier == "Details" {
                let season = ((tableView.indexPath(for: cellSelected)?.section)! + 1)
                let episode = ((tableView.indexPath(for: cellSelected)?.row)! + 1)
                
                if let destination = segue.destination as? ViewController {
                    destination.selectedEpisode = filteredEpisodeArr.filter{$0.season == season}[episode - 1]
                }
            }
        }
    }
    
    //MARK: - Search Bar Delegate Methods
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchTerm = searchBar.text
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchText
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        self.tableView.reloadData()
    }
}

