//
//  GOTViewController+Extension.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/4/17.
//  Copyright © 2017 C4Q . All rights reserved.
import Foundation
import UIKit

extension GOTViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    //MARK: - TableView Controller
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let numberOfSection: Int
        if self.searchTerm == nil || self.searchTerm == "" {
            numberOfSection = gotSeasonxEpisodes.count
        } else {
            numberOfSection = 1
        }
        return numberOfSection
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowInSection: Int
        if self.searchTerm == nil || self.searchTerm == "" {
            numberOfRowInSection = gotSeasonxEpisodes[section].episodes.count
        } else {
            numberOfRowInSection = filteredEpisodes.count
        }
        return numberOfRowInSection
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var titleOfSection = ""
        if self.searchTerm == nil || self.searchTerm == "" {
            titleOfSection = "Season: \(gotSeasonxEpisodes[section].season)"
        } else {
            titleOfSection = ""
        }
        return titleOfSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.searchTerm == nil || self.searchTerm == "" {
            let gotEpisode = gotSeasonxEpisodes[indexPath.section].episodes[indexPath.row]
            let gotSection = gotSeasonxEpisodes[indexPath.section].season
            let cellLocation = gotSection % 2 == 0 ? "Table Cell Right": "Table Cell Left"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellLocation, for: indexPath) as? GOTTableViewCell
            cell?.gotMediumImage.image = UIImage(named: gotEpisode.mediumImageID)
            cell?.gotEpisode.text = gotEpisode.name
            cell?.gotSeasonEpisodeTag.text = "S: \(gotEpisode.season) E: \(gotEpisode.number)"
            return cell!
        } else {
            let gotEpisode = filteredEpisodes[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Table Cell Right", for: indexPath) as? GOTTableViewCell
            cell?.gotMediumImage.image = UIImage(named: gotEpisode.mediumImageID)
            cell?.gotEpisode.text = gotEpisode.name
            cell?.gotSeasonEpisodeTag.text = "S: \(gotEpisode.season) E: \(gotEpisode.number)"
            return cell!
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let GOTDetail = segue.destination as? GOTDetailViewController {
            let sectionSelected = gotTableView.indexPathForSelectedRow!.section
            let rowSelected = gotTableView.indexPathForSelectedRow!.row
            let selectedEpisode = self.gotSeasonxEpisodes[sectionSelected].episodes[rowSelected]
            GOTDetail.gotEpisodeDetail = selectedEpisode
        }
    }
    
    
    //MARK: - SearchBar Delegate Methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchTerm = searchBar.text
        //print("The user pressed seach!")
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchText
    }

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        self.gotTableView.reloadData()
    }
}
