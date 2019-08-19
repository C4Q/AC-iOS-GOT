//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit




class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableviewController: UITableView!
    
    var episode = GOTEpisode.allEpisodes
    
    var gotArray = GOTEpisode.filteredSeasons()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let oddCell = tableView.dequeueReusableCell(withIdentifier: "gotCell1") as! OddSeasonsTableViewCell
        oddCell.oddTitleLabel.text = gotArray[indexPath.section][indexPath.row].name
        oddCell.oddEpisodeLabel.text = "S: \(gotArray[indexPath.section][indexPath.row].season) E: \(gotArray[indexPath.section][indexPath.row].number)"
        oddCell.oddImageView.image = UIImage(named: "\(gotArray[indexPath.section][indexPath.row].mediumImageID)")
        
        
        let evenCell = tableView.dequeueReusableCell(withIdentifier: "gotCell2") as! EvenSeasonsTableViewCell
        
        evenCell.evenTitleLabel.text = gotArray[indexPath.section][indexPath.row].name
        evenCell.evenEpisodeLabel.text = "S: \(gotArray[indexPath.section][indexPath.row].season) E: \(gotArray[indexPath.section][indexPath.row].number)"
        evenCell.evenImageView.image = UIImage(named: "\(gotArray[indexPath.section][indexPath.row].mediumImageID)")
        
        if gotArray[indexPath.section][indexPath.row].season % 2 == 1{
            return oddCell
        }else{
            return evenCell
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return gotArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    

    @IBOutlet weak var gotTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableviewController.dataSource = self
        tableviewController.delegate = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

