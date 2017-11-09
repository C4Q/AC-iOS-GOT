//
//  GOTViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/4/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTViewController: UIViewController {
    
    var allEpisodes = GOTEpisode.allEpisodes
    var gotSeasonxEpisodes = GOTEpisode.seasonxEpisodes
    var filteredEpisodes: [GOTEpisode] {
        guard let searchTerm = self.searchTerm else {
            return []
        }
        if let gotSearchButtons = self.searchBar.scopeButtonTitles {
            let currentIndexSelected = self.searchBar.selectedScopeButtonIndex
            let searchSelected = gotSearchButtons[currentIndexSelected]
            switch searchSelected {
            case "Title":
                return allEpisodes.filter{$0.name.lowercased().contains(searchTerm.lowercased())}
            case "Description":
                return allEpisodes.filter{$0.summary.lowercased().contains(searchTerm.lowercased())}
            default:
                break
            }
        }
        return []
    }
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
