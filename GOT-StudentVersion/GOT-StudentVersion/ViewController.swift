//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
 
    @IBOutlet weak var gotTableViews: UITableView!
    var episodeArr = [GOTEpisode]()
    
    let seasonOne = GOTEpisode.allEpisodes.filter({$0.season == 1})
    let seasonTwo = GOTEpisode.allEpisodes.filter({$0.season == 2})
    let seasonThree = GOTEpisode.allEpisodes.filter({$0.season == 3})
     let seasonFour = GOTEpisode.allEpisodes.filter({$0.season == 4})
     let seasonFive = GOTEpisode.allEpisodes.filter({$0.season == 5})
    let seasonSix = GOTEpisode.allEpisodes.filter({$0.season == 6})
    let seasonSeven = GOTEpisode.allEpisodes.filter({$0.season == 7})
 
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
            1
        }
        return 6
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
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
            return "It's something"
        }
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = gotTableViews.dequeueReusableCell(withIdentifier: "gameOfThronesCell") as? GOTTableViewCell {
                cell.episodeTitle.text = seasonOne[indexPath.row].name
                cell.seasonandEp.text = "Season: \(seasonOne[indexPath.row].season) Episode: \(seasonOne[indexPath.row].number)"
                cell.gotImageView.image = seasonOne[indexPath.row].getImage()
                return cell
            }
            
        case 1:
            if let cell = gotTableViews.dequeueReusableCell(withIdentifier: "gameOfThronesCell2") as? GOTTableViewCell2 {
                cell.epTitle.text = seasonTwo[indexPath.row].name
                cell.seasonAndEp.text = "Season: \(seasonTwo[indexPath.row].season) Episode: \(seasonTwo[indexPath.row].number)"
                cell.rightImage.image = seasonTwo[indexPath.row].getImage()
                return cell
            }
        case 2:
            if let cell = gotTableViews.dequeueReusableCell(withIdentifier: "gameOfThronesCell") as? GOTTableViewCell {
                cell.episodeTitle.text = seasonThree[indexPath.row].name
                cell.seasonandEp.text = "Season: \(seasonThree[indexPath.row].season) Episode: \(seasonThree[indexPath.row].number)"
                cell.gotImageView.image = seasonThree[indexPath.row].getImage()
                return cell
            }
        case 3:
            if let cell = gotTableViews.dequeueReusableCell(withIdentifier: "gameOfThronesCell2") as? GOTTableViewCell2 {
                cell.epTitle.text = seasonFour[indexPath.row].name
                cell.seasonAndEp.text = "Season: \(seasonFour[indexPath.row].season) Episode: \(seasonFour[indexPath.row].number)"
                cell.rightImage.image = seasonFour[indexPath.row].getImage()
                return cell
            }
        case 4:
            if let cell = gotTableViews.dequeueReusableCell(withIdentifier: "gameOfThronesCell") as? GOTTableViewCell {
                cell.episodeTitle.text = seasonFive[indexPath.row].name
                cell.seasonandEp.text = "Season: \(seasonFive[indexPath.row].season) Episode: \(seasonFive[indexPath.row].number)"
                cell.gotImageView.image = seasonFive[indexPath.row].getImage()
                return cell
            }
        case 6:
            if let cell = gotTableViews.dequeueReusableCell(withIdentifier: "gameOfThronesCell2") as? GOTTableViewCell2 {
                cell.epTitle.text = seasonSix[indexPath.row].name
                cell.seasonAndEp.text = "Season: \(seasonSix[indexPath.row].season) Episode: \(seasonSix[indexPath.row].number)"
                cell.rightImage.image = seasonSix[indexPath.row].getImage()
                return cell
            }
        case 7:
            if let cell = gotTableViews.dequeueReusableCell(withIdentifier: "gameOfThronesCell") as? GOTTableViewCell {
                cell.episodeTitle.text = seasonSeven[indexPath.row].name
                cell.seasonandEp.text = "Season: \(seasonSeven[indexPath.row].season) Episode: \(seasonSeven[indexPath.row].number)"
                cell.gotImageView.image = seasonSeven[indexPath.row].getImage()
                return cell
            }
        default:
            break
        }
        return UITableViewCell()
    }
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        gotTableViews.dataSource = self
        gotTableViews.delegate = self
        gotTableViews.backgroundColor = UIColor.black
        navigationController?.navigationBar.barTintColor = UIColor.black
        gotTableViews.separatorColor = UIColor.cyan
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.black
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.cyan
        header.textLabel?.shadowColor = UIColor.white
        let underlineAttribute = [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
        let underlineAttributedString = NSAttributedString(string: header.textLabel?.text! ?? " ", attributes: underlineAttribute)
        header.textLabel?.attributedText = underlineAttributedString
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let wholeShow = [seasonOne, seasonTwo, seasonThree, seasonFour, seasonFive, seasonSix, seasonSeven]
      let episode = wholeShow[ indexPath.section][indexPath.row]
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "episodeInfo") as? Episode {
            viewController.gotEpisode = episode
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

