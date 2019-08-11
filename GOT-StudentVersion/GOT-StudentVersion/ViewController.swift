//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
     @IBOutlet var gotTableView: UITableView!
    var gotFiles = GOTEpisode.allEpisodes
    var gotArrayBySeason = sortedBySeason.init().Sorting()
   
    // add sections in the view
    func changeHeaderColor(tableView:UITableView){
        tableView.backgroundColor = .blue
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return gotArrayBySeason.count
    }
    // adds header for every season
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            changeHeaderColor(tableView: tableView)
            return "Season 1"
        case 1:
            changeHeaderColor(tableView: tableView)
             return "Season 2"
        case 2:
            changeHeaderColor(tableView: tableView)
             return "Season 3"
        case 3:
            changeHeaderColor(tableView: tableView)
             return "Season 4"
        case 4:
            changeHeaderColor(tableView: tableView)
             return "Season 5"
        case 5:
            changeHeaderColor(tableView: tableView)
             return "Season 6"
        case 6:
            changeHeaderColor(tableView: tableView)
             return "Season 7"
        default:
            return "Nothing"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotArrayBySeason[section].count
    }
    
    //sets the height of the sections
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return CGFloat(150)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GOTID", for: indexPath) as! GotTableViewCell
    
        cell.gotName.text = "\( gotArrayBySeason[indexPath.section][indexPath.row].name) \(indexPath.section)"
        cell.seasonAndEpisode.text = "S:\( gotArrayBySeason[indexPath.section][indexPath.row].season) E: \(gotArrayBySeason[indexPath.section][indexPath.row].number)"
        cell.gotImageView.image = UIImage(named: gotArrayBySeason[indexPath.section][indexPath.row].mediumImageID)

        
        // write my code in here
        return cell
    }
    

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gotTableView.delegate = self
        gotTableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

