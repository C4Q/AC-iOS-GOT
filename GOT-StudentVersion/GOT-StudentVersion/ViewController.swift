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
    var sectionHeader: [String] = []
    
    func loadEpisodeSectionNames(){
        for episode in episodes{
            if !sectionHeader.contains(String(episode.season)){
                sectionHeader.append(String(episode.season))
            }
        }
    }
    
    func loadData() {
        self.episodes = GOTEpisode.allEpisodes
        loadEpisodeSectionNames()
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
        
        let theSeasons = episodes.filter {String($0.season) == sectionHeader[indexPath.section]}
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
        return sectionHeader.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let theSeasons = episodes.filter { String($0.season) == sectionHeader[section] }
        return theSeasons.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch sectionHeader[section] {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("This is the section \(indexPath.section), This is the row: \(indexPath.row)")
        print("This is season \(indexPath.section + 1)")
    
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var thisSeason = episodes.filter{$0.season == gotTableView.indexPathForSelectedRow!.section + 1}
        
        switch segue.identifier! {
            //fixed issue with detailed view only showing season one episodes when you click cells from other seasons
            
        case "detailedViewSegue":
            if let destination = segue.destination as? DetailedViewController {
                let selectedRow = self.gotTableView.indexPathForSelectedRow!.row
                
                let selectedEpisode = thisSeason[selectedRow]
                print(selectedRow)
                destination.detailedEpisode = selectedEpisode
            }
        case "detailedViewSegue2":
            if let destination = segue.destination as? DetailedViewController {
                let selectedRow = self.gotTableView.indexPathForSelectedRow!.row
                let selectedEpisode = thisSeason[selectedRow]
                print(selectedRow)
                destination.detailedEpisode = selectedEpisode
            }
        default:
            print("You segued to some unknown place")
        }
    }
}

