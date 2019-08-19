//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var seasons: [[GOTEpisode]] = GOTEpisode.allSeasons
    
    var filteredSeasons: [[GOTEpisode]] {
        get {
            guard let searchString = searchString else { return seasons }
            
            guard searchString != "" else { return seasons}
            
            if let scopeArrTitles = mySearchBar.scopeButtonTitles {
                let currentIndex = mySearchBar.selectedScopeButtonIndex
                let selectedStr = scopeArrTitles[currentIndex]
                
                return GOTEpisode.getFilteredResults(selectedStr: selectedStr, searchText: searchString)
            }
            
            return seasons
        }
    }
    
    var searchString: String? = nil {
        didSet {
            self.myTableView.reloadData()
        }
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        mySearchBar.delegate = self
        myTableView.rowHeight = 80
        myTableView.sectionHeaderHeight = 40
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSeasons[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let episode = filteredSeasons[indexPath.section][indexPath.row]
       
        let image: UIImage = (UIImage(named: episode.mediumImageID ))!
        
        if indexPath.section % 2 == 0 {
            if let cell = myTableView.dequeueReusableCell(withIdentifier: "SeasonTableViewCell", for: indexPath) as? SeasonTableViewCell {
            
                cell.nameLabel.text = episode.name
                cell.seasonAndNumberLabel.text = "S:\(episode.season) E:\(episode.number)"
                cell.mediumImageLabel.image = image
                return cell
            }
        } else {
            if let cell = myTableView.dequeueReusableCell(withIdentifier: "SeasonTableViewCell2", for: indexPath) as? SeasonTableViewCell2 {
                cell.nameLabel.text = episode.name
                cell.seasonAndNumberLabel.text = "S:\(episode.season) E:\(episode.number)"
                cell.mediumImageLabel.image = image
                return cell
            }
        }
        let cell2 = myTableView.dequeueReusableCell(withIdentifier: "SeasonTableViewCell", for: indexPath)
        cell2.textLabel?.text = "test"
        return cell2
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        

        
        switch section {
    
        case 0:
            return GOTEpisode.Seasons.seasonOne.rawValue
        case 1:
        return GOTEpisode.Seasons.seasonTwo.rawValue
        case 2:
        return GOTEpisode.Seasons.seasonThree.rawValue
        case 3:
        return GOTEpisode.Seasons.seasonFour.rawValue
        case 4:
        return GOTEpisode.Seasons.seasonFive.rawValue
        case 5:
        return GOTEpisode.Seasons.seasonSix.rawValue
        case 6:
        return GOTEpisode.Seasons.seasonSeven.rawValue
        default:
        return "Should not print"
    }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let segueIdentifier = segue.identifier else {fatalError("No identifier selected")}
        
        switch segueIdentifier {
        case "SeasonCellSegue":
            guard let DetailVC = segue.destination as? EpisodeDetailViewController else {fatalError("Unexpected segue VC")}
            
            guard let selectedIndexPath = myTableView.indexPathForSelectedRow else {fatalError("No row selected")}
            
            let currentEpisode = filteredSeasons[selectedIndexPath.section][selectedIndexPath.row]
            
            DetailVC.episode = currentEpisode
            
            case "SeasonCell2Segue":
                guard let DetailVC = segue.destination as? EpisodeDetailViewController else {fatalError("Unexpected segue VC")}
                
                guard let selectedIndexPath = myTableView.indexPathForSelectedRow else {fatalError("No row selected")}
                
                let currentEpisode = filteredSeasons[selectedIndexPath.section][selectedIndexPath.row]
                
                DetailVC.episode = currentEpisode
        default:
            fatalError("unexpected segue indentified")
        }
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchText
        let doShow = (searchText != "")
        setsSearchBarFeatures(searchBar: searchBar, showScopeBar: doShow, ShowsCancel: doShow)
    
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = ""
        searchString = nil
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        setsSearchBarFeatures(searchBar: searchBar, showScopeBar: true, ShowsCancel: true)
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        setsSearchBarFeatures(searchBar: searchBar, showScopeBar: false, ShowsCancel: false)
        return true
    }
    
    func setsSearchBarFeatures(searchBar: UISearchBar, showScopeBar: Bool, ShowsCancel: Bool) {
        searchBar.showsScopeBar = showScopeBar
        searchBar.setShowsCancelButton(ShowsCancel, animated: true)
        searchBar.sizeToFit()
    }

}
