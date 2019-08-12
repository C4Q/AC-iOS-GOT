//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var gotTableView: UITableView!
    
    let episode = GOTEpisode.allEpisodes
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
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
//        switch indexPath.section {
//        case 0:
//        if let cell = gotTableView.dequeueReusableCell(withIdentifier: "gotIDCell", for: indexPath) as? EpisodeTVC {
//            cell.textLabel?.text = episode[indexPath.row].name
//            return cell
//        }
//        return cell
//        default:
//            break
//        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Season One"
        case 1:
            return "Season Two"
        case 2:
            return "Season Three"
        case 3:
            return "Season Four"
        case 4:
            return "Season Five"
        case 5:
            return "Season Six"
        case 6:
            return "Season Seven"
        default:
            return "Season not found"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        gotTableView.delegate = self
        gotTableView.dataSource = self
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


}

