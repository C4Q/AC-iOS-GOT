//
//  DataSourceViewController.swift
//  GOT-StudentVersion
//
//  Created by Mr Wonderful on 8/18/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

extension ViewController: UITableViewDataSource{
    //MARK: -- Table View Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        
        let numberOfSec = isSearching ? 1 : got.count
        return numberOfSec
    }
    //This code goes into the [[GOTEpisode]], grabs each section starting from index 0, and grabs the classification string and returns it to be displayed in the title header
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let headerTitle = isSearching ? "" : "Season \(got[section][0].season)"
        return headerTitle
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let numberOfRow = isSearching ? gotSeachResults.count : got[section].count
        return numberOfRow
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GOTID") as! GotTableViewCell
        
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "GOTID2") as! GotTableViewCell
        
        let info = isSearching ? gotSeachResults[indexPath.row] : got[indexPath.section][indexPath.row]
        
        cell.gotName.text = "\( info.name)"
        cell.gotName.font = UIFont(name: "Papyrus", size: 14)
        cell.gotName.textColor = .white
        cell.seasonAndEpisode.text = "S:\( info.season) E: \(info.number)"
        cell.seasonAndEpisode.textColor = .white
        cell.gotImageView.image = UIImage(named: info.mediumImageID)
        
        cell2.gotName.text = "\( info.name)"
        cell2.gotName.font = UIFont(name: "Papyrus", size: 14)
        cell2.gotName.textColor = .white
        cell2.seasonAndEpisode.text = "S:\( info.season) E: \(info.number)"
        cell2.seasonAndEpisode.textColor = .white
        cell2.gotImageView.image = UIImage(named: info.mediumImageID)
        
        if info.season % 2 == 1{
            return cell
        }else {
            return cell2
        }
    }
}
