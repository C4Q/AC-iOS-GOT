//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    let gotData = GOTEpisode.allEpisodes
    let gotSeries = GOTEpisode.gotSeries
    
    var searchResults: [[GOTEpisode]] {
        get {
            guard let searchString = searchString else {return gotSeries}
            guard searchString != "" else {return gotSeries}
            
            if let scopeTitles = gotSearchBarOutlet.scopeButtonTitles {
                let currentScopeIndex = gotSearchBarOutlet.selectedScopeButtonIndex
            
                switch scopeTitles[currentScopeIndex] {
                case "Episode":
                    
                    return
                        [gotSeries.joined().filter{$0.name.lowercased().contains(searchString.lowercased())}]
                case "Summary":
                    
                    return
                        [gotSeries.joined().filter{$0.summary.lowercased().contains(searchString.lowercased())}]
                default:
                    return gotSeries
                }
            }
            return gotSeries
        }
    }
    var searchString: String? = nil {
        didSet {
            self.tableViewOutlet.reloadData()
        }
    }

    @IBOutlet weak var gotSearchBarOutlet: UISearchBar!
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = GOTTableViewCell()
        switch indexPath.section % 2 {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell2", for: indexPath) as! GOTTableViewCell
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as! GOTTableViewCell
        default:
            print("my ass")
        }
        cell.topLabel.text = searchResults[indexPath.section][indexPath.row].name
        cell.bottomLabel.text = searchResults[indexPath.section][indexPath.row].description
        cell.imageOutlet.image = searchResults[indexPath.section][indexPath.row].getImage()
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        guard searchResults.joined().count > 0 else {return 1}
        
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        default:
            guard searchResults.joined().count != 0 else {return "No Result"}
            return "Season: \(searchResults[section][0].season)"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "GOTDetailViewController") as? GOTDetailViewController {
            viewController.gotEpisode = searchResults[indexPath.section][indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text?.lowercased()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        gotSearchBarOutlet.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

