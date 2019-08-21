//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        var gotArray = SeasonData.init().Sort()
        let episodes = GOTEpisode.allEpisodes
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return gotArray[section].count
            
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section % 2 != 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTVC
                cell.nameLabel.text = "\( gotArray[indexPath.section][indexPath.row].name)"
                cell.episodeLabel.text = "S: \( gotArray[indexPath.section][indexPath.row].season) / E: \(gotArray[indexPath.section][indexPath.row].number)"
                cell.imageOut.image = UIImage(named: gotArray[indexPath.section][indexPath.row].mediumImageID)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "reverseCell", for: indexPath) as! ReverseTVC
                cell.nameLabel.text = "\( gotArray[indexPath.section][indexPath.row].name)"
                cell.episodeLabel.text = "S:\( gotArray[indexPath.section][indexPath.row].season) E: \(gotArray[indexPath.section][indexPath.row].number)"
                cell.imageOut.image = UIImage(named: gotArray[indexPath.section][indexPath.row].mediumImageID)
                return cell
            }

    }

    
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            switch section {
            case 1:
                return "Season One"
            case 2:
                return "Season Two"
            case 3:
                return "Season Three"
            case 4:
                return "Season Four"
            case 5:
                return "Season Five"
            case 6:
                return "Season Six"
            case 7:
                return "Season Seven"
            default:
                return " "
            }
        }
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return gotArray.count
        }
    
        

    @IBOutlet weak var tableViewOut: UITableView!
    
        
        override func viewDidLoad() {
            
            tableViewOut.delegate = self
            tableViewOut.dataSource = self
            
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
        
       
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { fatalError("No identifier in segue")
        }
        switch segueIdentifier {
        case "detailSegue":
            guard let detailVC = segue.destination as? DetailViewController
                else { fatalError("Unexpected segue")}
            guard let selectedIndexPath = tableViewOut.indexPathForSelectedRow
                else { fatalError("No row selected") }
            detailVC.selected = gotArray[selectedIndexPath.section][selectedIndexPath.row]
        case "reverseSegue":
            guard let detailVC = segue.destination as? DetailViewController
                else { fatalError("Unexpected segue")}
            guard let selectedIndexPath = tableViewOut.indexPathForSelectedRow
                else { fatalError("No row selected") }
            detailVC.selected = gotArray[selectedIndexPath.section][selectedIndexPath.row]
            
        default:
            fatalError("Unexpected segue identifier")
        }
    }
    
}



