//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var gotEpisode = [GOTEpisode]()
    var gotSeasonEpisode: [(section: Int,episodes: [GOTEpisode])] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //MARK: - Load Data
         gotEpisode = GOTEpisode.allEpisodes
        fillSeasonEpisodes()
    }
    
   
    // MARK: -Table view Data Source Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return gotSeasonEpisode.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(gotSeasonEpisode[section].section)"
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotSeasonEpisode[section].episodes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellPosition = ""
        if indexPath.section % 2 == 0 {
            cellPosition = "Left Episode Cell"
        } else {
            cellPosition = "Right Episode Cell"
        }
        let episode = gotSeasonEpisode[indexPath.section].episodes[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellPosition, for: indexPath) as? GOTTableViewCell
        
        if let unwrappedCell = cell {
            unwrappedCell.titleLabel.text = episode.name
            unwrappedCell.SELabel.text = "S: \(episode.season) E: \(episode.number)"
            unwrappedCell.gotImageView.image = UIImage(named: episode.mediumImageID)
            
            return unwrappedCell
        }
        
        return cell!
        
    }
    
    func fillSeasonEpisodes () {
        let maxSeason = GOTEpisode.allEpisodes.max{$0.season < $1.season ? true: false}!.season
        
        for index in 1..<maxSeason {
            gotSeasonEpisode.append((index, GOTEpisode.allEpisodes.filter{$0.season == index}))
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let detailVC = segue.destination as? DetailViewController,
            let selectedCell = sender as? UITableViewCell,
            let selectedIndexPath = tableView.indexPath(for: selectedCell) {
            
            let selectedSeason = gotSeasonEpisode[selectedIndexPath.section]
            detailVC.episodeInfo = selectedSeason.episodes[selectedIndexPath.row]
            
        }
        
    }

}

