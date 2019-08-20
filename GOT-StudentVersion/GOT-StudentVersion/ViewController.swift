//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //    var seasonOne = GOTEpisode.allEpisodes.filter {$0.season == 1}
    //    var seasonTwo = GOTEpisode.allEpisodes.filter {$0.season == 2}
    //    var seasonThree = GOTEpisode.allEpisodes.filter {$0.season == 3}
    //    var seasonFour = GOTEpisode.allEpisodes.filter {$0.season == 4}
    //    var seasonFive = GOTEpisode.allEpisodes.filter {$0.season == 5}
    //    var seasonSix = GOTEpisode.allEpisodes.filter {$0.season == 6}
    //    var seasonSeven = GOTEpisode.allEpisodes.filter {$0.season == 7}
    //    var seasonEight = GOTEpisode.allEpisodes.filter {$0.season == 8}
    
    var allGOT = GOTEpisode.filterAndStoreBySeason()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
//        allGOT = GOTEpisode.filterAndStoreBySeason()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let epDetailVC = segue.destination as? EpisodeDetailViewController else { return }
        let episode = allGOT[indexPath.section][indexPath.row]
        epDetailVC.delegate = episode
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return allGOT.count // 7, maybe 8 seasons
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGOT[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Season 1"
        case 1:
            return "Season 2"
        case 2:
            return "Season 3"
        case 3:
            return "Season 4"
        case 4:
            return "Season 5"
        case 5:
            return "Season 6"
        case 6:
            return "Season 7"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ep = allGOT[indexPath.section][indexPath.row]
        
        //Gotta remember index starts at zero
        if indexPath.section % 2 == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "oddCell", for: indexPath) as? OddNumberSeasonCell else {fatalError()}
            
            cell.thumbnail?.image = UIImage(named: ep.originalImageID)
            cell.episodeTitle?.text = ep.name
            cell.episodeNumber?.text = "S: \(ep.season) E: \(ep.number)"
            
            return cell
        }else if indexPath.section % 2 == 1{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "evenCell", for: indexPath) as? EvenNumberSeasonCell else {fatalError()}
            
            cell.thumbnail?.image = UIImage(named: ep.originalImageID)
            cell.episodeTitle?.text = ep.name
            cell.episodeNumber?.text = "S: \(ep.season) E: \(ep.number)"
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}
