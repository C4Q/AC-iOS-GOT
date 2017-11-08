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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotTableView.delegate = self
        gotTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GOTEpisode.allEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = gotTableView.dequeueReusableCell(withIdentifier: "LeftGOTCell", for: indexPath) as! LeftGOTTableViewCell
        let gotEpisodeInfo = GOTEpisode.allEpisodes[indexPath.row]
        let gotSeasonNum = gotEpisodeInfo.season
        let gotEpisodeNum = gotEpisodeInfo.number
        let gotEpisodeTitle = gotEpisodeInfo.name
        let gotEpisodeImageID = gotEpisodeInfo.originalImageID
        cell.episodeTitleLabel.text = gotEpisodeTitle
        cell.seasonAndEpisodeNumberLabel.text = "S: \(gotSeasonNum) E: \(gotEpisodeNum)"
        if let gotEpisodePic = UIImage(named: gotEpisodeImageID) {
                    cell.gotEpisodeImageView.image = gotEpisodePic
        }
        return cell
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
