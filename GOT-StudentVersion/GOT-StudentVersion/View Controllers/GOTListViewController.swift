//
//  GOTListViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var GOTTableView: UITableView!
    
    //Data Source Variable
    var GOTInfo: [[GOTEpisode]] = []
    
    //Search Bar
    var searchController = UISearchController(searchResultsController: nil)
    var filteredEpisodes: [GOTEpisode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GOTTableView.delegate = self
        GOTTableView.dataSource = self
        setUpSearchController()
        setUpDataSource()
        GOTTableView.estimatedRowHeight = 125
        GOTTableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setUpDataSource() {
        let numberOfSeasons = GOTEpisode.allEpisodes[GOTEpisode.allEpisodes.count-1].season
        for currentSeason in 1...numberOfSeasons {
            GOTInfo += [GOTEpisode.allEpisodes.filter{$0.season == currentSeason}]
        }
    }
    
    func setUpSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.scopeButtonTitles = ["Title", "Description"]
        searchController.searchBar.delegate = self
        searchController.searchBar.showsScopeBar = true
        searchController.searchBar.backgroundColor = .black
        searchController.searchBar.tintColor = .white
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.white]
    }
    
    //Table View
    //Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "DetailedViewSegue", sender: cell)
    }
    
    //Data Source Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        if isFiltering() {
            return 1
        }
        
        return GOTInfo.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isFiltering() {
            return nil
        }
        
        for number in 0..<GOTInfo.count where number == section {
            return "Season \(GOTInfo[number][0].season)"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredEpisodes.count
        }
        
        return GOTInfo[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isFiltering() {
            let filteredRowToSetUp = indexPath.row
            let cell = tableView.dequeueReusableCell(withIdentifier: "GOTFilteredCell")!
            let filteredEpisode = filteredEpisodes[filteredRowToSetUp]
            if let filteredCell = cell as? GOTFilteredTableViewCell {
                filteredCell.episodeImageView.image = UIImage(named: filteredEpisode.mediumImageID)
                filteredCell.titleLabel.text = filteredEpisode.name
                filteredCell.seasonEpisodeLabel.text = "Season: \(filteredEpisode.season) | Episode: \(filteredEpisode.number)"
                return filteredCell
            }
            
            return cell
        }
        
        let sectionToSetUp = indexPath.section
        let rowToSetUp = indexPath.row
        let currentEpisode = GOTInfo[sectionToSetUp][rowToSetUp]
        let sectionIsEven = sectionToSetUp % 2 == 0
        
        let cell = (sectionIsEven) ? (tableView.dequeueReusableCell(withIdentifier: "GOTLeftCell", for: indexPath)) : (tableView.dequeueReusableCell(withIdentifier: "GOTRightCell", for: indexPath))
        
        if sectionIsEven, let leftCell = cell as? GOTLeftTableViewCell {
            leftCell.episodeImageView.image = UIImage(named: currentEpisode.mediumImageID)
            leftCell.titleLabel.text = currentEpisode.name
            leftCell.seasonEpisodeLabel.text = "Season: \(currentEpisode.season) | Episode: \(currentEpisode.number)"
            return leftCell
        } else if let rightCell = cell as? GOTRightTableViewCell {
            rightCell.episodeImageView.image = UIImage(named: currentEpisode.mediumImageID)
            rightCell.titleLabel.text = currentEpisode.name
            rightCell.seasonEpisodeLabel.text = "Season: \(currentEpisode.season) | Episode: \(currentEpisode.number)"
            return rightCell
        }
        
        return cell
    }
 
    //Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UITableViewCell else {
            return
        }
        
        guard let currentIndexPath = GOTTableView.indexPath(for: cell) else {
            return
        }
        
        if segue.identifier == "DetailedViewSegue", let destinationVC = segue.destination as? GOTDetailedViewController {
            if isFiltering() {
                destinationVC.episode = filteredEpisodes[currentIndexPath.row]
            } else {
                destinationVC.episode = GOTInfo[currentIndexPath.section][currentIndexPath.row]
            }
        }
    }
    
    //Search Bar Methods
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String) {
        filteredEpisodes = GOTEpisode.allEpisodes.filter{(episode: GOTEpisode) -> Bool in
            if scope == "Title" {
                return episode.name.lowercased().contains(searchText.lowercased())
            } else {
                return episode.summary.lowercased().contains(searchText.lowercased())
            }
        }
        
        GOTTableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
}

//Updating Search Results
extension GOTListViewController: UISearchResultsUpdating {
    //Search Results Methods
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let currentScope = searchController.searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: currentScope)
    }
}

//Search Bar Delegate Methods
extension GOTListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

