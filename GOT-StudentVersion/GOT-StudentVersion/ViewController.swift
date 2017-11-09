//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var gotArr = GOTEpisode.allEpisodes
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteresEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let anEpisode = filteresEpisodes[indexPath.row]
        
        if anEpisode.season % 2 == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "leftAlignedCell") as! LeftAlignedTableViewCell
            cell.episodeLabel.text = "S:\(String(anEpisode.season)) E:\(String(anEpisode.number))"
            cell.seasonLabel.text = anEpisode.name
            cell.cellOneImage.image = UIImage(named: anEpisode.originalImageID)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "rightAlignedCell") as! RightAlignedTableViewCell
            cell.episodeLabel.text = "S:\(String(anEpisode.season)) E:\(String(anEpisode.number))"
            cell.seasonLabel.text = anEpisode.name
            cell.cellTwoImage.image = UIImage(named: anEpisode.originalImageID)
            return cell
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailedViewController {
            let selectedRow = tableView.indexPathForSelectedRow?.row //What row did you select?
            let selectedEpisode = filteresEpisodes[selectedRow!] //how to get your episode
            destination.thisEpisode = selectedEpisode // sending over info to detailedvc, selects specific episode info
            
            
            
        }
    }
    
    
    
    
    //Set Up Search Bar
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        print("Search button clicked!")
    }
    
    //Search Term
    var searchTerm: String? {                       //Setting a var called searchTerm
        didSet {
            self.tableView.reloadData()             //Reloads as user is typing - if search tearm changes, reload it
        }
        
    }
    
    //Text Did Change
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {       //Says the searchTerm = what the user is typing
        searchTerm = searchText
        
    }
    
    //Variable to filter by Episode name
    var filteresEpisodes: [GOTEpisode] {                //This variable filters and then returns result
        guard let searchTerm = searchTerm, searchTerm != "" else {
            return gotArr
        }
        
        var result = [GOTEpisode]()
        for episode in gotArr {
            if episode.name.lowercased().contains(searchTerm.lowercased()) { //This checks if the episode name contains the input in the search bar
                result.append(episode)
            }
        }
        return result
    }
    
    
    
}



//drag search bar into storyboard
//make an outlet
//set a delegate for search bar
//set delegate in view did load
//Create a variable calleed searchTearm, with a did set to reload the table view
//call function textDidChange - call func to make searchterm == whatever you're looking for
//filter variable that returns the result
