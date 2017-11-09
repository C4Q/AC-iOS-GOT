//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var episodeArr: [Int: [GOTEpisode]] {
        get {
            let numberOfSeasons = Set(GOTEpisode.allEpisodes.map{$0.season}).count
            
            var fullList = [Int: [GOTEpisode]]()
            
            for season in 1...numberOfSeasons {
                let seasonEpisodes: [GOTEpisode] = GOTEpisode.allEpisodes.filter{$0.season == season}
                fullList.updateValue(seasonEpisodes, forKey: season)
            }
            return fullList
        }
    }
    
    var filteredEpisodeArr: [Int: [GOTEpisode]] {
        get {
            guard let searchTerm = searchTerm, !searchTerm.isEmpty else {
                return episodeArr
            }
            
            var returnArr = [Int: [GOTEpisode]]()
            
            for season in episodeArr.keys {
                let filteredEps: [GOTEpisode] = episodeArr[season]!.filter{searchBar.selectedScopeButtonIndex == 0 ? $0.name.lowercased().contains(searchTerm.lowercased()): $0.summary.contains(searchTerm.lowercased())}
                returnArr.updateValue(filteredEps, forKey: season)
            }
            
            return returnArr
        }
    }
    
    var searchTerm: String? {
        didSet {
            tableView.reloadData()
        }
    }
    var isFilteredOnDescription: Bool = false
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:- TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredEpisodeArr.filter({$0.value.count > 0}).count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredEpisodeArr[Array(filteredEpisodeArr.filter({$0.value.count > 0}).keys).sorted()[section]]!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: (indexPath.section % 2 == 0 ? "Left Cell" : "Right Cell") , for: indexPath)
        
        if let cell = cell as? TableViewCell {
            let season = Array(filteredEpisodeArr.filter({$0.value.count > 0}).keys).sorted()[indexPath.section]
            let row = indexPath.row
            let episodeToUse = filteredEpisodeArr[season]![row]
            
            cell.thumbnail?.image = UIImage(named: episodeToUse.mediumImageID)
            if isFilteredOnDescription {
                cell.title.text = episodeToUse.summary
                cell.seasonAndEpisodeLabel.text = ""
            } else {
                cell.title.text = episodeToUse.name
                cell.seasonAndEpisodeLabel.text = "S: \(episodeToUse.season)  E: \(episodeToUse.number)"
            }
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(Array(filteredEpisodeArr.filter({$0.value.count > 0}).keys).sorted()[section])"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            if segue.identifier == "Detail Segue" {
                if let episodeDetailViewController = segue.destination as? EpisodeDetailViewController {
                    let section = (tableView.indexPath(for: cell)?.section)!
                    let season = Array(filteredEpisodeArr.filter({$0.value.count > 0}).keys).sorted()[section]
                    let row = (tableView.indexPath(for: cell)?.row)!
                    
                    episodeDetailViewController.selectedEpisode = filteredEpisodeArr[season]![row]
                }
            }
        }
    }
    
    //MARK:- SearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTerm = searchText
        if filteredEpisodeArr.filter({$0.value.count > 0}).count == 0 {
            searchBar.resignFirstResponder()
        }
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        isFilteredOnDescription = selectedScope == 1
        tableView.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

