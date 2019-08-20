//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var allEpisodesinSeasons = arrOfSeasonsData
    var arrOfSeasons: [[GOTEpisode]] {
        guard let searchString = searchString else {
            return allEpisodesinSeasons
        }
        guard searchString != "" else {
            return allEpisodesinSeasons
        }
        let searchResults = filterForSearchResult(arr: GOTEpisode.allEpisodes, string: searchString)
        let separateSeasons = makeArrofSeasons(allEp: searchResults, seasons: 7)
        return separateSeasons
        
    }
    var searchString: String? = nil {
        didSet {
            self.gOTTableView.reloadData()
        }
    }
    
    //MARK: -- TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section % 2 {
        case 0:
            return arrOfSeasons[section].count
        case 1:
            return arrOfSeasons[section].count
        default:
            return GOTEpisode.allEpisodes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne") as? cellOneTableViewCell else {
            return UITableViewCell()
        }
        guard let cellTwo = tableView.dequeueReusableCell(withIdentifier: "cellTwo") as? cellTwoTableViewCell else {
            return UITableViewCell()
        }
        let section = indexPath.section
        let episodeArr = arrOfSeasons[section]
        let theEpisode = episodeArr[indexPath.row]
        switch indexPath.section % 2 {
        case 0:
            cell.titleLabel.text = theEpisode.name
            cell.seasonEpisodeLabel.text = "S:\(theEpisode.season) E:\(theEpisode.number)"
            cell.imageCellOne.image = UIImage(named: episodeArr[indexPath.row].mediumImageID)
            return cell
        case 1:
            cellTwo.titleLabelCellTwo.text = theEpisode.name
            cellTwo.seasonEpisodeCellTwoLabel.text = "S:\(theEpisode.season) E:\(theEpisode.number)"
            cellTwo.imageCellTwo.image = UIImage(named: theEpisode.mediumImageID)
            return cellTwo
        default:
            return UITableViewCell()
        }
        //return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section % 2 {
        case 0:
            return "Season \(section + 1)"
        case 1:
            return "Season \(section + 1)"
        default:
            return "something"
        }
    }
    
    //MARK: -- Outlets

    @IBOutlet weak var gOTTableView: UITableView!
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    //MARK: -- Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = gOTTableView.indexPathForSelectedRow,
            let detailedViewController = segue.destination as? DetailViewController else {return}
        
        let theEpisodes = arrOfSeasons[indexPath.section][indexPath.row]
        detailedViewController.episode = theEpisodes
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gOTTableView.dataSource = self
        gOTTableView.delegate = self
        searchBarOutlet.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text
    }
}
