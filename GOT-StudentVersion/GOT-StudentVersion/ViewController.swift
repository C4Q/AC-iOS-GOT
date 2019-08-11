//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let seasons: [[GOTEpisode]] = [
        GOTEpisode.seasonOne,
        GOTEpisode.seasonTwo,
        GOTEpisode.seasonThree,
        GOTEpisode.seasonFour,
        GOTEpisode.seasonFive,
        GOTEpisode.seasonSix,
        GOTEpisode.seasonSeven,
    ]
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasons[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSeason: [GOTEpisode] = seasons[indexPath.section]
        let episode: GOTEpisode = currentSeason[indexPath.row]
        let image: UIImage = (UIImage(named: episode.mediumImageID ))!
        
        if indexPath.section % 2 == 0 {
            if let cell = myTableView.dequeueReusableCell(withIdentifier: "SeasonTableViewCell", for: indexPath) as? SeasonTableViewCell {
                cell.nameLabel.text = episode.name
                cell.seasonAndNumberLabel.text = "S:\(episode.season) E:\(episode.number)"
                cell.mediumImageLabel.image = image
                return cell
            }
        } else {
            if let cell = myTableView.dequeueReusableCell(withIdentifier: "SeasonTableViewCell2", for: indexPath) as? SeasonTableViewCell2 {
                cell.nameLabel.text = episode.name
                cell.seasonAndNumberLabel.text = "S:\(episode.season) E:\(episode.number)"
                cell.mediumImageLabel.image = image
                return cell
            }
        }
        let cell2 = myTableView.dequeueReusableCell(withIdentifier: "SeasonTableViewCell", for: indexPath)
        cell2.textLabel?.text = "test"
        return cell2
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
    
        case 0:
            return GOTEpisode.Seasons.seasonOne.rawValue
        case 1:
        return GOTEpisode.Seasons.seasonTwo.rawValue
        case 2:
        return GOTEpisode.Seasons.seasonThree.rawValue
        case 3:
        return GOTEpisode.Seasons.seasonFour.rawValue
        case 4:
        return GOTEpisode.Seasons.seasonFive.rawValue
        case 5:
        return GOTEpisode.Seasons.seasonSix.rawValue
        case 6:
        return GOTEpisode.Seasons.seasonSeven.rawValue
        default:
        return "Should not print"
    }
        }
}

