//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var allEpisodes = [GOTEpisode]()
    var sections: [Int] = []
    @IBOutlet weak var GOTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        GOTableView.delegate = self
        GOTableView.dataSource = self
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
    let currentSeason = allEpisodes.filter{$0.season == section + 1}
        return currentSeason.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let sectionToSetUp = indexPath.section
    if sectionToSetUp % 2 == 0 {
        let episodesInSection = self.allEpisodes.filter{$0.season == sectionToSetUp + 1}
    let cell = tableView.dequeueReusableCell(withIdentifier: "GOT Cell", for: indexPath)
        if let cell = cell as? GotTableViewCell {
            cell.GOTImageView.image = UIImage(named: episodesInSection[indexPath.row].mediumImageID)
           
           cell.nameLabel?.text = episodesInSection[indexPath.row].name
            cell.numberLabel?.text = "S:\(episodesInSection[indexPath.row].season) E: \(episodesInSection[indexPath.row].number)"
            return cell
        }
    } else {
        let episodesInSection = self.allEpisodes.filter{$0.season == sectionToSetUp + 1}
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
        let currentEpisode = self.allEpisodes.filter({($0.season == selectedSection + 1) && ($0.number == selectedRow + 1)})
        destination.episode = currentEpisode[0]
    }
    
    }
    
    
    
    
    
    
    
}

