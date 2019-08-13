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
    
    //will return an array, when calling data in function, use indexpath to get the element needed
    let data = EpisodeData.season1
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProtocols()
    }
    
    
    
    private func setupProtocols() {
        gotTableView.delegate = self
        gotTableView.dataSource = self
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = gotTableView.dequeueReusableCell(withIdentifier: "oddCell", for: indexPath) as? oddGOTTVCell {
            cell.oddTitleLabel?.text = data[indexPath.row].name
            cell.oddEpisodeInfoLabel?.text = "s:  \(String(data[indexPath.row].season)) ep: \(data[indexPath.row].number)"
            cell.oddImage.image = UIImage(named: data[indexPath.row].mediumImageID)
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
