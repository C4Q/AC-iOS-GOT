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

     
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let anEpisode = gotArr[indexPath.row]
        
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
            let selectedEpisode = gotArr[selectedRow!] //how to get your episode
            destination.thisEpisode = selectedEpisode // sending over info to detailedvc, selects specific episode info
            
            
            
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        print("Search button clicked!")
    }
    
    
    
    
}

