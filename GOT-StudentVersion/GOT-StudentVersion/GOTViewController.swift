//
//  GOTViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    
 
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var gotSeasons: [[GOTEpisode]] = []
    
    

   
    override func viewDidLoad() {
        //delegates fun
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
        
        
       // setting up array of arrays for sorted episodes in corresponding seasons
        
        var seasons: Set<Int> = []
        GOTEpisode.allEpisodes.forEach{seasons.insert($0.season)}
        
        var seasonsArr = [Int]()
        for seasons in seasons{
            seasonsArr.append(seasons)
        }
        seasonsArr = seasonsArr.sorted()
        
        for season in seasonsArr{
            gotSeasons.append(GOTEpisode.allEpisodes.filter{$0.season == season})
        }
    }
    
    
    
    
    // SEARCHBAR METHODS YO.
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        tableView.reloadData()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.searchTerm = searchBar.text
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchText
    }
    
    //SEARCHBAR FILTER INSANITY
    
    var searchTerm: String? {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    var filteredSeasons: [[GOTEpisode]]{
        guard let searchTerm = searchTerm, searchTerm != ""  else {
            return gotSeasons
        }
        
        guard let scopeTitles = self.searchBar.scopeButtonTitles else{
            return gotSeasons
        }
        
        var filteredEpisodes : [GOTEpisode] = []
        var finalArr: [[GOTEpisode]] = []
        let selectedIndex = self.searchBar.selectedScopeButtonIndex
        let filteringCriteria = scopeTitles[selectedIndex]
        
        switch filteringCriteria {
            
        case "Title":
            
            for season in gotSeasons{
                for episode in season{
                    if episode.name.lowercased().contains(searchTerm.lowercased()){
                        filteredEpisodes.append(episode)
                    }
                }
                finalArr.append(filteredEpisodes)
                filteredEpisodes = []
            }
            
        case "Description":
            
            for season in gotSeasons{
                for episode in season{
                    
                    if episode.summary.lowercased().contains(searchTerm.lowercased()){
                        filteredEpisodes.append(episode)
                    }
                }
                finalArr.append(filteredEpisodes)
                filteredEpisodes = []
            }
            
        default:
            return gotSeasons
        }
        return finalArr
        
        
        }
    

    
    

   


    
    
    
  //TABLEVIEW METHODS YO
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredSeasons[section].count
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return filteredSeasons.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GOT Cell", for: indexPath)
        let altCell = tableView.dequeueReusableCell(withIdentifier: "GOT Cell Alt", for: indexPath)
        let rowToSetUp = indexPath.row
        let sectionToSet = indexPath.section
        let seasonToSet = filteredSeasons[sectionToSet]
        let episodeToSet = seasonToSet[rowToSetUp]
        
        if sectionToSet % 2 == 1 {
            if let cell = cell as? GOTTableViewCell{
                cell.gotTitle.text = episodeToSet.name
                cell.gotDetail.text = "S:" + episodeToSet.season.description + " " + "E:" + episodeToSet.number.description
                cell.gotImage.image = UIImage(named: episodeToSet.mediumImageID.description)
                return cell
            }
        }
       
            if sectionToSet % 2 == 0 {
                if let cell = altCell as? GOTAltTableViewCell{
                    cell.gotTitle.text = episodeToSet.name
                    cell.gotDescription.text = "S:" + episodeToSet.season.description + " " + "E:" + episodeToSet.number.description
                    cell.gotImage.image = UIImage(named: episodeToSet.mediumImageID.description)
                    return cell
                }
        }
            return cell
        }

    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        let section = section + 1
        return "Season: " + section.description
        
    }
    
    
    
    //SEGUE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GOTDetailViewController{
            let selectedRow = tableView.indexPathForSelectedRow!.row
            let selectedSection = tableView.indexPathForSelectedRow!.section
            let selectedSeason = filteredSeasons[selectedSection]
            destination.episode = selectedSeason[selectedRow]
    
        }
    }
  
}

