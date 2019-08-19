//
//  Episode.swift
//  GOT-StudentVersion
//
//  Created by God on 8/19/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class Episode: UIViewController {
    var gotEpisode: GOTEpisode!
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var seasonNumber: UILabel!
    @IBOutlet weak var seasonEpisodeNumber: UILabel!
    @IBOutlet weak var episodeRuntime: UILabel!
    @IBOutlet weak var airDate: UILabel!
    @IBOutlet weak var showDescription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        episodeImage.image = UIImage(named: gotEpisode.originalImageID)
        episodeTitle.text = "\(gotEpisode.name)"
        seasonNumber.text = "\(gotEpisode.season)"
        seasonEpisodeNumber.text = "\(gotEpisode.number)"
        episodeRuntime.text = "\(gotEpisode.runtime)"
        airDate.text = "\(gotEpisode.airdate)"
        showDescription.text = "\(gotEpisode.summary)"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source



    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
