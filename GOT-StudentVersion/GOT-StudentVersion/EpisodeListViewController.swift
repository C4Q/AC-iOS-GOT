//
//  EpisodeListViewController.swift
//  GOT-StudentVersion
//
//  Created by Reiaz Gafar on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class EpisodeListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    let gotEpisodes = GOTEpisode.allEpisodes
    
    let episodeMatrix = GOTEpisode.allEpisodesBySeason
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var searchTerm: String? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var filteredEpisodes: [[GOTEpisode]] {
        guard let searchTerm = searchTerm, searchTerm != "" else {
            return episodeMatrix
        }
        guard let scopeTitles = searchBar.scopeButtonTitles else {
            return episodeMatrix
        }
        let selectedIndex = searchBar.selectedScopeButtonIndex
        let filteringCriteria = scopeTitles[selectedIndex]
    
        
        switch filteringCriteria {
        case "Title":
            var filteredMatrix = episodeMatrix
            for i in 0..<filteredMatrix.count {
                filteredMatrix[i] = filteredMatrix[i].filter { $0.name.lowercased().contains(searchTerm.lowercased()) }
            }
            return filteredMatrix

        case "Description":
            var filteredMatrix = episodeMatrix
            for i in 0..<filteredMatrix.count {
                filteredMatrix[i] = filteredMatrix[i].filter { $0.summary.lowercased().contains(searchTerm.lowercased()) }
            }
            return filteredMatrix
            
        default:
            return episodeMatrix
        }

    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        self.resignFirstResponder()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredEpisodes[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "leftAlignCell", for: indexPath)
            if let cell = cell as? LeftImageCustomTableViewCell {
                let episode = filteredEpisodes[indexPath.section][indexPath.row]
                cell.episodeImageView.image = UIImage(named: episode.mediumImageID)
                cell.episodeTitleLabel.text = episode.name
                cell.episodeInformationLabel.text = "Season: \(episode.season) Episode: \(episode.number)"
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "rightAlignCell", for: indexPath)
            if let cell = cell as? RightImageCustomTableViewCell {
                let episode = filteredEpisodes[indexPath.section][indexPath.row]
                cell.episodeImageView.image = UIImage(named: episode.mediumImageID)
                cell.episodeTitleLabel.text = episode.name
                cell.episodeInformationLabel.text = "Season: \(episode.season) Episode: \(episode.number)"
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? EpisodeDetailViewController {
            let selectedSection = tableView.indexPathForSelectedRow!.section
            let selectedRow = tableView.indexPathForSelectedRow!.row
            let selectedEpisode = self.filteredEpisodes[selectedSection][selectedRow]
            destination.episode = selectedEpisode

        }
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchTerm = searchBar.text
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTerm = searchText
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        tableView.reloadData()
    }
    

    
    
}


