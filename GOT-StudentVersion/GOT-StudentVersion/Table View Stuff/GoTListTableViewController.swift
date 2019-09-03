//
//  GoTListTableViewController.swift
//  GOT-StudentVersion
//
//  Created by Radharani Ribas-Valongo on 8/20/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class GoTListTableViewController: UITableViewController {
    
    
    //MARK: - Outlets
    let episodes = GOTEpisode.allEpisodes
    let season1 = GOTEpisode.season1
    let season2 = GOTEpisode.season2
    let season3 = GOTEpisode.season3
    let season4 = GOTEpisode.season4
    let season5 = GOTEpisode.season5
    let season6 = GOTEpisode.season6
    let season7 = GOTEpisode.season7





    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Season 1"
        case 1:
            return "Season 2"
        case 2:
            return "Season 3"
        case 3:
            return "Season 4"
        case 4:
            return "Season 5"
        case 5:
            return "Season 6"
        case 6:
            return "Season 7"
        default:
            print("Game of Thrones isn't real")
        }
        return "Season 8"
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 7
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return season1.count
        case 1:
            return season2.count
        case 2:
            return season3.count
        case 3:
            return season4.count
        case 4:
            return season5.count
        case 5:
            return season6.count
        case 6:
            return season7.count
        default:
            return episodes.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if indexPath.section % 2 == 0 {
            if let cell1 = tableView.dequeueReusableCell(withIdentifier: "leftGotCell", for: indexPath) as? GoTLeftTableViewCell {
                switch indexPath.section {
                case 0:
                    setUpLeftCell(season: season1, cell: cell1, indexPath: indexPath)
                    return cell1
                case 1:
                    setUpLeftCell(season: season2, cell: cell1, indexPath: indexPath)
                    return cell1
                case 2:
                    setUpLeftCell(season: season3, cell: cell1, indexPath: indexPath)
                    return cell1
                case 3:
                    setUpLeftCell(season: season4, cell: cell1, indexPath: indexPath)
                    return cell1
                case 4:
                    setUpLeftCell(season: season5, cell: cell1, indexPath: indexPath)
                    return cell1
                case 5:
                    setUpLeftCell(season: season6, cell: cell1, indexPath: indexPath)
                    return cell1
                case 6:
                    setUpLeftCell(season: season7, cell: cell1, indexPath: indexPath)
                    return cell1
                default:
                    print("what")
                }
                return UITableViewCell()
            }
        } else if indexPath.section % 2 != 0 {
            if let cell2 = tableView.dequeueReusableCell(withIdentifier: "rightGotCell" ,for: indexPath) as? GoTRightTableViewCell {
                switch indexPath.section {
                case 0:
                    setUpRightCell(season: season1, cell: cell2, indexPath: indexPath)
                    return cell2
                case 1:
                    setUpRightCell(season: season2, cell: cell2, indexPath: indexPath)
                    return cell2
                case 2:
                    setUpRightCell(season: season3, cell: cell2, indexPath: indexPath)
                    return cell2
                case 3:
                    setUpRightCell(season: season4, cell: cell2, indexPath: indexPath)
                    return cell2
                case 4:
                    setUpRightCell(season: season5, cell: cell2, indexPath: indexPath)
                    return cell2
                case 5:
                    setUpRightCell(season: season6, cell: cell2, indexPath: indexPath)
                    return cell2
                case 6:
                    setUpRightCell(season: season7, cell: cell2, indexPath: indexPath)
                    return cell2
                default:
                    print("what")
                }
            }
        }
        
        return UITableViewCell()
    }

    private func setUpLeftCell(season: [GOTEpisode], cell: GoTLeftTableViewCell, indexPath: IndexPath){
        let s = season[indexPath.row]
        cell.episodeTitleLabel.text = s.name
        cell.episodeNumberLabel.text = "S:\(s.season) E:\(s.number)"
        cell.episodeImage.image = UIImage(named: s.originalImageID)
    }
    
    private func setUpRightCell(season: [GOTEpisode], cell: GoTRightTableViewCell, indexPath: IndexPath){
        let s = season[indexPath.row]
        cell.episodeTitleLabel.text = s.name
        cell.episodeNumberLabel.text = "S:\(s.season) E:\(s.number)"
        cell.episodeImage.image = UIImage(named: s.originalImageID)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
