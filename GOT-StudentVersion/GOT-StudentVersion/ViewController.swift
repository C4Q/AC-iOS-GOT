//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var gotTableView: UITableView!
    
    var episodes: [[GOTEpisode]] = [[]]
    
    func loadData() {
        episodes[0] = GOTEpisode.allEpisodes.filter({$0.season == 1})
        episodes.append(GOTEpisode.allEpisodes.filter({$0.season == 2}))
        episodes.append(GOTEpisode.allEpisodes.filter({$0.season == 3}))
        episodes.append(GOTEpisode.allEpisodes.filter({$0.season == 4}))
        episodes.append(GOTEpisode.allEpisodes.filter({$0.season == 5}))
        episodes.append(GOTEpisode.allEpisodes.filter({$0.season == 6}))
        episodes.append(GOTEpisode.allEpisodes.filter({$0.season == 7}))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0 :
            return "Season 1"
        case 1:
            return "Season 2"
        case 2:
            return "Season 3"
        case 3:
            return "Season 4"
        case 4:
            return "Season 5"
        case 5:
            return "Season 6"
        case 6:
            return "Season 7"
        default:
            return nil 
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episode = self.episodes[indexPath.section][indexPath.row]
        let left = indexPath.section % 2 == 0
        if left {
            guard let leftCell = gotTableView.dequeueReusableCell(withIdentifier: "GoT Pic Left", for: indexPath) as? GoTTableViewCell else {
                return UITableViewCell()
            }
            leftCell.episodeTitle.text = episode.name
            leftCell.seasonEpisode.text = "S:\(episode.season)" + " " + "E:\(episode.number)"
            leftCell.episodeImage.image = UIImage(named:episode.originalImageID)
            return leftCell
        }
        else {
            guard let rightCell = gotTableView.dequeueReusableCell(withIdentifier: "GoT Pic Right", for: indexPath) as? GoTTableViewCell else {
                return UITableViewCell()
            }
            rightCell.episodeTitleRight.text = episode.name
            rightCell.seasonEpisodeRIght.text = "S:\(episode.season)" + " " + "E:\(episode.number)"
            rightCell.episodeImageRight.image = UIImage(named:episode.originalImageID)
            return rightCell
            
        }
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationEpisode = segue.destination as? GoTEpisodeViewController {
            let selectedSection = gotTableView.indexPathForSelectedRow!.section
            let selectedRow = gotTableView.indexPathForSelectedRow!.row
            let selectedEpisode = self.episodes[selectedSection][selectedRow]
            destinationEpisode.myEpisode = selectedEpisode
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        gotTableView.delegate = self
        gotTableView.dataSource = self 
        // Do any additional setup after loading the view, typically from a nib.
    }



}

