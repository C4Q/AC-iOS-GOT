//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //TODO: connect searchbar, extend searchbardelegate
    //MARK:  --Outlets
    @IBOutlet weak var gotTableView: UITableView!
    
    //this will return an array, when calling data in function, use indexpath to get the element needed
    let data = EpisodeData.allEpisodes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotTableView.dataSource = self
        gotTableView.delegate = self
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row].name
      
        return cell
    }
    
    
}
