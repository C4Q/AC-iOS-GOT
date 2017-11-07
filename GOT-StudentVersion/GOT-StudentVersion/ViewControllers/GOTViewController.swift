//
//  GOTViewController.swift
//  GOT-StudentVersion
//
//  Created by Luis Calle on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GOTViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var allGOTEpisodesBySeason = [Int: [GOTEpisode]]()
    var modelGOT = GOTModel()
    
    @IBOutlet weak var tableViewGOT: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewGOT.delegate = self
        tableViewGOT.dataSource = self
        loadGOTData()
    }
    
    func loadGOTData() {
        allGOTEpisodesBySeason = modelGOT.makeGOTEpisodesDictionary(GOTEpisodes: GOTEpisode.allEpisodes)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let answer = allGOTEpisodesBySeason[section] else {
            return 0
        }
        return answer.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season " + String(section + 1)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return allGOTEpisodesBySeason.count
    }
    
    /*
    https://stackoverflow.com/questions/31381762/swift-ios-8-change-font-title-of-section-in-a-tableview
    used this reference to change the section title font and background color
    */
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "Gurmukhi MN", size: 19)!
        header.backgroundView?.backgroundColor = UIColor(red: 0.7608, green: 0.7294, blue: 0.7137, alpha: 1.0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if indexPath.section % 2 == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "Left GOT Cell", for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "Right GOT Cell", for: indexPath)
        }
        let season = indexPath.section
        let episode = indexPath.row
        let fullEpisode:GOTEpisode = allGOTEpisodesBySeason[season]![episode]
        if let cell = cell as? LeftGOTTableViewCell {
            cell.episodeImage.image = UIImage(named: fullEpisode.mediumImageID)
            cell.episodeTitleLabel.text = fullEpisode.name
            cell.episodeNumAndSeasonLabel.text = "S:\(fullEpisode.season) E:\(fullEpisode.number)"
        } else if let cell = cell as? RightGOTTableViewCell {
            cell.episodeImage.image = UIImage(named: fullEpisode.mediumImageID)
            cell.episodeTitleLabel.text = fullEpisode.name
            cell.episodeNumAndSeasonLabel.text = "S:\(fullEpisode.season) E:\(fullEpisode.number)"
        } else {
            return cell
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GOTDetailedViewController {
            let selectedEpisodeRow = tableViewGOT.indexPathForSelectedRow!.row
            let selectedSeason = tableViewGOT.indexPathForSelectedRow?.section
            let selectedEpisode = self.allGOTEpisodesBySeason[selectedSeason!]![selectedEpisodeRow]
            destination.episodeGOT = selectedEpisode
        }
    }
 

}
