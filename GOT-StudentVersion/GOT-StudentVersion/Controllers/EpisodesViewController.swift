//
//  EpisodesViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class EpisodesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var gotTableView: UITableView!
    
    
    var myGotEpisodes = [GOTEpisode]()
    // MarkL -- SearchBar Methods --> I need a method while editing as well as another when I enter search as well as a search term to assist the methods
    var filteredGOT: [GOTEpisode] {
        guard let searchTerm = searchTerm, searchTerm != "" else {
            return myGotEpisodes
        }
        guard let scopeTitle = self.mySearchBar.scopeButtonTitles  else {
            return myGotEpisodes
        }
        let selectedIndex = self.mySearchBar.selectedScopeButtonIndex
        let filteringCriteria = scopeTitle[selectedIndex]
        switch filteringCriteria {
        case "Name":
            return myGotEpisodes.filter{$0.name.lowercased().contains(searchTerm.lowercased())}
        case "Season":
            return myGotEpisodes.filter{String($0.season).contains(searchTerm)}
        default:
            return myGotEpisodes
        }
    }
    var searchTerm: String?{
        didSet{
            gotTableView.reloadData()
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchTerm = searchBar.text!
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchText
    }
    
    // Mark: -- table view methods: I need the number of rows as well as the cell formate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let seasonNumber = section + 1
        let episodesInSeason = filteredGOT.filter { $0.season == seasonNumber }
        return episodesInSeason.count
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // to get the number of sections from a sorted array
        let sortedEpisodes = filteredGOT.sorted{$1.season < $0.season}
        guard let numberOfEpisode = sortedEpisodes.first?.season  else {
            return 0
        }
        return numberOfEpisode
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        // to check if section is not empty
        let selectedSecion = filteredGOT.filter{$0.season == (section + 1)}
        if selectedSecion.isEmpty{
            return ""
        }
        return "Season \(section + 1)"
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let seasonNumber = indexPath.section + 1
        let episodesInSeason = filteredGOT.filter { $0.season == seasonNumber }
        if indexPath.section % 2 == 0 {
            guard let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "RighCell") else {
                let defaulTCell = UITableViewCell()
                return defaulTCell
            }
            if let episodeCell = cell as? RightCellTableViewCell{
                let rowSetup = indexPath.row
                let episodeSetup = episodesInSeason[rowSetup]
                episodeCell.EpisodeName.text = episodeSetup.name
                episodeCell.EpisodeSmallPoster.image = UIImage(named: episodeSetup.mediumImageID)
                episodeCell.EpisodeNameAndSeason.text = "S:\(episodeSetup.season) E:\(episodeSetup.number)"
                episodeCell.backgroundColor = UIColor(displayP3Red: CGFloat(Settings.red), green: CGFloat(Settings.green), blue: CGFloat(Settings.blue), alpha: 1)
                episodeCell.EpisodeName.font = UIFont(name: Settings.currentFont, size: CGFloat(Settings.fontSize))
                episodeCell.EpisodeNameAndSeason.font = UIFont(name: Settings.currentFont, size: CGFloat(Settings.fontSize))

                return episodeCell
            }
            return cell
        }
        else{
            guard let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "leftCell") else {
                let defaulTCell = UITableViewCell()
                return defaulTCell
            }
            if let episodeCell = cell as? LeftCellTableViewCell{
                let rowSetup = indexPath.row
                let episodeSetup = episodesInSeason[rowSetup]
                episodeCell.episodeName.text = episodeSetup.name
                episodeCell.episodePoster.image = UIImage(named: episodeSetup.mediumImageID)
                episodeCell.episodeNameAndSeason.text = "S:\(episodeSetup.season) E:\(episodeSetup.number)"
                episodeCell.backgroundColor = UIColor(displayP3Red: CGFloat(Settings.red), green: CGFloat(Settings.green), blue: CGFloat(Settings.blue), alpha: 1)
                episodeCell.episodeName.font = UIFont(name: Settings.currentFont, size: CGFloat(Settings.fontSize))
                episodeCell.episodeNameAndSeason.font = UIFont(name: Settings.currentFont, size: CGFloat(Settings.fontSize))

                return episodeCell
            }
            return cell
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gotTableView.delegate = self
        myGotEpisodes = GOTEpisode.allEpisodes
        gotTableView.dataSource = self
        self.mySearchBar.delegate = self
        // Do any additional setup after loading the view.
    }
    
//    override func viewDidLayoutSubviews() {
//    for soft changes
//        self.gotTableView.reloadData()
//    }
    override func viewWillLayoutSubviews() {
                // for hard changes like constraints
        print(Settings.currentFont)
        self.gotTableView.reloadData()
    }
    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        if let destination = segue.destination as? DetailedEpisodeViewController{
            if let thisCell = sender as? RightCellTableViewCell{
                if let indexPath = gotTableView.indexPath(for: thisCell){
                    let myIndexSection = (gotTableView.indexPathForSelectedRow?.section)! + 1
                    let myFilteredSeason = filteredGOT.filter{$0.season == myIndexSection}
                    destination.episode = myFilteredSeason[indexPath.row]
                }
            }
            if let thisCell = sender as? LeftCellTableViewCell{
                if let indexPath = gotTableView.indexPath(for: thisCell){
                    let myIndexSection = (gotTableView.indexPathForSelectedRow?.section)! + 1
                    let myFilteredSeason = filteredGOT.filter{$0.season == myIndexSection}
                    destination.episode = myFilteredSeason[indexPath.row]
                }
            }
            
        }
        // Pass the selected object to the new view controller.
    }
    
    
}
