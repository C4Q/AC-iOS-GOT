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
        } else {
            return episodes.count
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let titleSearchCell = gotTableView.dequeueReusableCell(withIdentifier: "titleSearchCell", for: indexPath)
        var anEpisode = episodes[indexPath.row]
        if isFiltering() {
            anEpisode = filteredEpisodes[indexPath.row]
        } else {
            anEpisode = episodes[indexPath.row]
        }
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
        } else {
            switch segue.identifier! {
            case "searchViewSegue":
                if let destination = segue.destination as? DetailedViewController {
                    let selectedRow = self.gotTableView.indexPathForSelectedRow!.row
                    let selectedEpisode = self.episodes[selectedRow]
                    destination.detailedEpisode = selectedEpisode
                }
            default:
                print("You segued to some unknown place")
            }
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
    }
    
    var searchBrain = CustomSearch()
    var filteredEpisodes = [GOTEpisode]()
    var episodes = GOTEpisode.allEpisodes
    let searchController = UISearchController(searchResultsController: nil)
    
    func loadData() {
        self.episodes = GOTEpisode.allEpisodes
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        gotTableView.delegate = self
        gotTableView.dataSource = self
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Episodes"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredEpisodes = episodes.filter({( Episode : GOTEpisode) -> Bool in
            return Episode.name.lowercased().contains(searchText.lowercased())
        })
        gotTableView.reloadData()
    }
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}
extension SearchGOTViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
