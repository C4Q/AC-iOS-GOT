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
        case 1:
            changeHeaderColor(tableView: tableView)
            return "Season 1"
        case 2:
            changeHeaderColor(tableView: tableView)
            return "Season 2"
        case 3:
            changeHeaderColor(tableView: tableView)
            return "Season 3"
        case 4:
            changeHeaderColor(tableView: tableView)
            return "Season 4"
        case 5:
            changeHeaderColor(tableView: tableView)
            return "Season 5"
        case 6:
            changeHeaderColor(tableView: tableView)
            return "Season 6"
        case 7:
            changeHeaderColor(tableView: tableView)
            return "Season 7"
        default:
            return "GOT SEASONS 1 - 7"
        }
    }
    // this changes the color of the section header but overrides the "titleForHeaderInSection" method
    
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let label = UIView()
    //
    //        switch section % 2 == 0{
    //
    //        case true:
    //            label.backgroundColor = .blue
    //        case false:
    //            label.backgroundColor = .yellow
    //    }
    //        return label
    //    }
    
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
    //function to pass data from one tableView Controller to another tableView Controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let detailViewControler = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        
        detailViewControler.getImage = UIImage(named: gotArrayBySeason[indexPath.section][indexPath.row].originalImageID)!
        
        detailViewControler.getTitle = gotArrayBySeason[indexPath.section][indexPath.row].name
        
        detailViewControler.getSeason = "Season: \( gotArrayBySeason[indexPath.section][indexPath.row].season)"
        
        detailViewControler.getEpisode = "Episode: \( gotArrayBySeason[indexPath.section][indexPath.row].id)"
        
        detailViewControler.getRunningTime = "Run Time: \( gotArrayBySeason[indexPath.section][indexPath.row].runtime)"
        
        detailViewControler.getAirTime = "Air Time: \(gotArrayBySeason[indexPath.section][indexPath.row].airdate)"
        
        detailViewControler.getDiscription = gotArrayBySeason[indexPath.section][indexPath.row].summary
        
        self.navigationController?.pushViewController(detailViewControler, animated: true)
        
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

