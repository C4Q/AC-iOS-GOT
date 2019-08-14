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
    
    
    //MARK: -- Table View Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return gotArrayBySeason.Sorting().count
    }
    //This code goes into the [[GOTEpisode]], grabs each section starting from index 0, and grabs the classification string and returns it to be displayed in the title header
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Season \(gotArrayBySeason.Sorting()[section][0].season)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotArrayBySeason.Sorting()[section].count
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
        
        if info.season % 2 == 1{
            return cell
        }else {
            return cell2
        }
        
    }
    
    //MARK: -- Table View Delgates
    //sets the height of the sections
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150)
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

