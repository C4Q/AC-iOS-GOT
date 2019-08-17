//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    //MARK: VARIABLES
    
    var seasons1 = Seasons()
    var gotSeason = GOTEpisode.allEpisodes
    var isSearching = false
   var searchedSections = [[GOTEpisode]]()
   var seasons = [1,2,3,4,5,6,7]
  //var searchedEpisodes = [GOTEpisode]()
    var matrix = [[GOTEpisode]]()
    
    
    
    
//    var searchString:String {
//        didSet {
//
//            self.tableView.reloadData()
//        }
//    }
    var searchString = ""
    
    private func searchEpisodes(searchWord: String){
        let searchedEpisodes = gotSeason.filter{$0.name.lowercased().contains(searchWord.lowercased())}
        
        var season1 = [GOTEpisode]()
        var season2 = [GOTEpisode]()
        var season3 = [GOTEpisode]()
        var season4 = [GOTEpisode]()
        var season5 = [GOTEpisode]()
        var season6 = [GOTEpisode]()
        var season7 = [GOTEpisode]()
        
        for episode in searchedEpisodes {
            switch episode.season {
            case 1:
                season1.append(episode)
            case 2:
                season2.append(episode)
            case 3:
                season3.append(episode)
            case 4:
                season4.append(episode)
            case 5:
                season5.append(episode)
            case 6:
                season6.append(episode)
            case 7:
                season7.append(episode)
            default:
                break
            }
        }
        
        if season1.isEmpty {
            
        } else {
            searchedSections.append(season1)
        }
        if season2.isEmpty {
            //searchedSections.append(season2)
        } else {
            searchedSections.append(season2)
        }
        if season3.isEmpty {
            //searchedSections.append(season2)
        } else {
            searchedSections.append(season3)
        }
        
        if season4.isEmpty {
            //searchedSections.append(season2)
        } else {
            searchedSections.append(season4)
        }
        
        if season5.isEmpty {
            //searchedSections.append(season2)
        } else {
            searchedSections.append(season5)
        }
        
        if season6.isEmpty {
            //searchedSections.append(season2)
        } else {
            searchedSections.append(season6)
        }
        
        if season7.isEmpty {
            //searchedSections.append(season2)
        } else {
            searchedSections.append(season7)
        }
    
        tableView.reloadData()
       // print(searchedSections.count)

    }
    
    private func generateMatrix(){
       // var episodesInSeasons = [GOTEpisode]()
        var season1 = [GOTEpisode]()
        var season2 = [GOTEpisode]()
        var season3 = [GOTEpisode]()
        var season4 = [GOTEpisode]()
        var season5 = [GOTEpisode]()
        var season6 = [GOTEpisode]()
        var season7 = [GOTEpisode]()
       
        for episode in gotSeason {
            switch episode.season {
            case 1:
                season1.append(episode)
            case 2:
                season2.append(episode)
            case 3:
                season3.append(episode)
            case 4:
                season4.append(episode)
            case 5:
                season5.append(episode)
            case 6:
                season6.append(episode)
            case 7:
                season7.append(episode)
            default:
                break
            }
        }
        

        
        
      
    matrix = [season1, season2, season3, season4, season5, season6, season7]
        
    }
    
    
    
    var searchResults: [GOTEpisode] {
        get {
//            guard let searchString = searchString else {
//                return gotSeason
//            }
            guard searchString != "" else {
                return gotSeason
            }
            if let scopeVariable = searchBarOutlet.scopeButtonTitles {
                
                let currentscopeIndex = searchBarOutlet.selectedScopeButtonIndex
                switch scopeVariable[currentscopeIndex] {
                case "Name":
                    return gotSeason.filter {$0.name.lowercased().contains(searchString.lowercased())}
                case "Description":
                    return  gotSeason.filter {$0.summary.lowercased().contains(searchString.lowercased())}
                default:
                    return gotSeason
                }
            }
            
            
            
            return gotSeason
        }
        
    }
    
    //MARK: OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewDidLoad()
        //searchedSections.append(searchResults)
        generateMatrix()
        searchBarOutlet.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return isSearching ? searchedSections[section].count : matrix[section].count
        //seasons.allEpisode[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       // print(seasons1.allEpisode.count)
        //dump(seasons1.allEpisode)
//
//        if isSearching {
//            return " Season \(searchedSections[section][0].season)"
//        }
        
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
            return ""
        }
        
        
        //return "Season  \(seasons1.allEpisode[section][0].number)"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        if isSearching {
//            return searchedSections.count
//        }
//        return matrix.count
//
        return isSearching ? searchedSections.count : matrix.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let season = isSearching ? searchedSections[indexPath.section] : matrix[indexPath.section]
        dump(season.count)
        let dataInfo = season[indexPath.row]
        switch indexPath.section % 2 {
            
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "odd") as? TableViewCell
            cell?.episodeName.text = dataInfo.name
            cell?.episodeID.text = " Season: \(dataInfo.season) Episode: \(dataInfo.number)"
            cell?.imageView?.image = UIImage(named:dataInfo.mediumImageID)
            return cell!
        case 1:
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "even") as? RightTableViewCell
            cell2?.episodeImageView.image = UIImage(named:dataInfo.mediumImageID)
            cell2?.nameCell.text = dataInfo.name
            cell2?.ID.text = " Season: \(dataInfo.season) Episode: \(dataInfo.number)"
//            cell2?.episodeName.text = dataInfo.name
//            cell2?.episodeID.text = " Season: \(dataInfo.season) Episode: \(dataInfo.number)"
//            cell2?.imageView?.image = UIImage(named:dataInfo.mediumImageID)
            return cell2!
            
        default:
            return UITableViewCell()
        }
 
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "Detailed") as? DetailedViewController {
            viewController.gameOfThrones = searchResults[indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
        
    }
    func setupViewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        searchBarOutlet.delegate = self
    }
}
extension ViewController:UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        isSearching = true
//        searchBar.resignFirstResponder()
//        self.searchEpisodes(searchWord: searchBar.text ?? "")
//        if searchBar.text == "" {
//            isSearching = false
//            tableView.reloadData()
//
//        }
//
//
//
//       //searchString = searchBar.text
//
//
//    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearching = true
        searchBar.resignFirstResponder()
        self.searchEpisodes(searchWord: searchBar.text ?? "")
        if searchBar.text == "" {
            isSearching = false
            tableView.reloadData()
        }

    }
    
}

