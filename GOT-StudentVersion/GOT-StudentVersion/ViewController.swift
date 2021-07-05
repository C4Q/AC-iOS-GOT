//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var episodeArr = [GOTEpisode]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //  self.tableView.rowHeight = UITableViewAutomaticDimension
        //  self.tableView.estimatedRowHeight = 200.0
        episodeArr = GOTEpisode.allEpisodes
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //2 reqd data source methods numberOfRows and cellForRowAt
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeArr.filter{$0.season == section + 1}.count
        //print(episodeArr.count)
        //return episodeArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leftAligned = indexPath.section % 2 == 0
        let cell = tableView.dequeueReusableCell(withIdentifier:"Episode Cell", for: indexPath)
        if leftAligned {
            if let cell = cell as? LeftAlignedTableViewCell {
                cell.titleLabel.text = episodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].name
                cell.descriptionLabel.text = "S:" + "\(episodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].season) " + "E:" + "\(episodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].number)"
                cell.episodeImageView.image = UIImage(named: episodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].mediumImageID)
                
                return cell
                
                
            }
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier:"Episode Cell2", for: indexPath)
            if let cell = cell as? RightAlignedTableViewCell {
                cell.titleLabel2.text = episodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].name
                print(cell.titleLabel2.text!)
                cell.descriptionLabel2.text = "S:" + "\(episodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].season) " + "E:" + "\(episodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].number)"
                
                cell.episode2ImageView.image = UIImage(named: episodeArr.filter{$0.season == indexPath.section + 1}[indexPath.row].mediumImageID)
                
                return cell
            }
        }
        return UITableViewCell()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cellClickedOn = sender as? UITableViewCell {
            let season = (tableView.indexPath(for: cellClickedOn)?.section)! + 1
            let row = (tableView.indexPath(for: cellClickedOn)?.row)!
            //get the new view controller using segue.destination
            if segue.identifier == "detailSegue" {
                if let destination = segue.destination as? EpisodeDetailViewController{
                    destination.episode = episodeArr.filter{$0.season == season}[row]
                }
                
            }else{
                print("not working")
            }
            
            
        }
        
    }
    
}

