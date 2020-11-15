//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by Maryann Yin on 11/4/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet var gotTableView: UITableView!
    
    @IBOutlet var gotEpisodeSearchBar: UISearchBar!
    
    static let gotSeasonSections = ["Season 1", "Season 2", "Season 3", "Season 4", "Season 5", "Season 6", "Season 7"]
    
    var gotEpisodesBySeason: [[GOTEpisode]] = Array(repeating: [], count: ViewController.gotSeasonSections.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotTableView.delegate = self
        gotTableView.dataSource = self
        gotEpisodeSearchBar.delegate = self
        navigationController?.navigationBar.isHidden = true
        
        for episode in GOTEpisode.allEpisodes {
                let seasons = episode.season
                gotEpisodesBySeason[seasons - 1].append(episode)
        }
    }
    
    var searchItem: String? {
        didSet{
            self.gotTableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchItem = searchBar.text
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchItem = searchText
    }
    
    var filteredGOTSeasonsMatrix: [[GOTEpisode]]{
        guard let searchItem = searchItem, searchItem != "" else {
            return gotEpisodesBySeason
        }
        var filteredGOTEpisodes = [GOTEpisode]()
        var finalGOTEpisodeArr = [[GOTEpisode]]()
        for season in gotEpisodesBySeason {
            for episode in season {
                if episode.name.lowercased().contains(searchItem.lowercased()) {
                    filteredGOTEpisodes.append(episode)
                }
            }
            finalGOTEpisodeArr.append(filteredGOTEpisodes)
            filteredGOTEpisodes = []
        }
        return finalGOTEpisodeArr
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredGOTSeasonsMatrix.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGOTSeasonsMatrix[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leftCell = gotTableView.dequeueReusableCell(withIdentifier: "LeftGOTCell", for: indexPath) as! LeftGOTTableViewCell
        let rightCell = gotTableView.dequeueReusableCell(withIdentifier: "RightGOTCell", for: indexPath) as! RightGOTTableViewCell
        let rowToSetUp = indexPath.row
        let currentSection = indexPath.section
        let currentGOTSeason = filteredGOTSeasonsMatrix[currentSection]
        let gotEpisodeInfo = currentGOTSeason[rowToSetUp]
        let gotSeasonNum = gotEpisodeInfo.season
        let gotEpisodeNum = gotEpisodeInfo.number
        let gotEpisodeTitle = gotEpisodeInfo.name
        let gotEpisodeImageID = gotEpisodeInfo.originalImageID
        if indexPath.section % 2 == 0 {
            rightCell.gotEpisodeTitleLabel.text = gotEpisodeTitle
            rightCell.gotSeasonAndEpisodeNumberLabel.text = "S: \(gotSeasonNum) E: \(gotEpisodeNum)"
            if let gotEpisodeImage = UIImage(named: gotEpisodeImageID) {
                 rightCell.gotEpisodeImageView.image = gotEpisodeImage
            }

            return rightCell
        } else {
            leftCell.episodeTitleLabel.text = gotEpisodeTitle
            leftCell.seasonAndEpisodeNumberLabel.text = "S: \(gotSeasonNum) E: \(gotEpisodeNum)"
            if let gotEpisodePic = UIImage(named: gotEpisodeImageID) {
                leftCell.gotEpisodeImageView.image = gotEpisodePic
            }
            return leftCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return ViewController.gotSeasonSections[section]
        case 1:
            return ViewController.gotSeasonSections[section]
        case 2:
            return ViewController.gotSeasonSections[section]
        case 3:
            return ViewController.gotSeasonSections[section]
        case 4:
            return ViewController.gotSeasonSections[section]
        case 5:
            return ViewController.gotSeasonSections[section]
        case 6:
            return ViewController.gotSeasonSections[section]
        default:
            return nil
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            let section = gotTableView.indexPathForSelectedRow?.section
            let row = gotTableView.indexPathForSelectedRow?.row
            let selectedGOTseason = filteredGOTSeasonsMatrix[section!]
            let selectedGOTepisode = selectedGOTseason[row!]
            destination.GOTEpisode = selectedGOTepisode
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
