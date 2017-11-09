//
//  GOTEpisodeTableViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/8/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTEpisodeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var selectedEpisode: GOTEpisode?
    
    let seasons: [GOTSeason] = GOTSeason.seasonsUsingEpisodes(episodes: GOTEpisode.allEpisodes)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        //set the array
        //episodes = GOTEpisode.allEpisodes
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return seasons.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasons[section].episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let season = seasons[indexPath.section]
        let episode = season.episodes[indexPath.row]
        
        let image = UIImage(named: episode.mediumImageID)
        let titleDetail = episode.name
        let episodeDetail = "S:\(episode.season) E:\(episode.number)"
        
        if indexPath.section % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LeftCell", for: indexPath) as! LeftImageTableViewCell
            cell.episodeImageView.image = image
            cell.titleLabel.text = titleDetail
            cell.episodeDetailLabel.text = episodeDetail
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RightCell", for: indexPath) as! RightImageTableViewCell
            cell.episodeImageView.image = image
            cell.titleLabel.text = titleDetail
            cell.episodeDetailLabel.text = episodeDetail
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let season = seasons[section]
        
        return "Season \(season.seasonNum)"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell),
            let detailVC = segue.destination as? EpisodeDetailViewController
            else { return }
        
            let season = seasons[indexPath.section]
            let episode = season.episodes[indexPath.row]
            
            detailVC.episode = episode
        
            // get the indexpath of the selected cell
            // get the correct episode from episodes
            
            // get the desination ViewController from the segue as? DetailVC
            
            // the the episode in the DetailVC
//            if let detailVC = segue.destination as? EpisodeDetailViewController {
//                // this is wrong. Need to pass the correct episode
//                detailVC.episode = episodes[0]
//            }
        
    }
    
}
