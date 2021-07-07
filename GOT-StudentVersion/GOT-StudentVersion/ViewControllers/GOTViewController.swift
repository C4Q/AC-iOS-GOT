//
//  GOTViewController.swift
//  GOT-StudentVersion
//
//  Created by Luis Calle on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    var allGOTEpisodesBySeason = [Int: [GOTEpisode]]()
    var modelGOT = GOTModel()
    
    @IBOutlet weak var tableViewGOT: UITableView!
    @IBOutlet weak var searchBarGOT: UISearchBar!
    
    var searchTerm: String? {
        didSet {
            self.tableViewGOT.reloadData()
        }
    }
    
    var filteredEpisodesDict: [Int: [GOTEpisode]] {
        guard let searchTerm = searchTerm, searchTerm != "" else {
            return self.allGOTEpisodesBySeason
        }
        guard let scopeTitles = self.searchBarGOT.scopeButtonTitles else {
            return self.allGOTEpisodesBySeason
        }
        let selectedIndex = self.searchBarGOT.selectedScopeButtonIndex
        let filteringCriteria = scopeTitles[selectedIndex]
        var filterdEps = [Int: [GOTEpisode]]()
        switch filteringCriteria {
        case "Title":
            for (k,v) in allGOTEpisodesBySeason {
                let epsFiltered = v.filter{$0.name.lowercased().contains(searchTerm.lowercased())}
                filterdEps.updateValue(epsFiltered, forKey: k)
            }
        case "Description":
            for (k,v) in allGOTEpisodesBySeason {
                let epsFiltered = v.filter{$0.summary.lowercased().contains(searchTerm.lowercased())}
                filterdEps.updateValue(epsFiltered, forKey: k)
            }
        default:
            filterdEps = allGOTEpisodesBySeason
        }
        return filterdEps
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewGOT.delegate = self
        tableViewGOT.dataSource = self
        searchBarGOT.delegate = self
        loadGOTData()
        /*
         https://stackoverflow.com/questions/39438606/change-navigation-bar-title-font-swift
         used to change the font of the navigation bar title to make UI consistent
         */
        guard let navController = self.navigationController, let navBarFont = UIFont(name: "Gurmukhi MN", size: 22) else {
            return
        }
        navController.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: navBarFont]
    }
    
    func loadGOTData() {
        allGOTEpisodesBySeason = modelGOT.makeGOTEpisodesDictionary(GOTEpisodes: GOTEpisode.allEpisodes)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let totalEpisodesInSeason = filteredEpisodesDict[section] else {
            return 0
        }
        return totalEpisodesInSeason.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season " + String(section + 1)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredEpisodesDict.count
    }
    
    /*
    https://stackoverflow.com/questions/31381762/swift-ios-8-change-font-title-of-section-in-a-tableview
    used this reference to change the section title font and background color
    */
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        guard let headerTextLabel = header.textLabel, let headerFont = UIFont(name: "Gurmukhi MN", size: 19), let headerBackground = header.backgroundView else {
            return
        }
        headerTextLabel.font = headerFont
        headerBackground.backgroundColor = UIColor(red: 0.7608, green: 0.7294, blue: 0.7137, alpha: 1.0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if indexPath.section % 2 == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "Left GOT Cell", for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "Right GOT Cell", for: indexPath)
        }
        let season = indexPath.section
        let episode = indexPath.row
        guard let seasonEpisodes = filteredEpisodesDict[season] else {
            return cell
        }
        let fullEpisode: GOTEpisode = seasonEpisodes[episode]
        if let cell = cell as? LeftGOTTableViewCell {
            cell.episodeImage.image = UIImage(named: fullEpisode.mediumImageID)
            cell.episodeTitleLabel.text = fullEpisode.name
            cell.episodeNumAndSeasonLabel.text = "S:\(fullEpisode.season) E:\(fullEpisode.number)"
        } else if let cell = cell as? RightGOTTableViewCell {
            cell.episodeImage.image = UIImage(named: fullEpisode.mediumImageID)
            cell.episodeTitleLabel.text = fullEpisode.name
            cell.episodeNumAndSeasonLabel.text = "S:\(fullEpisode.season) E:\(fullEpisode.number)"
        } else {
            return cell
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GOTDetailedViewController {
            guard let indexSelected = tableViewGOT.indexPathForSelectedRow else {
                return
            }
            let selectedEpisodeInSeason = indexSelected.row
            let selectedSeason = indexSelected.section
            guard let seasonEpisodes = filteredEpisodesDict[selectedSeason] else {
                return
            }
            let selectedEpisode = seasonEpisodes[selectedEpisodeInSeason]
            destination.episodeGOT = selectedEpisode
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchTerm = searchBar.text
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchText
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        tableViewGOT.reloadData()
    }
    
}
