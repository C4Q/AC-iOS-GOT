//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let gotEpisodes = GOTEpisode.allEpisodes
    let gotSeasons = GOTEpisode.GetSeasonDict()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        gotEpisodes[gotEpisodes.count - 1].season
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let episodesInSeason = gotSeasons[section + 1] else { return 0 }
        return episodesInSeason
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Episode Cell", for: indexPath)
        print("Section: \(indexPath.section), Row: \(indexPath.row)")
        
        for episode in gotEpisodes {
            if indexPath.section == (episode.season - 1) && indexPath.row == (episode.number - 1) {
                cell.textLabel?.text = episode.name
                cell.detailTextLabel?.text = "S: \(episode.season) E: \(episode.number)"
                cell.imageView?.image = UIImage(named: episode.mediumImageID)
                
            }
        }
        
//        cell.detailTextLabel?.text = "S: \(gotEpisodes[indexPath.row].season) E: \(gotEpisodes[indexPath.row].number)"
//        cell.imageView?.image = UIImage(named: gotEpisodes[indexPath.row].mediumImageID)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Season \(section + 1)"
    }
}

