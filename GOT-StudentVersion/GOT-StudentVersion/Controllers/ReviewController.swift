//
//  ReviewController.swift
//  GOT-StudentVersion
//
//  Created by hildy abreu on 8/14/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

//private enum SeasonSections: Int, CaseIterable {
//    case season1 = 1, season2, season3, season4, season5, season6, season7
//}


class ReviewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
        var gotArray = GOTEpisode.filteredSeasons()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section % 2 == 0 {
            let cellOdd = tableView.dequeueReusableCell(withIdentifier: "cellOdd") as! oddReviewCell
            
            cellOdd.oddTitle.text = gotArray[indexPath.section][indexPath.row].name
            //        cellOdd.oddEpisode.text = "S:\(gotArray[indexPath.section][indexPath.row].season) E:\(gotArray[indexPath.section][indexPath.row].number)"
            cellOdd.oddImage.image = UIImage(named: "\(gotArray[indexPath.section][indexPath.row].mediumImageID)")
            
            return cellOdd
        } else {
            let cellEven = tableView.dequeueReusableCell(withIdentifier: "cellEven") as! Even_ReviewTableViewCell
            cellEven.evenTitle.text = gotArray[indexPath.section][indexPath.row].name
            //        cellEven.evenEpisode.text = "S:\(gotArray[indexPath.section][indexPath.row].season) E:\(gotArray[indexPath.section][indexPath.row].number)"
            cellEven.evenImage.image = UIImage(named: "\(gotArray[indexPath.section][indexPath.row].mediumImageID)")
            return cellEven
        }
       
        
        
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return gotArray.count
    }
    @IBOutlet weak var tableView: UITableView!
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
      setupDelegation()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
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
            return " Nada"
        }
    }
    
    
    private func setupDelegation(){
       tableView.delegate = self
        tableView.dataSource = self
    





}

/*
 NOTES:
 Summary
 
 Asks the data source for a cell to insert in a particular location of the table view.
 Declaration
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
 Discussion
 
 In your implementation, create and configure an appropriate cell for the given index path. Create your cell using the table view's dequeueReusableCell(withIdentifier:for:) method, which recycles or creates the cell for you. After creating the cell, update the properties of the cell with appropriate data values.
 Never call this method yourself. If you want to retrieve cells from your table, call the table view's cellForRow(at:) method instead.
 Parameters
 
 tableView
 A table-view object requesting the cell.
 indexPath
 An index path locating a row in tableView.
 Returns
 
 An object inheriting from UITableViewCell that the table view can use for the specified row. UIKit raises an assertion if you return nil.
 
 Summary
 
 Tells the data source to return the number of rows in a given section of a table view.
 Declaration
 
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
 Parameters
 
 tableView
 The table-view object requesting this information.
 section
 An index number identifying a section in tableView.
 Returns
 
 The number of rows in section.
 
 */
}
