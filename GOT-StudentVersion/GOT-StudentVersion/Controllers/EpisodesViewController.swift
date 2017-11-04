//
//  EpisodesViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/3/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class EpisodesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var gotTableView: UITableView!
    
    // I need the number of rows as well as the cell formate
    var myGotEpisodes = GOTEpisode.allEpisodes
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let seasonNumber = section + 1
        let episodesInSeason = myGotEpisodes.filter { $0.season == seasonNumber }
        
        return episodesInSeason.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let seasonNumber = indexPath.section + 1
        let episodesInSeason = myGotEpisodes.filter { $0.season == seasonNumber }
        
        
        
        if indexPath.row % 2 == 0 {
            guard let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "RighCell") else {
                let defaulTCell = UITableViewCell()
                return defaulTCell
            }
            if let episodeCell = cell as? RightCellTableViewCell{
                let rowSetup = indexPath.row
                let episodeSetup = episodesInSeason[rowSetup]
                episodeCell.EpisodeName.text = episodeSetup.name
                episodeCell.EpisodeSmallPoster.image = UIImage(named: episodeSetup.mediumImageID)
                episodeCell.EpisodeNameAndSeason.text = "S:\(episodeSetup.season) E:\(episodeSetup.number)"
                return episodeCell
            }
            return cell
        }
        else{
            guard let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "leftCell") else {
                let defaulTCell = UITableViewCell()
                return defaulTCell
            }
            if let episodeCell = cell as? LeftCellTableViewCell{
                let rowSetup = indexPath.row
                let episodeSetup = episodesInSeason[rowSetup]
                episodeCell.episodeName.text = episodeSetup.name
                episodeCell.episodePoster.image = UIImage(named: episodeSetup.mediumImageID)
                episodeCell.episodeNameAndSeason.text = "S:\(episodeSetup.season) E:\(episodeSetup.number)"
                return episodeCell
            }
            return cell
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.gotTableView.delegate = self
        gotTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
