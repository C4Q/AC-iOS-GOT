//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let gotEpisodes = GOTEpisode.allEpisodes
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Number of sections (starts from 0)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    //  Titles for each sections
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
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
            return ""
        }
    }
    
    // Number of rows for each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return GOTEpisode.season1.count
        case 1:
            return GOTEpisode.season2.count
        case 2:
            return GOTEpisode.season3.count
        case 3:
            return GOTEpisode.season4.count
        case 4:
            return GOTEpisode.season5.count
        case 5:
            return GOTEpisode.season6.count
        case 6:
            return GOTEpisode.season7.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

