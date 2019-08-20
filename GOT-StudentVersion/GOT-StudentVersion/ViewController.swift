//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var episodeData = GOTEpisode.allEpisodes
  
    
    @IBOutlet weak var episodeGuide: UITableView!
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return gotSeason1.count
        case 1:
            return gotSeason2.count
        case 2:
            return gotSeason3.count
        case 3:
            return gotSeason4.count
        case 4:
            return gotSeason5.count
        case 5:
            return gotSeason6.count
        case 6:
            return gotSeason7.count
        default:
            return 0
        }
    }
    
    func filterSeasonsBy(episode: [GOTEpisode], andSeasonNum: Int) -> [GOTEpisode] {
        return episode.filter({$0.season == andSeasonNum} )
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //        var episode = episodeData[indexPath.row]
        
        switch indexPath.section % 2 {
        case 0:
            guard let cellOdd = episodeGuide.dequeueReusableCell(withIdentifier: "gotCellOdd", for: indexPath) as? gotEpOdd else { return UITableViewCell() }
            
            
            let seasonArr0 = filterSeasonsBy(episode: episodeData,
                                             andSeasonNum: indexPath.section + 1)
            print(seasonArr0)
            let infoForOddCell = seasonArr0[indexPath.row]
            
            cellOdd.epLabelOdd.text = infoForOddCell.name
            cellOdd.epIndexOdd.text = "Season:  \(infoForOddCell.season)"
            cellOdd.gotImageOdd.image = UIImage(named: String(infoForOddCell.mediumImageID))
            
            return cellOdd
        case 1:
            guard let cellEven = episodeGuide.dequeueReusableCell(withIdentifier: "gotCellEven", for: indexPath) as? gotEpEven else {
                return UITableViewCell() }
            
            let seasonArr1 = filterSeasonsBy(episode: episodeData, andSeasonNum: indexPath.section + 1)
            let infoForEvenCell = seasonArr1[indexPath.row]
            
            cellEven.epLabelEven.text = infoForEvenCell.name
            cellEven.epIndexEven.text = "Season:  \(infoForEvenCell.season)"
            cellEven.epImageEven.image = UIImage(named: String(infoForEvenCell.mediumImageID))
            
            // cell.textLabel?.text = episodeData[indexPath.row].name
            return cellEven
        default:
            return UITableViewCell()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {
            fatalError("No identifier in segue")
        }
        switch segueIdentifier {
            case "detailSegue":
            guard let detailVC = segue.destination as? DetailViewController
                else {
                    fatalError("Unexpected segue")}
            guard let selectedIndexPath = episodeData[indexPath.row] else {
                fatalError("No row selected")
            }
            DetailViewController.detEpLabel = ind
                return UITableViewCell
            
        default:
            fatalError()
        }
        
        
    }
        
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {
            fatalError("No identifier in segue")
        }
        switch segueIdentifier {
        case "detailSegue":
            guard let detailVC = segue.destination as? DetailViewController
                else {
                    fatalError("Unexpected segue")}
            guard let selectedIndexPath = tableViewOut.indexPathForSelectedRow else {
                fatalError("No row selected")
            }
            detailVC.detailSongs = songSearchResults[selectedIndexPath.row]
        default:
            fatalError("Unexpected segue identifier")
        }
    }
 */
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        episodeGuide.dataSource = self
        episodeGuide.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    





