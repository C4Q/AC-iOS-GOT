//
//  SearchGOTViewController.swift
//  GOT-StudentVersion
//
//  Created by Richard Crichlow on 11/5/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit


class SearchGOTViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var gotTableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredEpisodes.count
        }
        return 0
//        else {
//            return GOTEpisode.allEpisodes.count
//        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let titleSearchCell = gotTableView.dequeueReusableCell(withIdentifier: "titleSearchCell", for: indexPath)
        var anEpisode = GOTEpisode.allEpisodes[indexPath.row]
        if isFiltering() {
            anEpisode = filteredEpisodes[indexPath.row]
        }
//        else {
//            anEpisode = episodes[indexPath.row]
//        }
        if let episodeCell = titleSearchCell as? GOTTableViewCell {
            episodeCell.leftEpisodeTitleLabel.text = anEpisode.name
            episodeCell.leftSeasonNumEpisodeNumLabel.text = "S: \(anEpisode.season), E: \(anEpisode.number)"
            episodeCell.leftEpisodeImage.image = UIImage(named: anEpisode.mediumImageID)
        }
        return titleSearchCell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if isFiltering() {
            switch segue.identifier! {
            case "searchViewSegue":
                if let destination = segue.destination as? DetailedViewController {
                    let selectedRow = self.gotTableView.indexPathForSelectedRow!.row
                    let selectedEpisode = self.filteredEpisodes[selectedRow]
                    destination.detailedEpisode = selectedEpisode
                }
            default:
                print("You segued to some unknown place")
            }
        }
//        else {
//            switch segue.identifier! {
//            case "searchViewSegue":
//                if let destination = segue.destination as? DetailedViewController {
//                    let selectedRow = self.gotTableView.indexPathForSelectedRow!.row
//                    let selectedEpisode = self.GOTEpisode.allEpisodes[selectedRow]
//                    destination.detailedEpisode = selectedEpisode
//                }
//            default:
//                print("You segued to some unknown place")
//            }
        }
//        switch segue.identifier! {
//        case "searchViewSegue":
//            if let destination = segue.destination as? DetailedViewController {
//                let selectedRow = self.gotTableView.indexPathForSelectedRow!.row
//                let selectedEpisode = self.filteredEpisodes[selectedRow]
//                destination.detailedEpisode = selectedEpisode
//            }
//        default:
//            print("You segued to some unknown place")
//        }
//    }
    
    var searchBrain = CustomSearch()
    var filteredEpisodes = [GOTEpisode]()
//    var episodes = GOTEpisode.allEpisodes
    let searchController = UISearchController(searchResultsController: nil)
    
//    func loadData() {
//        self.episodes = GOTEpisode.allEpisodes
//    }
//
//    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadData()
        gotTableView.delegate = self
        gotTableView.dataSource = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Episodes"
        searchController.searchBar.backgroundColor = .white
        // Setup the Scope Bar
        searchController.searchBar.scopeButtonTitles = ["Name", "Summary"]
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    func filterContentForSearchText(_ searchText: String, scope: String = "Name") {
        
        
//        filteredEpisodes = GOTEpisode.allEpisodes.filter({( episode : GOTEpisode) -> Bool in
//
////            let doesCategoryMatch = (scope == "Name") || (episode.summary == scope)
//
//            if searchBarIsEmpty() {
//                return true
//            } else {
//                return episode.name.lowercased().contains(searchText.lowercased())
//            }
//
//        })
        
        var filtered: [GOTEpisode] = []
        
        switch scope {
        case "Name":
            filtered = GOTEpisode.allEpisodes.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        case "Summary":
            filtered = GOTEpisode.allEpisodes.filter { $0.summary.lowercased().contains(searchText.lowercased()) }
        default:
            break
        }
        
        filteredEpisodes = filtered
        
        
        gotTableView.reloadData()
    }
    func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }
}
extension SearchGOTViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}
extension SearchGOTViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}
