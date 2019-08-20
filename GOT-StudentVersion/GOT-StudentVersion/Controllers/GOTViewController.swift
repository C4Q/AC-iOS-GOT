//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by Anthony Gonzalez on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class GOTViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
   
    //MARK: - Properties
    let allSeasons = GOTEpisode.allSeasons
    var searchString: String? = nil { didSet { tableView.reloadData() } }
    var EpisodeSearchResults: [[GOTEpisode]] {
        get {
            guard let searchString = searchString else { return allSeasons }
            guard searchString != ""  else { return allSeasons }
            switch searchBarOutlet.selectedScopeButtonIndex {
            case 0: return GOTEpisode.getSpecificEpisodes(selectedScopeIndex: 0, searchString: searchString)
            case 1: return GOTEpisode.getSpecificEpisodes(selectedScopeIndex: 1, searchString: searchString)
            default: return allSeasons
            }
        }
    }
    
    //MARK: - Segue method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifer = segue.identifier else {fatalError("No indentifier in segue")}
        
        switch segueIdentifer {
        case "segueToDetail":
            guard let destVC = segue.destination as? detailViewController else {
                fatalError("Unexpected segue VC")
            }
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {fatalError("No row selected")
            }
            let currentEpisode = EpisodeSearchResults[selectedIndexPath.section][selectedIndexPath.row]
            destVC.myCurrentGOTEpisode = currentEpisode
        default:
            fatalError("unexpected segue identifies")
        }
    }
    
    //MARK: -- View methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        searchBarOutlet.delegate = self
        tableView.sectionIndexColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar for current view controller
        self.navigationController?.isNavigationBarHidden = true;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the navigation bar on other view controllers
        self.navigationController?.isNavigationBarHidden = false;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


//MARK: -- Table Datasource Methods
extension GOTViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return EpisodeSearchResults.count
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
        case 7: return "Season 8"
        default: return ""
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if (searchBarOutlet.isFirstResponder) {
            return nil
        } else {
            return ["1", "2", "3", "4", "5", "6", "7", "8"]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EpisodeSearchResults[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentEpisode: GOTEpisode = EpisodeSearchResults[indexPath.section][indexPath.row]
        
        switch indexPath.section % 2 {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "myGOTCell", for: indexPath) as? GoTEvenNumberCell {
                cell.episodeNumberLabel.text = "S:\(currentEpisode.season) E:\(currentEpisode.number)"
                cell.episodePreviewImage.image = currentEpisode.getImage()
                
                let attrString = NSAttributedString(string: currentEpisode.name, attributes: [NSAttributedString.Key.strokeColor: UIColor.white, NSAttributedString.Key.foregroundColor: UIColor.yellow, NSAttributedString.Key.strokeWidth: -4.0, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.5)])
                cell.episodeNameLabel.attributedText = attrString
                
                let selectedView = UIView()
                selectedView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
                cell.selectedBackgroundView = selectedView
                return cell
            }
            
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "myOddGOTCell", for: indexPath) as? GoTOddNumberCell {
                cell.episodeNumberLabel.text = "S:\(currentEpisode.season) E:\(currentEpisode.number)"
                cell.episodePreviewImage.image = currentEpisode.getImage()
                
                let attrString = NSAttributedString(string: currentEpisode.name, attributes: [NSAttributedString.Key.strokeColor: UIColor.white, NSAttributedString.Key.foregroundColor: UIColor.yellow, NSAttributedString.Key.strokeWidth: -4.0, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.5)])
                cell.episodeNameLabel.attributedText = attrString
                
                let selectedView = UIView()
                selectedView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
                cell.selectedBackgroundView = selectedView
                return cell
            }
            
        default: break
        }
        
        return UITableViewCell()
    }
}


//MARK: -- Table Delegate Methods
extension GOTViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor(displayP3Red: 0.351, green: 0.121, blue: 0.097, alpha: 1)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}


//MARK: -- Searchbar Delegate Methods
extension GOTViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsScopeBar = false
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
        searchBar.sizeToFit()
        tableView.reloadSectionIndexTitles()
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsScopeBar = true
        searchBar.setShowsCancelButton(true, animated: true)
        searchBar.sizeToFit()
        tableView.reloadSectionIndexTitles()
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsScopeBar = false
        searchBar.setShowsCancelButton(false, animated: true)       
        searchBar.sizeToFit()
        tableView.reloadSectionIndexTitles()
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        tableView.reloadData()
    }
}

