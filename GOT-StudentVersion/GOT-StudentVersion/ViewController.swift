//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section % 2 {
        case 0:
            let seasonNum = section + 1
            let episodeArr = filterBySeason(got: GOTEpisode.allEpisodes, season: seasonNum)
            return episodeArr.count
        case 1:
            let seasonNum = section + 1
            let episodeArr = filterBySeason(got: GOTEpisode.allEpisodes, season: seasonNum)
            return episodeArr.count
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
        switch indexPath.section % 2 {
        case 0:
            let seasonNum = indexPath.section + 1
            let episodeArr = filterBySeason(got: GOTEpisode.allEpisodes, season: seasonNum)
            cell.titleLabel.text = episodeArr[indexPath.row].name
            cell.seasonEpisodeLabel.text = "S:\(seasonNum) E:\(episodeArr[indexPath.row].number)"
            cell.imageCellOne.image = UIImage(named: episodeArr[indexPath.row].mediumImageID)
            return cell
        case 1:
            let seasonNum = indexPath.section + 1
            let episodeArr = filterBySeason(got: GOTEpisode.allEpisodes, season: seasonNum)
            let theEpisode = episodeArr[indexPath.row]
            cellTwo.titleLabelCellTwo.text = theEpisode.name
            cellTwo.seasonEpisodeCellTwoLabel.text = "S:\(seasonNum) E:\(theEpisode.number)"
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

    @IBOutlet weak var gOTTableView: UITableView!
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

