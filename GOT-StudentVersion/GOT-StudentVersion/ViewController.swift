//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by Maryann Yin on 11/4/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var gotTableView: UITableView!
 
    let gotSeasonSections = ["Season 1", "Season 2", "Season 3", "Season 4", "Season 5", "Season 6", "Season 7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotTableView.delegate = self
        gotTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return gotSeasonSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GOTEpisode.allEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leftCell = gotTableView.dequeueReusableCell(withIdentifier: "LeftGOTCell", for: indexPath) as! LeftGOTTableViewCell
        let rightCell = gotTableView.dequeueReusableCell(withIdentifier: "RightGOTCell", for: indexPath) as! RightGOTTableViewCell
        let gotEpisodeInfo = GOTEpisode.allEpisodes[indexPath.row]
        let gotSeasonNum = gotEpisodeInfo.season
        let gotEpisodeNum = gotEpisodeInfo.number
        let gotEpisodeTitle = gotEpisodeInfo.name
        let gotEpisodeImageID = gotEpisodeInfo.originalImageID
        if indexPath.row % 2 == 0 {
            rightCell.gotEpisodeTitleLabel.text = gotEpisodeTitle
            rightCell.gotSeasonAndEpisodeNumberLabel.text = "S: \(gotSeasonNum) E: \(gotEpisodeNum)"
            if let gotEpisodeImage = UIImage(named: gotEpisodeImageID) {
                 rightCell.gotEpisodeImageView.image = gotEpisodeImage
            }
            
            

            return rightCell
        } else {
            leftCell.episodeTitleLabel.text = gotEpisodeTitle
            leftCell.seasonAndEpisodeNumberLabel.text = "S: \(gotSeasonNum) E: \(gotEpisodeNum)"
            if let gotEpisodePic = UIImage(named: gotEpisodeImageID) {
                leftCell.gotEpisodeImageView.image = gotEpisodePic
            }
            return leftCell
        }
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
