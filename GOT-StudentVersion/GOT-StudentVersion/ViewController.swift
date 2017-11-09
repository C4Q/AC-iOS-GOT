//  TableViewController.swift
//  GOT-StudentVersion
//  Created by C4Q on 11/9/17.
//  Copyright © 2017 C4Q . All rights reserved.

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var searchBar: UISearchBar!
	
	var allEpisodes = GOTEpisode.allEpisodes
	var seasonWithEpisodes = [(season: Int, episodes: [GOTEpisode])]()
	
	func getEpisodes() {
		var numberOfSeasons: Int { return allEpisodes.max{$0.season < $1.season}!.season }
		for index in 1...numberOfSeasons {
			seasonWithEpisodes.append((index, allEpisodes.filter{$0.season == index ? true : false}))
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		searchBar.delegate = self
		getEpisodes()
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "Season: \(seasonWithEpisodes[section].season)"
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return seasonWithEpisodes.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return seasonWithEpisodes[section].episodes.count
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 110
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let section = seasonWithEpisodes[indexPath.section].season
		let cellType = section % 2 == 0 ? "RightAligned": "LeftAligned"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellType, for: indexPath) as? TableViewCell
		let episode = seasonWithEpisodes[indexPath.section].episodes[indexPath.row]
		cell?.episodeImageView.image = UIImage(named: episode.mediumImageID)
		cell?.episodeTitleLabel.text = episode.name
		cell?.seasonEpisodeLabel.text = "S: \(episode.season) E: \(episode.number)"
		return cell!
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let destination = segue.destination as? DetailViewController {
			let section = tableView.indexPathForSelectedRow!.section
			let row = tableView.indexPathForSelectedRow!.row
			let episode = seasonWithEpisodes[section].episodes[row]
			destination.episode = episode
		}
	}
	
	//-----------------------------------------------------------------------------------------------------
	/*
	var filteredepisodesArr: [GOTEpisode] {
		guard let searchTerm = searchTerm, searchTerm != "" else {
			return episodesArr
		}
		guard let scopeTitles = self.searchBar.scopeButtonTitles else {
			return episodesArr
		}
		let selectedIndex = self.searchBar.selectedScopeButtonIndex
		let filteringCriteria = scopeTitles[selectedIndex]
		switch filteringCriteria {
		case "Title":
			return episodesArr.filter{(episode) in
				episode.name.lowercased().contains(searchTerm.lowercased())
			}
		case "Description":
			return episodesArr.filter{(episode) in
				episode.location.lowercased().contains(searchTerm.lowercased())
			}
		default:
			return episodesArr
		}
	}
	
	var searchTerm: String? {//computed property
		didSet { //create a property observer to let us know when the search term changes, reload the data
			self.tableView.reloadData() //whenever we change the search term, reload the data
		}
	}
	
	//MARK: - Search Bar Delegate Methods
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		self.searchTerm = searchBar.text
		print("The user pressed search!")
		searchBar.resignFirstResponder()
	}
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		self.searchTerm = searchText
	}
	*/
	
	
}

