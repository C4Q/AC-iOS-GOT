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
    @IBOutlet weak var gotSearchBar: UISearchBar!
    
    //will return an array, when calling data in function, use indexpath to get the element needed
    var data = GOTEpisode.allEpisodes {
        didSet {
            gotTableView.reloadData()
        }
    }
    let gotSeasons = GOTEpisode.allSeasons
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProtocols()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if/else
        guard let destination = segue.destination as? DetailViewController,
            let cellSelected = gotTableView.indexPathForSelectedRow else {return}
        let episodeSelected = gotSeasons[cellSelected.section][cellSelected.row]
        
        
        if segue.identifier == "oddEpisode"  {
            destination.gotData = episodeSelected
        } else if segue.identifier == "evenEpisode" {
            destination.gotData = episodeSelected
        }
    }
    
    
    
    
    private func setupProtocols() {
        gotTableView.delegate = self
        gotTableView.dataSource = self
        gotSearchBar.delegate = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotSeasons[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gotSeason = gotSeasons[indexPath.section][indexPath.row]
        let customView = UIView()
        customView.backgroundColor = UIColor(red: 59/255, green: 90/255, blue: 99/255, alpha: 0.5)
        let gotColor = UIColor(red: 12/255, green: 29/255, blue: 66/255, alpha: 1)
        var cell = oddGOTTVCell()
        
        switch gotSeason.season % 2 {
        case 0:
            cell = gotTableView.dequeueReusableCell(withIdentifier: "evenCell", for: indexPath) as! oddGOTTVCell
        case 1:
            cell = gotTableView.dequeueReusableCell(withIdentifier: "oddCell", for: indexPath) as! oddGOTTVCell
        default:
            cell = oddGOTTVCell()
        }
        
        cell.backgroundColor = gotColor
        cell.oddTitleLabel?.textColor = .white
        cell.oddTitleLabel?.text = gotSeason.name
        
        cell.oddEpisodeInfoLabel?.textColor = .lightText
        cell.oddEpisodeInfoLabel?.text = "S:  \(String(gotSeason.season)) ep: \(gotSeason.number)"
        
        cell.oddImage.image = UIImage(named: gotSeason.mediumImageID)
        
        cell.selectedBackgroundView = customView
        
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return gotSeasons.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let gotSeason = gotSeasons[section].first?.season {
            
            return "Season \(gotSeason)"
        }
        return "well that didn't work"
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text == "" || searchBar.text == " " {
            data = GOTEpisode.allEpisodes
        }
        
        data = data.filter(){$0.name == searchBar.text}
        searchBar.resignFirstResponder()
        searchBar.text = ""
    }
    
}
