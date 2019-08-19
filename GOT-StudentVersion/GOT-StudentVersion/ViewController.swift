//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let Episodes = GOTEpisode.allEpisodes
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
 
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> String? {
            switch section {
            case 0: return "season 1"
            case 1: return "season 2"
            case 2: return "season 3"
            case 3: return "season 4"
            case 4: return "season 5"
            case 5: return "season 6"
            case 6: return "season 7"
            default: return "nothing"
            }
            
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return GOTEpisode.season1.count
        case 1: return GOTEpisode.season2.count
        case 2: return GOTEpisode.season3.count
        case 3: return GOTEpisode.season4.count
        case 4: return GOTEpisode.season5.count
        case 5: return GOTEpisode.season6.count
        case 6: return GOTEpisode.season7.count
            
        default: return 0
            //Since we have different sections for each classification of animal, we want each section to have a different number of rows
        }
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentEpisode = GOTEpisode.seasons[indexPath.section][indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as? EpisodesTableViewCell {
            cell.EpisodeName.text = currentEpisode.name
            cell.seasonEpisodeLabel.text = "\(currentEpisode.season)"
            cell.seasonEpisodeImage.image = currentEpisode.getImage()
           
            return cell
            
        }
        return UITableViewCell()
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        // Get the new view controller using segue.destination.
    //        // Pass the selected object to the new view controller.
    //    }
    
}


