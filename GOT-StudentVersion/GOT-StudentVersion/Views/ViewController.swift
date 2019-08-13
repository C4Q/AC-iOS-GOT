//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var GOTEpisodeToBePassed = GOTEpisode(airdate: "", id: 0, name: "", number: 0, season: 0, runtime: 0, summary: "", mediumImageID: "", originalImageID: "")
    
    
    let allSeasons = [GOTEpisode.season1, GOTEpisode.season2, GOTEpisode.season3, GOTEpisode.season4, GOTEpisode.season5, GOTEpisode.season6, GOTEpisode.season7]
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentSeason: [GOTEpisode] = allSeasons[indexPath.section]
        let currentEpisode: GOTEpisode = currentSeason[indexPath.row]
        GOTEpisodeToBePassed.summary = currentEpisode.summary
        GOTEpisodeToBePassed.originalImageID = currentEpisode.originalImageID
        GOTEpisodeToBePassed.airdate = currentEpisode.airdate
        GOTEpisodeToBePassed.season = currentEpisode.season
        GOTEpisodeToBePassed.number = currentEpisode.number
        GOTEpisodeToBePassed.name = currentEpisode.name
        GOTEpisodeToBePassed.runtime = currentEpisode.runtime
        
        performSegue(withIdentifier: "segueToDetail", sender: self)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSeasons[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0: return "Season 1"
        case 1: return "Season 2"
        case 2: return "Season 3"
        case 3: return "Season 4"
        case 4: return "Season 5"
        case 5: return "Season 6"
        case 6: return "Season 7"
        default: return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSeason: [GOTEpisode] = allSeasons[indexPath.section]
        let currentEpisode: GOTEpisode = currentSeason[indexPath.row]
        
        switch indexPath.section % 2 {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "myGOTCell", for: indexPath) as? GoTTableViewCell {
                cell.episodeNumberLabel.text = "S:\(currentEpisode.season) E:\(currentEpisode.number)"
                cell.episodePreviewImage.image = currentEpisode.getImage()
//                cell.episodePreviewImage.layer.cornerRadius =  cell.episodePreviewImage.frame.height / 3.5
                
                let attrString = NSAttributedString(string: currentEpisode.name, attributes: [NSAttributedStringKey.strokeColor: UIColor.white, NSAttributedStringKey.foregroundColor: UIColor.yellow, NSAttributedStringKey.strokeWidth: -4.0, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17.5)])
                cell.episodeNameLabel.attributedText = attrString
                
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "myOddGOTCell", for: indexPath) as? GoTOddTableViewCell {
                cell.episodeNumberLabel.text = "S:\(currentEpisode.season) E:\(currentEpisode.number)"
                cell.episodePreviewImage.image = currentEpisode.getImage()
                
                let attrString = NSAttributedString(string: currentEpisode.name, attributes: [NSAttributedStringKey.strokeColor: UIColor.white, NSAttributedStringKey.foregroundColor: UIColor.yellow, NSAttributedStringKey.strokeWidth: -4.0, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17.5)])
                cell.episodeNameLabel.attributedText = attrString
                
                return cell
            }
        default: break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor(displayP3Red: 0.351, green: 0.121, blue: 0.097, alpha: 1)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : detailViewController = segue.destination as! detailViewController
        destVC.myCurrentGOTEpisode.summary = GOTEpisodeToBePassed.summary
        destVC.myCurrentGOTEpisode.originalImageID = GOTEpisodeToBePassed.originalImageID
        destVC.myCurrentGOTEpisode.name = GOTEpisodeToBePassed.name
        destVC.myCurrentGOTEpisode.runtime = GOTEpisodeToBePassed.runtime
        destVC.myCurrentGOTEpisode.season = GOTEpisodeToBePassed.season
        destVC.myCurrentGOTEpisode.number = GOTEpisodeToBePassed.number
        destVC.myCurrentGOTEpisode.airdate = GOTEpisodeToBePassed.airdate
        
    }
    
}
//TODO: -- GradientView subclass

