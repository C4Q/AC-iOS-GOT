//
//  GOTViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var gotEpisode = [GOTEpisode]()
    
    @IBOutlet weak var gotTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotTableView.delegate = self
        gotTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        self.gotEpisode = GOTEpisode.allEpisodes
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotEpisode.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episode = self.gotEpisode[indexPath.row]
        guard episode.season % 2 == 0 else {
            let episodeCell = tableView.dequeueReusableCell(withIdentifier: "leftAlignedEpisodeCells", for: indexPath)
            if let episodeCell = episodeCell as? GOTLeftAlignedTableViewCell {
                episodeCell.leftAlignedSet(to: episode)
                return episodeCell
            }
            return UITableViewCell()
        }
        let episodeCell = tableView.dequeueReusableCell(withIdentifier: "rightAlignedEpisodeCells", for: indexPath)
        if let episodeCell = episodeCell as? GOTRightAlignedTableViewCell {
            episodeCell.rightAlignedSet(to: episode)
            return episodeCell
            
        }
        return UITableViewCell()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GOTDetailViewController {
            let selectedRow = gotTableView.indexPathForSelectedRow!.row
            let selectedEpisode = self.gotEpisode[selectedRow]
            destination.gotEpisodeDetails = selectedEpisode
        }
        
        // Pass the selected object to the new view controller.
    }
}


//
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return String(gotEpisode[section].season)
//    }
