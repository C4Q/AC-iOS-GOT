//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //TODO: connect searchbar, extend searchbardelegate
        
    //MARK:  --Outlets
    @IBOutlet weak var gotTableView: UITableView!
    
    //will return an array, when calling data in function, use indexpath to get the element needed
    var data = EpisodeData.allEpisodes
    let gotSeasons = EpisodeData.allSeasons
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProtocols()
    }
    
    private func setupProtocols() {
        gotTableView.delegate = self
        gotTableView.dataSource = self
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotSeasons[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gotSeason = gotSeasons[indexPath.section][indexPath.row]
        
        if gotSeason.season % 2 == 1 {
            if let cell = gotTableView.dequeueReusableCell(withIdentifier: "oddCell", for: indexPath) as? oddGOTTVCell {
                cell.oddTitleLabel?.text = gotSeason.name
                cell.oddEpisodeInfoLabel?.text = "s:  \(String(gotSeason.season)) ep: \(gotSeason.number)"
                cell.oddImage.image = UIImage(named: gotSeason.mediumImageID)
                
                return cell
            }
        } else if gotSeason.season % 2 == 0 {
            if let cell = gotTableView.dequeueReusableCell(withIdentifier: "evenCell", for: indexPath) as? evenGOTTVCell {
                cell.evenTitleLabel?.text = gotSeason.name
                cell.evenEpisodeLabel?.text = "s:  \(String(gotSeason.season)) ep: \(gotSeason.number)"
                cell.evenImage.image = UIImage(named: gotSeason.mediumImageID)
                
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return gotSeasons.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let gotSeason = gotSeasons[section].first?.season {
        
        return "season \(gotSeason)"
        }
        return "well that didn't work"
    }
}
