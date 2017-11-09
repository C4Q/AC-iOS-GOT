//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var searchTerm: String? {
        didSet {
            reSetSections()
            self.GOTableView.reloadData()
        }
    }
    var filteredEpisodes: [GOTEpisode] {
        guard self.searchTerm != nil, self.searchTerm != "" else {
        return allEpisodes
        }
        guard let scopeTitles = searchBar.scopeButtonTitles else {
            return allEpisodes
        }
        let selectedIndex = searchBar.selectedScopeButtonIndex
        let filteringCriteria = scopeTitles[selectedIndex]
        switch filteringCriteria {
        case "Name":
            return allEpisodes.filter({$0.name.lowercased().contains(searchTerm!.lowercased())})
        case "Description":
            return allEpisodes.filter({$0.summary.lowercased().contains(searchTerm!.lowercased())})
        default:
            return allEpisodes
        }

    }
   
    @IBOutlet weak var searchBar: UISearchBar!
    var allEpisodes = [GOTEpisode]()
    var sections: [Int] = []
    var numbers: [Int] = []
    @IBOutlet weak var GOTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        GOTableView.delegate = self
        GOTableView.dataSource = self
        self.searchBar.delegate = self
        loadData()
        
    }
    func loadData() {
        self.allEpisodes = GOTEpisode.allEpisodes
        for episode in allEpisodes {
            if !sections.contains(episode.season) {
                sections.append(episode.season)
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSeason = filteredEpisodes.filter{$0.season == self.sections[section]}
        return currentSeason.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let sectionToSetUp = indexPath.section
    if sectionToSetUp % 2 == 0 {
         let episodesInSection = self.filteredEpisodes.filter{$0.season == self.sections[sectionToSetUp]}
       
    let cell = tableView.dequeueReusableCell(withIdentifier: "GOT Cell", for: indexPath)
        if let cell = cell as? GotTableViewCell {
            cell.GOTImageView.image = UIImage(named: episodesInSection[indexPath.row].mediumImageID)
           
           cell.nameLabel?.text = episodesInSection[indexPath.row].name
            cell.numberLabel?.text = "S:\(episodesInSection[indexPath.row].season) E: \(episodesInSection[indexPath.row].number)"
            return cell
        }
    } else {
         let episodesInSection = self.filteredEpisodes.filter{$0.season == self.sections[sectionToSetUp]}
       
    let cell = tableView.dequeueReusableCell(withIdentifier: "GOT Other Cell", for: indexPath)
        if let cell = cell as? GotOtherTableViewCell {
            cell.GOTImageView.image = UIImage(named:episodesInSection[indexPath.row].originalImageID)
            cell.nameLabel?.text = episodesInSection[indexPath.row].name
        cell.numberLabel?.text = " S:\(episodesInSection[indexPath.row].season) E: \(episodesInSection[indexPath.row].number)"
            return cell
        }
        
    }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(sections[section])"
    }
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
    if let destination = segue.destination as? DetailViewController {
        let selectedSection = self.GOTableView.indexPathForSelectedRow!.section
        let selectedRow = self.GOTableView.indexPathForSelectedRow!.row
        self.numbers = [Int]()
        let episodesInSeason = self.filteredEpisodes.filter({$0.season == self.sections[selectedSection]})
        for episode in episodesInSeason {
            if !self.numbers.contains(episode.number) {
                self.numbers.append(episode.number)
            }
        }
        let currentEpisode = self.filteredEpisodes.filter({($0.season == self.sections[selectedSection] ) && ($0.number == self.numbers[selectedRow])})
        destination.episode = currentEpisode[0]
    }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchBar.text
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchTerm = searchBar.text
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        reSetSections()
      self.GOTableView.reloadData()
    }
    
    func reSetSections() {
        self.sections = [Int]()
        
        for episode in filteredEpisodes {
            if !sections.contains(episode.season) {
                sections.append(episode.season)
            }
        }
       
    }
    
}

