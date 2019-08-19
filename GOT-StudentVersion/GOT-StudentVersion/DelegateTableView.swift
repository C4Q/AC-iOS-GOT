//
//  DelegateTableView.swift
//  GOT-StudentVersion
//
//  Created by Mr Wonderful on 8/18/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .black
    }
    //MARK: -- Table View Delgates
    //sets the height of the sections
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150)
    }
    
    //function to pass data from one tableView Controller to another tableView Controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if let detailViewControler = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController{
            
            let info = isSearching ? gotSeachResults[indexPath.row] : got[indexPath.section][indexPath.row]
            // this line passes the model to the second view controller and allows the second view controller tro figure out what it needs to assign to its attritubes
            detailViewControler.gotEpisode = info
            
            self.navigationController?.pushViewController(detailViewControler, animated: true)
        }
    }
}
