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
    var finalEpisodeSeasonNum = GOTEpisode.allEpisodes[GOTEpisode.allEpisodes.count-1].season
    var thisDamSectionHeaderWontWork: [String] = []
    
    func loadTheDamEpisodeSectionNames(){
        for episode in episodes{
            if !thisDamSectionHeaderWontWork.contains(String(episode.season)){
                thisDamSectionHeaderWontWork.append(String(episode.season))
            }
        }
    }
    
    func loadData() {
        self.episodes = GOTEpisode.allEpisodes
        loadTheDamEpisodeSectionNames()
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
        
        let theSeasons = episodes.filter {String($0.season) == thisDamSectionHeaderWontWork[indexPath.section]}
        let anEpisode = theSeasons[indexPath.row]
        
        if anEpisode.season % 2 == 1 {
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
        return thisDamSectionHeaderWontWork.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let theSeasons = episodes.filter { String($0.season) == thisDamSectionHeaderWontWork[section] }
        return theSeasons.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch thisDamSectionHeaderWontWork[section] {
        case "1":
            return "Season One"
        case "2":
            return "Season Two"
        case "3":
            return "Season Three"
        case "4":
            return "Season Four"
        case "5":
            return "Season Five"
        case "6":
            return "Season Six"
        case "7":
            return "Season Seven"
        default:
            return "Future Episodes"
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

