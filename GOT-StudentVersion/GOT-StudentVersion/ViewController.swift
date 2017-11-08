//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by Maryann Yin on 11/4/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var gotTableView: UITableView!
 
    static let gotSeasonSections = ["Season 1", "Season 2", "Season 3", "Season 4", "Season 5", "Season 6", "Season 7"]
    
    var gotEpisodesBySeason: [[GOTEpisode]] = Array(repeating: [], count: ViewController.gotSeasonSections.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotTableView.delegate = self
        gotTableView.dataSource = self
        
        for episode in GOTEpisode.allEpisodes {
                let seasons = episode.season
                gotEpisodesBySeason[seasons - 1].append(episode)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return gotEpisodesBySeason.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotEpisodesBySeason[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leftCell = gotTableView.dequeueReusableCell(withIdentifier: "LeftGOTCell", for: indexPath) as! LeftGOTTableViewCell
        let rightCell = gotTableView.dequeueReusableCell(withIdentifier: "RightGOTCell", for: indexPath) as! RightGOTTableViewCell
        let rowToSetUp = indexPath.row
        let currentSection = indexPath.section //NEW
        let gotEpisodeInfo = gotEpisodesBySeason[currentSection][rowToSetUp] //NEW
        let gotSeasonNum = gotEpisodeInfo.season
        let gotEpisodeNum = gotEpisodeInfo.number
        let gotEpisodeTitle = gotEpisodeInfo.name
        let gotEpisodeImageID = gotEpisodeInfo.originalImageID
        if indexPath.section % 2 == 0 {
            rightCell.gotEpisodeTitleLabel.text = gotEpisodeTitle
            rightCell.gotSeasonAndEpisodeNumberLabel.text = "S: \(gotSeasonNum) E: \(gotEpisodeNum)"
            if let gotEpisodeImage = UIImage(named: gotEpisodeImageID) {
                 rightCell.gotEpisodeImageView.image = gotEpisodeImage
            }

            return rightCell
        } else {
            leftCell.episodeTitleLabel.text = gotEpisodeTitle
            leftCell.seasonAndEpisodeNumberLabel.text = "S: \(gotSeasonNum) E: \(gotEpisodeNum)"
            if let gotEpisodePic = UIImage(named: gotEpisodeImageID) {
                leftCell.gotEpisodeImageView.image = gotEpisodePic
            }
            return leftCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return ViewController.gotSeasonSections[section]
        case 1:
            return ViewController.gotSeasonSections[section]
        case 2:
            return ViewController.gotSeasonSections[section]
        case 3:
            return ViewController.gotSeasonSections[section]
        case 4:
            return ViewController.gotSeasonSections[section]
        case 5:
            return ViewController.gotSeasonSections[section]
        case 6:
            return ViewController.gotSeasonSections[section]
        default:
            return nil
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RightGOTCellSegue" || segue.identifier == "LeftGOTCellSegue" {
            var detailedVC = segue.destination as! DetailViewController
            if let indexPath = self.gotTableView.indexPathForSelectedRow {
                var gotEpisode = gotEpisodesBySeason[indexPath.section][indexPath.row]
                detailedVC.episodeTitle = gotEpisode.name
                detailedVC.seasonNumber = String(gotEpisode.season)
                detailedVC.episodeNumber = String(gotEpisode.number)
                detailedVC.episodeRunTime = String(gotEpisode.runtime)
                detailedVC.episodeAirDate = gotEpisode.airdate
                detailedVC.episodeSummary = gotEpisode.summary
                detailedVC.episodeImageID = gotEpisode.originalImageID
            }
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}

