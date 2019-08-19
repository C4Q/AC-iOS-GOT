//
//  SearchBarDelegate.swift
//  GOT-StudentVersion
//
//  Created by Mr Wonderful on 8/18/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

extension ViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == ""{
            isSearching = false
            gotTableView.reloadData()
        }else{
            isSearching = true
            gotSearchString = searchBar.text
        }
    }
}
