//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Objects
    @IBOutlet weak var episodeTableView: UITableView!
    
    // MARK: - Properties
    var series = Series()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        episodeTableView.dataSource = self
        episodeTableView.delegate = self
    }

}

// MARK: - Extensions
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return series.seasons.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return series.seasons[section].episodes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section % 2 {
        case 0:
            if let leftCell = episodeTableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath) as? LeftTVCell {
                leftCell.leftTitleLabel.text = series.seasons[indexPath.section].episodes[indexPath.row].name
                leftCell.leftSeasonEpisodeLabel.text = series.seasons[indexPath.section].episodes[indexPath.row].getFormattedEpAndSeasonString()
                leftCell.leftImageView.image = UIImage(named: series.seasons[indexPath.section].episodes[indexPath.row].mediumImageID)
                return leftCell
            }
        case 1:
            if let rightCell = episodeTableView.dequeueReusableCell(withIdentifier: "rightCell", for: indexPath) as? RightTVCell {
            rightCell.rightTitleLabel.text = series.seasons[indexPath.section].episodes[indexPath.row].name
            rightCell.rightSeasonEpisodeLabel.text = series.seasons[indexPath.section].episodes[indexPath.row].getFormattedEpAndSeasonString()
            rightCell.rightImageView.image = UIImage(named: series.seasons[indexPath.section].episodes[indexPath.row].mediumImageID)
                return rightCell
            }
        default:
                return UITableViewCell()
        }
        return UITableViewCell()
    }
    
}

