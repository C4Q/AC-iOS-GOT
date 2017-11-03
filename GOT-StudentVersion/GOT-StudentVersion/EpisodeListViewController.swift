//
//  EpisodeListViewController.swift
//  GOT-StudentVersion
//
//  Created by Reiaz Gafar on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class EpisodeListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let gotEpisodes = GOTEpisode.allEpisodes
    
    let testing = GOTEpisode.allEpisodesBySeason
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return testing.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testing[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section % 2 == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "leftAlignCell", for: indexPath)
            
            
            if let cell = cell as? LeftImageCustomTableViewCell {
                cell.episodeImageView.image = UIImage(named: testing[indexPath.section][indexPath.row].mediumImageID)
                cell.episodeTitleLabel.text = testing[indexPath.section][indexPath.row].name
                cell.episodeInformationLabel.text = "Season: \(testing[indexPath.section][indexPath.row].season) Episode: \(testing[indexPath.section][indexPath.row].number)"
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "rightAlignCell", for: indexPath)
            
            if let cell = cell as? RightImageCustomTableViewCell {
                cell.episodeImageView.image = UIImage(named: testing[indexPath.section][indexPath.row].mediumImageID)
                cell.episodeTitleLabel.text = testing[indexPath.section][indexPath.row].name
                cell.episodeInformationLabel.text = "Season: \(testing[indexPath.section][indexPath.row].season) Episode: \(testing[indexPath.section][indexPath.row].number)"
                return cell
            }
        }
        return tableView.cellForRow(at: indexPath)!
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? EpisodeDetailViewController {
            let selectedRow = tableView.indexPathForSelectedRow!.row
            let selectedEpisode = self.gotEpisodes[selectedRow]
            destination.episode = selectedEpisode

        }
    }
    
}

