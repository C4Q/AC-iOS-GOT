//
//  GOTETableViewController.swift
//  GOTE Project
//
//  Created by Mariel Hoepelman on 8/18/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import UIKit

class GOTETableViewController: UITableViewController {
    var episode = GOTEpisode.allEpisodes
    
    @IBOutlet weak var searchBarOulet: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        searchBarOulet.delegate = self
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    // GOTEpisode.episodesBySeason(season: section + 1).count works by calling episodesbySeason function in model. episodesbySeason function takes a season as an argument and returns the episodes that correspont to a specific season by filtering the property by season number.
    //In the function below, the return is the count of episodes in a season. the function called receives a season argument that is an Int, in this case the value is a section number + 1. e.g. for section 0, the value of season is 0 + 1 = 1, it returns season1.count. For season 2, returns section 1 + 1 = 2, season2.count and so on.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GOTEpisode.episodesBySeason(season: section + 1).count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Season One"
        case 1:
            return "Season Two"
        case 2:
            return "Season Three"
        case 3:
            return "Season Four"
        case 4:
            return "Season Five"
        case 5:
            return "Season Six"
        case 6:
            return "Season Seven"
        default:
            return "Season not found"
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celltoDisplay = indexPath.section % 2 == 0 ? "episodeCellEven" : "episodeCellOdd"
        if let cell = tableView.dequeueReusableCell(withIdentifier: celltoDisplay, for: indexPath) as? EpisodesTableViewCell {
            let episodes = GOTEpisode.episodesBySeason(season: indexPath.section + 1)
            cell.episodeNameLabel?.text = episodes[indexPath.row].name
            cell.seasonNumberLabel?.text = "S:\(episodes[indexPath.row].season) E:\(episodes[indexPath.row].number)"
            cell.episodeImage.image = UIImage(named: episodes[indexPath.row].mediumImageID)
          
            return cell
        }
        return UITableViewCell()
    }
    
    func showNotFoundAlert(titleType: String) -> Void {
        let alert = UIAlertController(title: "\(titleType) not found!", message: "Please try again", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let episodeDetailedViewController = segue.destination as? EpisodeDetailedViewController else {
             return showNotFoundAlert(titleType: "connection")
        }
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
            return showNotFoundAlert(titleType: "row")
        }
        
        let episodes = GOTEpisode.episodesBySeason(season: selectedIndexPath.section + 1)
        
        episodeDetailedViewController.episode = episodes[selectedIndexPath.row]
        
    }

//    var searchString: String? = nil {
//        didSet {
//            self.tableView.reloadData()
//        }
//    }

//    var episodeSearchResult:[GOTEpisode] {
//        get {
//            guard let searchString = searchString else {
//                return episode
//            }
//            guard searchString != "" else {
//                return episode
//            }
//            let episodeResults = episode.filter{$0.name.lowercased().contains(searchString.lowercased())}
//            if episodeResults.count > 0 {
//                return episodeResults
//            }else{showNotFoundAlert(titleType: "Episode")}
//        }
//        return episode
//    }
}

//extension GOTETableViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//                print(searchString)
//        searchString = searchBar.text
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchString = searchBar.text
//    }
//}
