//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var gotTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: Instance Properties
    var delegate: UITableViewDelegate?
    var searchController = UISearchController()
    
    // MARK: Computed Properties
    var searchTerm: String? {
        didSet {
            gotTableView.reloadData()
        }
    }
    var filteredEpisodes: [GOTEpisode] {
        guard let searchTerm = searchTerm,
            let scopetitles = searchBar?.scopeButtonTitles else {
            return GOTEpisode.allEpisodes
        }
        
        guard searchTerm.isFull else {
            return GOTEpisode.allEpisodes
        }
        
        let selectedIndex = searchBar.selectedScopeButtonIndex
        let filteringCriteria = scopetitles[selectedIndex]
        
        switch filteringCriteria {
        case "Title":
            return GOTEpisode.allEpisodes.filter{$0.name.lowercased().contains(searchTerm.lowercased())}
        case "Description":
            return GOTEpisode.allEpisodes.filter{$0.summary.lowercased().contains(searchTerm.lowercased())}
        default:
            return GOTEpisode.allEpisodes
        }
        
    }
    
    // MARK: Static Properties
    
    // MARK: Overridin Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.gotTableView.delegate = self
        self.gotTableView.dataSource = self
        self.searchBar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1. We need to check what our sender is. Afterall, there might be multiple segues set up...
        // 2. check for the right storyboard segue
        // 3. Get the destination VC
        
        guard let episodeDetailViewController = segue.destination as? EpisodeDetailViewController else {
            return
        }
        
        if let tappedEpisodeCellRight = sender as? RightImageTableViewCell {
            if segue.identifier == "EpisodeDetailSegueRight" {
                // 4. Getting the movie at the tapped cell
                let cellIndexPath = gotTableView.indexPath(for: tappedEpisodeCellRight)!
                episodeDetailViewController.currentEpisode = fetchEpisodes(from: cellIndexPath.section)[cellIndexPath.row]
                //                    GOTEpisode.allEpisodes[cellIndexPath.row]
            }
        }
        
        if let tappedEpisodeCellLeft = sender as? LeftImageTableViewCell {
            if segue.identifier == "EpisodeDetailSegueLeft" {
                // 4. Getting the movie at the tapped cell
                let cellIndexPath = gotTableView.indexPath(for: tappedEpisodeCellLeft)!
                episodeDetailViewController.currentEpisode = fetchEpisodes(from: cellIndexPath.section)[cellIndexPath.row]
            }
        }
        
    }
    
    
}

// MARK: Table View Delegate
extension ViewController: UITableViewDelegate {
    
    // MARK: Cell Selection
    
    // MARK: Section Header Configuration
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UITableViewHeaderFooterView()
        header.textLabel?.textColor = UIColor.ProjectColors.headerTextColor
        return header
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = UITableViewHeaderFooterView()
        header.textLabel?.textColor = UIColor.ProjectColors.headerTextColor
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return fetchTitle(of: section)
    }
    
}

// MARK: Table View Data Source
extension ViewController: UITableViewDataSource {
    
    // MARK: - Table Formation
    func numberOfSections(in tableView: UITableView) -> Int {
//        dump("--------This is all the GOT: \(GOTEpisode.allEpisodes)")
//        dump(ViewController.filteredEpisodes)
        return fetchNumberOfSeasons(from: filteredEpisodes)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let seasonNumber = section + 1
        return fetchNumberOfEpisodesIn(season: seasonNumber)
    }
    
    // MARK: - Cell Rendering
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowNumber = indexPath.row
        let sectionNumber = indexPath.section
        let sectionNumberIsEven = sectionNumber % 2 == 0
        let currentEpisode = fetchSingleEpisode(sectionNum: sectionNumber, episodeNum: rowNumber)
        if sectionNumberIsEven {
            let leftTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LeftImageTableViewCell", for: indexPath)
            let leftCell = leftTableViewCell as! LeftImageTableViewCell
            leftCell.configureCell(with: currentEpisode)
            return leftTableViewCell
        } else {
            let rightTableViewCell = tableView.dequeueReusableCell(withIdentifier: "RightImageTableViewCell", for: indexPath)
            let rightCell = rightTableViewCell as! RightImageTableViewCell
            rightCell.configureCell(with: currentEpisode)
            return rightTableViewCell
        }
    }
    
}

//// MARK: - Search Bar Delegate
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchTerm = searchBar.text
        searchBar.resignFirstResponder()
//        dump(filteredEpisodes)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTerm = searchBar.text
        print(filteredEpisodes)
        gotTableView.reloadData()
    }

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        gotTableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        gotTableView.reloadData()
    }

}

// MARK: - Personal Methods
extension ViewController {
    func fetchNumberOfSeasons(from episodes: [GOTEpisode]) -> Int {
        let listOfSeasons = filteredEpisodes.reduce([], {$0.contains($1.season) ? $0 : $0 + [$1.season]})
        print("list of seasons \(listOfSeasons)")
        return (listOfSeasons.count)
    }
    
    func fetchNumberOfEpisodesIn(season: Int) -> Int {
        let episodes = filteredEpisodes.filter{$0.season == season}.sorted{$0.number < $1.number}
        return episodes.count
    }
    
    func fetchEpisodes(from sectionNum: Int) -> [GOTEpisode] {
        let seasonNum = sectionNum + 1
        let episodes = filteredEpisodes.filter{$0.season == seasonNum}.sorted{$0.number < $1.number}
        return episodes
    }
    
    func fetchSingleEpisode(sectionNum: Int, episodeNum: Int) -> GOTEpisode {
//        dump(filteredEpisodes)
        let seasonNum = sectionNum + 1
        let episodes = filteredEpisodes.filter{$0.season == seasonNum}.sorted{$0.number < $1.number}
        return episodes[episodeNum]
    }
    
    func fetchTitle(of season: Int) -> String {
        let seasonNum = season + 1
        return "Season \(seasonNum)"
    }
}

extension String {
    var isFull: Bool {
        return !self.isEmpty
    }
}



