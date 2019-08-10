//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let seasonOne = GOTEpisode.seasonOne
    let seasonTwo = GOTEpisode.seasonTwo
    let seasonThree = GOTEpisode.seasonThree
    let seasonFour = GOTEpisode.seasonFour
    let seasonFive = GOTEpisode.seasonFive
    let seasonSix = GOTEpisode.seasonSix
    let seasonSeven = GOTEpisode.seasonSeven
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return seasonOne.count
        case 1:
            return seasonTwo.count
        case 2:
            return seasonThree.count
        case 3:
            return seasonFour.count
        case 4:
            return seasonFive.count
        case 5:
            return seasonSix.count
        case 6:
            return seasonSeven.count
        default:
            return -1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        }
}

