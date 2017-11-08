//
//  SeasonsViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SeasonsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSections()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
    }
    
    
    var arrayOfThrones = [[GOTEpisode]]()
    
    
    var searchWord: String? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var filteredThrones: [[GOTEpisode]] {
        guard let searchWord = searchWord, searchWord != "" else {
            return arrayOfThrones
        }
        
        return [GOTEpisode.allEpisodes.filter{$0.name.lowercased().contains(searchWord.lowercased())}]
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredThrones.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredThrones[section].count
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        if filteredThrones.count == 1 {
            return nil
        }
        
        var season = 0
        for _ in 1...filteredThrones.count{
            season = section + 1
        }
        return "Season \(season)"
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view:UIView, forSection: Int) {
        if let headerTitle = view as? UITableViewHeaderFooterView {
            headerTitle.textLabel?.textColor = UIColor.white
            headerTitle.tintColor = UIColor.black
        }
    }


    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let section = indexPath.section
        let seasonToSetUp = filteredThrones[section][row]
        let sectionIsEven = section % 2 == 0
        let cell = (sectionIsEven) ? (self.tableView.dequeueReusableCell(withIdentifier: "Find Episode", for: indexPath)) : (self.tableView.dequeueReusableCell(withIdentifier: "Find Episode Right Aligned", for: indexPath))
        
        if sectionIsEven, let cell  = cell as? GOTSeasonCell {
            cell.seasonEpisodeNameLabel.text = seasonToSetUp.name
            cell.seasonEpisodeNumberSeasonLabel.text = "S\(seasonToSetUp.season) : E\(seasonToSetUp.number)"
            cell.seasonImage.image = UIImage(named: seasonToSetUp.mediumImageID)
            return cell
        }
            
        else
            if let cell = cell as? GOTSeasonCell {
                cell.rightSideSeasonImage?.image = UIImage(named: seasonToSetUp.mediumImageID)
                cell.rightSideEpisodeNameLabel.text = seasonToSetUp.name
                cell.rightSideEpisodeNumberSeasonLabel.text = "S\(seasonToSetUp.season) : E\(seasonToSetUp.number)"
                return cell
        }
        
        return UITableViewCell()
    }
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchWord = searchBar.text
        searchBar.resignFirstResponder()
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchWord = searchText
    
    }


    func setUpSections() {
        for number in 1...7 {
            arrayOfThrones.append(GOTEpisode.allEpisodes.filter{$0.season == number})
        }
        print(arrayOfThrones)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EpisodesViewController {
            destination.episodes = filteredThrones[tableView.indexPathForSelectedRow!.section][tableView.indexPathForSelectedRow!.row]
        }
    }
    
    
}



