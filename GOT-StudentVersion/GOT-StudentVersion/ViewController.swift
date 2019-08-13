//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    //MARK: -- Outlet & imported Variables
    @IBOutlet var gotTableView: UITableView!
    var gotArrayBySeason = sortedBySeason()
    var searchGOTNames = [String]()
    var searching = true
    var gotArrayOfNames = EpisodeNames().putNameOfEpisodesInAnArray()
    @IBOutlet var searchBar: UISearchBar!
    
    // add sections in the view
    func changeHeaderColor(tableView:UITableView){
        tableView.backgroundColor = .blue
    }
    
    //MARK: -- Table
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 7
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
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotArrayBySeason.Sorting()[section].count
    }
    
    //sets the height of the sections
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GOTID") as! GotTableViewCell
        
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "GOTID2") as! GotTableViewCell
        
       let info = gotArrayBySeason.Sorting()[indexPath.section][indexPath.row]
       
            cell.gotName.text = "\( info.name)"
            cell.seasonAndEpisode.text = "S:\( info.season) E: \(info.number)"
            cell.gotImageView.image = UIImage(named: info.mediumImageID)
        
            cell2.gotName.text = "\( info.name)"
            cell2.seasonAndEpisode.text = "S:\( info.season) E: \(info.number)"
            cell2.gotImageView.image = UIImage(named: info.mediumImageID)
       // }
        
        if info.season % 2 == 1{
           return cell
        }else {
            return cell2
        }
        
    }
    
    //function to pass data from one tableView Controller to another tableView Controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let detailViewControler = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
         let info = gotArrayBySeason.Sorting()[indexPath.section][indexPath.row]
        // this line passes the model to the second view controller and allows the second view controller tro figure out what it needs to assign to its attritubes
        detailViewControler.gotEpisode = info
        
        self.navigationController?.pushViewController(detailViewControler, animated: true)
        
    }
    //TODO
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        searchGOTNames.filter({$0.prefix(searchText.count) == searchText})
        
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gotTableView.delegate = self
        gotTableView.dataSource = self
        searchBar.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

