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
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // account for per season
        let season = section + 1
        
        let episodesThisSeason = gotEpisode.filter { $0.season == season }
        
        return episodesThisSeason.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let season = indexPath.section + 1
        let episodesThisSeason = gotEpisode.filter { $0.season == season }

        
        let episode = episodesThisSeason[indexPath.row]
        guard episode.season % 2 == 0 else {
            let episodeCell = tableView.dequeueReusableCell(withIdentifier: "leftAlignedEpisodeCells", for: indexPath)
            if let cell = episodeCell as? GOTLeftAlignedTableViewCell {
                cell.leftAlignedSet(to: episode)
                return cell
            }
            return episodeCell
        }
        let episodeCell = tableView.dequeueReusableCell(withIdentifier: "rightAlignedEpisodeCells", for: indexPath)
        if let episodeCell = episodeCell as? GOTRightAlignedTableViewCell {
            episodeCell.rightAlignedSet(to: episode)
            return episodeCell
    
        }
        return episodeCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let season = section + 1
                return "Season \(season)"
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


//            print("1")
//
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return String(gotEpisode[section].season)
//    }

//guard version
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let episode = self.gotEpisode[indexPath.row]
//    guard episode.season % 2 == 0 else {
//        let episodeCell = tableView.dequeueReusableCell(withIdentifier: "leftAlignedEpisodeCells", for: indexPath)
//        print("1")
//        if let cell = episodeCell as? GOTLeftAlignedTableViewCell {
//            print("2")
//            cell.leftAlignedSet(to: episode)
//            print("3")
//            return cell
//        }
//        print("4")
//        return episodeCell
//    }
//    let episodeCell = tableView.dequeueReusableCell(withIdentifier: "rightAlignedEpisodeCells", for: indexPath)
//    if let episodeCell = episodeCell as? GOTRightAlignedTableViewCell {
//        episodeCell.rightAlignedSet(to: episode)
//        print("5")
//        return episodeCell
//
//    }
//    print("!")
//    return episodeCell
//}

//  if let version
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let episode = self.gotEpisode[indexPath.row]
//        let leftAligned = episode.season % 2 == 0
//        if leftAligned {
//            let episodeCell = tableView.dequeueReusableCell(withIdentifier: "leftAlignedEpisodeCells", for: indexPath)
//            if let episodeCell = episodeCell as? GOTLeftAlignedTableViewCell {
//                let rowToSetUp = indexPath.row
//                let episodeToSetup = gotEpisode[rowToSetUp]
//                episodeCell.episodeNameLabel.text = episodeToSetup.name
//                episodeCell.episodeIndexedLabel.text = "S:\(episodeToSetup.season) E: \(episodeToSetup.number)"
//                episodeCell.episodeMediumImage.image = UIImage(named: String(episodeToSetup.mediumImageID))
//                print("1")
//                return episodeCell
//            }
//        } else {
//            let episodeCell = tableView.dequeueReusableCell(withIdentifier: "rightAlignedEpisodeCells", for: indexPath)
//            if let episodeCell = episodeCell as? GOTRightAlignedTableViewCell {
//                let rowToSetUp = indexPath.row
//                let episodeToSetup = gotEpisode[rowToSetUp]
//                episodeCell.episodeNameLabel.text = episodeToSetup.name
//                episodeCell.episodeIndexLabel.text = "S:\(episodeToSetup.season) E: \(episodeToSetup.number)"
//                episodeCell.episodeMediumImage.image = UIImage(named: String(episodeToSetup.mediumImageID))
//                return episodeCell
//            }
//        }
//        print("2")
//        return UITableViewCell()
//    }

