//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: -- Outlets
    @IBOutlet weak var gotTableView: UITableView!
    
    //MARK: -- Data Source Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
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
            return "We don't talk about that one"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return GOTEpisode.seasonOne.count
        case 1:
            return GOTEpisode.seasonTwo.count
        case 2:
            return GOTEpisode.seasonThree.count
        case 3:
            return GOTEpisode.seasonFour.count
        case 4:
            return GOTEpisode.seasonFive.count
        case 5:
            return GOTEpisode.seasonSix.count
        case 6:
            return GOTEpisode.seasonSeven.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    //MARK: -- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        gotTableView.dataSource = self
        gotTableView.delegate = self
    }
    
    
}

