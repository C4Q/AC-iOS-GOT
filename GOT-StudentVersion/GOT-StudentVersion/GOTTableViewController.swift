//
//  GOTTableViewController.swift
//  GOT-StudentVersion
//
//  Created by Krystal Campbell on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class GOTTableViewController: UITableViewController {
    
    var episodes = GOTEpisode.allEpisodes
    
//    var seasonOne = GOTEpisode.seasonOne
//    var seasonTwo = GOTEpisode.seasonTwo
//    var seasonThree = GOTEpisode.seasonThree
//    var seasonFour = GOTEpisode.seasonFour
//    var seasonFive = GOTEpisode.seasonFive
//    var seasonSix = GOTEpisode.seasonSix
//    var seasonSeven = GOTEpisode.seasonSeven
    var wholeShow = GOTEpisode.allSeasons
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return wholeShow.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
        return wholeShow[0].count
        case 1:
            return wholeShow[1].count
        case 2:
            return wholeShow[2].count
        case 3:
            return wholeShow[3].count
        case 4:
            return wholeShow[4].count
        case 5:
            return wholeShow[5].count
        case 6:
            return wholeShow[6].count
        default:
            return 0
        }
//        case 1:
//        return seasonTwo.count
//        case 2:
//        return seasonThree.count
//        case 3:
//        return seasonFour.count
//        case 4:
//        return seasonFive.count
//        case 5:
//        return seasonSix.count
//        case 6:
//        return seasonSeven.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
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
            return "0"
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as ? UITableCell()  {
            
        }

        // Configure the cell...

        return cell
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
