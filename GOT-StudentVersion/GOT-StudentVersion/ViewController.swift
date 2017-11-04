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
    
    
    
    var episodes = GOTEpisode.allEpisodes
    
    func loadData() {
        self.episodes = GOTEpisode.allEpisodes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        gotTableView.delegate = self
        gotTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leftcell = gotTableView.dequeueReusableCell(withIdentifier: "leftside", for: indexPath)
        let rightcell = gotTableView.dequeueReusableCell(withIdentifier: "rightside", for: indexPath)
        
        let anEpisode = episodes[indexPath.row]
        
        if indexPath.row % 2 == 0 {
            if let episodeCell = leftcell as? GOTTableViewCell {
                episodeCell.leftEpisodeTitleLabel.text = anEpisode.name
                episodeCell.leftSeasonNumEpisodeNumLabel.text = "S: \(anEpisode.season), E: \(anEpisode.number)"
                episodeCell.leftEpisodeImage.image = UIImage(named: anEpisode.mediumImageID)
            }
            
            return leftcell
        } else {
            if let episodeCell = rightcell as? GOTTableViewCell {
                episodeCell.rightEpisodeTitleLabel.text = anEpisode.name
                episodeCell.rightSeasonNumEpisodeNumLabel.text = "S: \(anEpisode.season), E: \(anEpisode.number)"
                episodeCell.rightEpisodeImage.image = UIImage(named: anEpisode.mediumImageID)
            }
            return rightcell
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7-1 //make a way to get this from sorting a set of the Int that was the seasons
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedRow = indexPath.row
//        let selectedSection = indexPath.section
//        episodes[selectedSection][selectedRow]
//        tableView.reloadData()
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Season One"
        case 1:
            return "Season Two"
        case 2:
            return "Season Three"
        case 3:
            return "Season Four"
        case 4:
            return "Season Five"
        case 5:
            return "Season Six"
        default:
            return "Season Seven"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination
         //FOR MORE THAN ONE SEGUE use a switch that switches on the segue identifyer
         switch segue.identifier! {
         case "detailedViewSegue":
         if let destination = segue.destination as? DetailedViewController {
         let selectedRow = self.gotTableView.indexPathForSelectedRow!.row
         let selectedEpisode = self.episodes[selectedRow]
         destination.detailedEpisode = selectedEpisode
         }
         case "detailedViewSegue2":
            if let destination = segue.destination as? DetailedViewController {
                let selectedRow = self.gotTableView.indexPathForSelectedRow!.row
                let selectedEpisode = self.episodes[selectedRow]
                destination.detailedEpisode = selectedEpisode
            }
         default:
         print("You segued to some unknown place")
         }
 
        // Pass the selected object to the new view controller.
    }
    
}

