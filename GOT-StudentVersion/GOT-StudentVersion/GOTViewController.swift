//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GotViewCell: UITableViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
}

class GOTViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        let cell =  indexPath.section % 2 == 0 ? tableView.dequeueReusableCell(withIdentifier: "Episode Cell", for: indexPath) as! GotViewCell :
            tableView.dequeueReusableCell(withIdentifier: "Alternate Episode Cell", for: indexPath) as! GotViewCell
        
        print("Section: \(indexPath.section), Row: \(indexPath.row)")
        
        for episode in gotEpisodes {
            if indexPath.section == (episode.season - 1) && indexPath.row == (episode.number - 1) {
                cell.titleLabel?.text = episode.name
                cell.summaryLabel?.text = "S: \(episode.season) E: \(episode.number)"
                cell.cellImage?.image = UIImage(named: episode.mediumImageID)
            }
        }
        
//        cell.detailTextLabel?.text = "S: \(gotEpisodes[indexPath.row].season) E: \(gotEpisodes[indexPath.row].number)"
//        cell.imageView?.image = UIImage(named: gotEpisodes[indexPath.row].mediumImageID)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Season \(section + 1)"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell was selected at \(indexPath.row)")
        
    }
}

