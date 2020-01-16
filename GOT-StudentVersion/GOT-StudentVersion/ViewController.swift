//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var episodes = GOTEpisode.allEpisodes
    
    
    @IBOutlet weak var tableView: UITableView!
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return GOTEpisode.seasonOne.count
        case 1:
            return GOTEpisode.seasonTwo.count
        case 2:
            return GOTEpisode.seasonThree.count
        case 3:
            return GOTEpisode.seasonFour.count
        case 4:
            return GOTEpisode.seasonFive.count
        case 5:
            return GOTEpisode.seasonSix.count
        case 6:
            return GOTEpisode.seasonSeven.count
        default:
            return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "oddSeasonCell", for: indexPath) as? GOTSeasonsTableViewCell {
                cell.oddSeasonEpLabel.text = GOTEpisode.seasonOne[indexPath.row].description
                cell.oddSeasonImageView.image = UIImage(named: GOTEpisode.seasonOne[indexPath.row].mediumImageID)
                cell.oddEpisodeName.text = GOTEpisode.seasonOne[indexPath.row].name
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "evenSeasonCell", for: indexPath) as? GOTSeasonsTableViewCell {
                cell.evenSeasEpLabel.text = GOTEpisode.seasonTwo[indexPath.row].description
                cell.evenSeasonImageView.image = UIImage(named: GOTEpisode.seasonTwo[indexPath.row].mediumImageID)
                cell.evenEpisodeName.text = GOTEpisode.seasonTwo[indexPath.row].name
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "oddSeasonCell", for: indexPath) as? GOTSeasonsTableViewCell {
                cell.oddSeasonEpLabel.text = GOTEpisode.seasonThree[indexPath.row].description
                cell.oddSeasonImageView.image = UIImage(named: GOTEpisode.seasonThree[indexPath.row].mediumImageID)
                cell.oddEpisodeName.text = GOTEpisode.seasonThree[indexPath.row].name
                return cell
            }
        case 3:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "evenSeasonCell", for: indexPath) as? GOTSeasonsTableViewCell {
                    cell.evenSeasEpLabel.text = GOTEpisode.seasonFour[indexPath.row].description
                    cell.evenSeasonImageView.image = UIImage(named: GOTEpisode.seasonFour[indexPath.row].mediumImageID)
                    cell.evenEpisodeName.text = GOTEpisode.seasonFour[indexPath.row].name
                    return cell
            }
        case 4:
                    if let cell = tableView.dequeueReusableCell(withIdentifier: "oddSeasonCell", for: indexPath) as? GOTSeasonsTableViewCell {
                        cell.oddSeasonEpLabel.text = GOTEpisode.seasonFive[indexPath.row].description
                        cell.oddSeasonImageView.image = UIImage(named: GOTEpisode.seasonFive[indexPath.row].mediumImageID)
                        cell.oddEpisodeName.text = GOTEpisode.seasonFive[indexPath.row].name
                        return cell
            }
        case 5:
                        if let cell = tableView.dequeueReusableCell(withIdentifier: "evenSeasonCell", for: indexPath) as? GOTSeasonsTableViewCell {
                            cell.evenSeasEpLabel.text = GOTEpisode.seasonSix[indexPath.row].description
                            cell.evenSeasonImageView.image = UIImage(named: GOTEpisode.seasonSix[indexPath.row].mediumImageID)
                            cell.evenEpisodeName.text = GOTEpisode.seasonSix[indexPath.row].name
                            return cell
                        }
        case 6:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "oddSeasonCell", for: indexPath) as? GOTSeasonsTableViewCell {
                cell.oddSeasonEpLabel.text = GOTEpisode.seasonSeven[indexPath.row].description
                cell.oddSeasonImageView.image = UIImage(named: GOTEpisode.seasonSeven[indexPath.row].mediumImageID)
                cell.oddEpisodeName.text = GOTEpisode.seasonSeven[indexPath.row].name
                return cell
            }
        default:
            break
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {
            fatalError("No identifier in segue")
        }
        switch segueIdentifier {
        case "segueForOddSeasons":
            guard let episodeDetailVCOdd = segue.destination as? DetailEpisodeViewController else {
                fatalError("Unexpected segue VC")
            }
            guard let selectedIndexPathOdd = tableView.indexPathForSelectedRow else {
                fatalError("No row was selected")
            }
            //variable below tells us which season we are in
            let episodesFiltered = episodes.filter { (episode) -> Bool in
                return episode.season == selectedIndexPathOdd.section + 1
            }
            
            episodeDetailVCOdd.episode = episodesFiltered[selectedIndexPathOdd.row]
        case "segueForEvenSeasons":
            guard let episodeDetailVCEven = segue.destination as? DetailEpisodeViewController else {
                fatalError("Unexpected segue VC")
            }
            guard let selectedIndexPathEven = tableView.indexPathForSelectedRow else {
                fatalError("No row was selected")
            }
            let episodesFiltered = episodes.filter { (episode) -> Bool in
                return episode.season == selectedIndexPathEven.section + 1
            }
            
            episodeDetailVCEven.episode = episodesFiltered[selectedIndexPathEven.row]
        default:
            fatalError("Unexpected segue identifier")
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

