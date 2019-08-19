//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return season1.count
        case 1:
            return season2.count
        case 2:
            return season3.count
        case 3:
            return season4.count
        case 4:
            return season5.count
        case 5:
            return season6.count
        case 6:
            return season7.count
        default:
            return -1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0:
            if let cell = tableOutlet.dequeueReusableCell(withIdentifier: "FirstCell") as? FirstTableViewCell {
                cell.firstCellPicOutlet.image = UIImage(named: season1[indexPath.row].originalImageID)
                cell.firstCellNameLabel.text = season1[indexPath.row].name
                cell.firstCellEpisodeLabel.text = "S\(season1[indexPath.row].season) Ep \(season1[indexPath.row].number)"
                return cell
            }
        case 1:
            if let cell = tableOutlet.dequeueReusableCell(withIdentifier: "SecondCell") as? SecondTableViewCell {
                cell.secondCellPicOutlet.image = UIImage(named: season2[indexPath.row].originalImageID)
                cell.secondCellNameLabel.text = season2[indexPath.row].name
                cell.secondCellEpisodeLabel.text = "S\(season2[indexPath.row].season) Ep \(season2[indexPath.row].number)"
                return cell
            }
        case 2:
            if let cell = tableOutlet.dequeueReusableCell(withIdentifier: "FirstCell") as? FirstTableViewCell {
                cell.firstCellPicOutlet.image = UIImage(named: season3[indexPath.row].originalImageID)
                cell.firstCellNameLabel.text = season3[indexPath.row].name
                cell.firstCellEpisodeLabel.text = "S\(season3[indexPath.row].season) Ep \(season3[indexPath.row].number)"
                return cell
            }
        case 3:
            if let cell = tableOutlet.dequeueReusableCell(withIdentifier: "SecondCell") as? SecondTableViewCell {
                cell.secondCellPicOutlet.image = UIImage(named: season4[indexPath.row].originalImageID)
                cell.secondCellNameLabel.text = season4[indexPath.row].name
                cell.secondCellEpisodeLabel.text = "S\(season4[indexPath.row].season) Ep \(season4[indexPath.row].number)"
                return cell
            }
        case 4:
            if let cell = tableOutlet.dequeueReusableCell(withIdentifier: "FirstCell") as? FirstTableViewCell {
                cell.firstCellPicOutlet.image = UIImage(named: season5[indexPath.row].originalImageID)
                cell.firstCellNameLabel.text = season5[indexPath.row].name
                cell.firstCellEpisodeLabel.text = "S\(season5[indexPath.row].season) Ep \(season5[indexPath.row].number)"
                return cell
            }
        case 5:
            if let cell = tableOutlet.dequeueReusableCell(withIdentifier: "SecondCell") as? SecondTableViewCell {
                cell.secondCellPicOutlet.image = UIImage(named: season6[indexPath.row].originalImageID)
                cell.secondCellNameLabel.text = season6[indexPath.row].name
                cell.secondCellEpisodeLabel.text = "S\(season6[indexPath.row].season) Ep \(season6[indexPath.row].number)"
                return cell
            }
        case 6:
            if let cell = tableOutlet.dequeueReusableCell(withIdentifier: "FirstCell") as? FirstTableViewCell {
                cell.firstCellPicOutlet.image = UIImage(named: season7[indexPath.row].originalImageID)
                cell.firstCellNameLabel.text = season7[indexPath.row].name
                cell.firstCellEpisodeLabel.text = "S\(season7[indexPath.row].season) Ep \(season7[indexPath.row].number)"
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }
    

    @IBOutlet weak var tableOutlet: UITableView!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {fatalError("No identifier in segue")}


        switch segueIdentifier {
        case "listToDetailSegue":
            guard let detailVC = segue.destination as? DetailViewController else { fatalError("Unexpected segue view controller" )}

            guard let selectedIndexPath = tableOutlet.indexPathForSelectedRow else { fatalError("No row selected")}

            switch selectedIndexPath.section {
            case 0:
                detailVC.gotep = season1[selectedIndexPath.row]
            case 1:
                detailVC.gotep = season2[selectedIndexPath.row]
            case 2:
                detailVC.gotep = season3[selectedIndexPath.row]
            case 3:
                detailVC.gotep = season4[selectedIndexPath.row]
            case 4:
                detailVC.gotep = season5[selectedIndexPath.row]
            case 5:
                detailVC.gotep = season6[selectedIndexPath.row]
            case 6:
                detailVC.gotep = season7[selectedIndexPath.row]
            default:
                print("Bruh")
            }
        default:
            fatalError("Unexpected segue identifier")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableOutlet.delegate = self
        tableOutlet.dataSource = self
        tableOutlet.rowHeight = 200
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

