//
//  GOTViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/4/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTViewController: UIViewController {
    
    var gotSeasonxEpisodes = GOTEpisode.seasonxEpisodes
//    var filteredEpisodes: [(season: Int,episodes: [GOTEpisode])] {
//        guard let searchTerm = searchTerm, !searchTerm.isEmpty else {
//            return self.gotSeasonxEpisodes
//        }
//        guard let scopeTitles = self.searchBar.scopeButtonTitles else {
//            return self.gotSeasonxEpisodes
//        }
//        let selectedIndex = self.searchBar.selectedScopeButtonIndex
//        let filteringCriteria = scopeTitles[selectedIndex]
//        switch filteringCriteria {
//        case "Title":
////            return gotSeasonxEpisodes.filter{$0.episodes.filter{$0.name.lowercased() == searchTerm.lowercased() ? true: false}}
//            
//            return gotSeasonxEpisodes.filter{(season) in
//                return season.episodes.filter{(episode) in
//                    return episode.name.contains(searchTerm)
//                }
//                ? gotSeasonxEpisodes: []}
//        case "Description":
//            return personArr.filter{(person) in
//                return person.location.lowercased().contains(searchTerm.lowercased())
//            }
//        default:
//            return gotSeasonxEpisodes
//        }
//    }
    var searchTerm: String? {
        didSet {
            self.gotTableView.reloadData()
        }
    }
    
    
    @IBOutlet weak var gotTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gotTableView.delegate = self
        self.gotTableView.dataSource = self
        self.searchBar.delegate = self
    }
}
