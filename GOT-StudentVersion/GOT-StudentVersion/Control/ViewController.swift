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
    
    let gotSeasons = GOTEpisode.allSeasons
    //will return an array, when calling data in function, use indexpath to get the element needed
    var episodes = GOTEpisode.allEpisodes {
        didSet {
            gotTableView.reloadData()
        }
    }
    
    
  
    var gotSearchResult: [[GOTEpisode]] {
        get {
            guard let searchString = searchString else {
                return gotSeasons
            }
            guard searchString != "" else {
                return gotSeasons
            }
            if let scopeTitles = gotSearchBar.scopeButtonTitles {
                let currentScopeIndex = gotSearchBar.selectedScopeButtonIndex
                
                switch scopeTitles[currentScopeIndex] {
                case "Ep. Name":
                    return [gotSeasons.joined().filter{$0.name.lowercased().contains(searchString.lowercased())}]
                case "Summary":
                    return [gotSeasons.joined().filter{$0.summary.lowercased().contains(searchString.lowercased())}]
                default:
                    return gotSeasons                }
            }
            return gotSeasons
        }
    }
    
    var searchString: String? = nil {
        didSet {
            print(searchString as Any)
            //this function makes the tableView
            gotTableView.reloadData()
        }
    }

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
        return gotSearchResult.count == 0 ?  1 : gotSearchResult.count
//        return gotSeasons[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let gotSeason = gotSearchResult[indexPath.section][indexPath.row]
        let customView = UIView()
        customView.backgroundColor = UIColor(red: 59/255, green: 90/255, blue: 99/255, alpha: 0.5)
        let gotColor = UIColor(red: 12/255, green: 29/255, blue: 66/255, alpha: 1)
        var cell = oddGOTTVCell()
        
        if gotSearchResult.count == 0 {
            let  searchCell = UITableViewCell()
            searchCell.backgroundColor = gotColor
            searchCell.textLabel?.textColor = .lightText
            searchCell.textLabel?.font = UIFont(name: "Papyrus", size: 30)
            searchCell.textLabel?.text = "Result Not Found"
            return searchCell
        }
        
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
        
        if gotSearchResult.count == 0 {
            return 250
        } else {
            return 150
        }

    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return gotSearchResult.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let gotSeason = gotSearchResult[section].first?.season {
            
            return "Season \(gotSeason)"
        }
        return "well that didn't work"
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text?.lowercased()
        
        if gotSearchResult.count == 0 {
            searchBar.resignFirstResponder()
        }
    }
}
