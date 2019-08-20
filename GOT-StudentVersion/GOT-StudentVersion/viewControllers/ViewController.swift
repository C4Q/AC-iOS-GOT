//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    var gotData = GOTEpisode.allEpisodes
    
    @IBOutlet weak var gotMainTableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return gotData.count
        switch section {
        case 0:
            return Series.gotSeason1.count
        case 1:
            return Series.gotSeason2.count
        case 2:
            return Series.gotSeason3.count
        case 3:
            return Series.gotSeason4.count
        case 4:
            return Series.gotSeason5.count
        case 5:
            return Series.gotSeason6.count
        case 6:
            return Series.gotSeason7.count
        default: return 0

        }
        
    }
    
    func filterSeasonsBy(episode: [GOTEpisode], andSeasonNum: Int) -> [GOTEpisode] {
        return episode.filter( {$0.season == andSeasonNum} )
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section % 2 {
            
        case 0:
            guard let oddCell = gotMainTableView.dequeueReusableCell(withIdentifier: "oddSeasons", for: indexPath) as? TableViewCellOddSeasons else{ return UITableViewCell()}
            
            let seasonArr0 = filterSeasonsBy(episode: gotData, andSeasonNum: indexPath.section + 1)
            //let dataToSend = matrix[inde]
          // let intoToSend =
            let infoForOddCell = seasonArr0[indexPath.row]
            
            oddCell.episodeTitleLabelOdd.text = infoForOddCell.name
            oddCell.seasonLabelOdd.text = "Season: \(infoForOddCell.season) Episode: \(infoForOddCell.number)"
            oddCell.uiImageViewOdd.image = UIImage(named: String(infoForOddCell.mediumImageID))
            
            return oddCell
            
        case 1:
            guard let evenCell = gotMainTableView.dequeueReusableCell(withIdentifier: "evenSeasons", for: indexPath) as? TableViewCellEvenSeasons else{ return UITableViewCell()}
            let seasonArr1 = filterSeasonsBy(episode: gotData, andSeasonNum: indexPath.section + 1)
            let infoForEvenCell = seasonArr1[indexPath.row]
            evenCell.episodeTitleLabelEven.text = infoForEvenCell.name
            evenCell.seasonLabelEven.text = "Season: \(infoForEvenCell.season) Episode: \(infoForEvenCell.number)"
            evenCell.uiImageViewEven.image = UIImage(named: String(infoForEvenCell.mediumImageID))
            return evenCell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 145
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gotMainTableView.dataSource = self
        gotMainTableView.delegate = self
//        print(gotSeason1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let segueIdentifier = segue.identifier else{
            fatalError("no identifier in segue")
        }
        
        switch segueIdentifier {
        case "oddCellsToDetailSegue":
            guard let episodeDetailsVCOdd = segue.destination as? DetailsViewController else{
                fatalError("Unexpected Error: No VC")
            }
            guard let selectedIndexPath = gotMainTableView.indexPathForSelectedRow else{
                fatalError("No Selected Row")
            }
            
            episodeDetailsVCOdd.episodeDetails = Series.gotArr[selectedIndexPath.section][selectedIndexPath.row]
            
        case "evenCellsToDetailSegue":
            guard let episodeDetailsVCEven = segue.destination as? DetailsViewController else{
                fatalError("Unexpected Error: No VC")
            }
            guard let selectedIndex = self.gotMainTableView.indexPathForSelectedRow else {
                fatalError("No Selected Row")
            }
            episodeDetailsVCEven.episodeDetails = Series.gotArr[selectedIndex.section][selectedIndex.row]
     
        default:
            fatalError("Unexpected Identifier")
        }
        
    }


}

