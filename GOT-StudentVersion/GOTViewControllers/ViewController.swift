import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    //MARK: Outlets & Actions
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
     @IBOutlet weak var tableView: UITableView!
    @IBAction func segmentedControlToggled(_ sender: UISegmentedControl) {
        // reloads tableview when  segmentedControll is toggled
        tableView.reloadData()
    }
    //MARK: Variables
    var isSearching = false
    var allGOTSeasons = [[GOTEpisode]](){
        didSet {
            tableView.reloadData()
        }
    }
    var filteredEpisodes = [[GOTEpisode]]() { // This will hold the search results
        didSet {
            tableView.reloadData()
        }
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewDidLoad()
      segmentedControl.selectedSegmentIndex = 0
       
        // giving data to allGOTSeasons when the view loads
        allGOTSeasons = GOTEpisode.createGOTDataMatrix() //
    }
    //MARK: Functions
    
    func setupViewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        searchBarOutlet.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return isSearching ? filteredEpisodes[section].count : allGOTSeasons[section].count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let titleHeader = isSearching ? filteredEpisodes[section][0].season : allGOTSeasons[section][section].season
        return "Season \(titleHeader)"
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return isSearching ? filteredEpisodes.count :  allGOTSeasons.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let season = isSearching ? filteredEpisodes[indexPath.section] : allGOTSeasons[indexPath.section] //
        let dataInfo = season[indexPath.row]
        
        if dataInfo.season % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "even") as! TableViewCell
            cell.imageVie.image = UIImage(named:dataInfo.mediumImageID)
           
            cell.episodeName.text = dataInfo.name
            cell.episodeID.text = " Season: \(dataInfo.season) Episode: \(dataInfo.number)"
            cell.episodeName.textColor = .black
            cell.episodeID.textColor = .black
            cell.backgroundColor = .gray
            
            return cell
        } else {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "odd") as! TableViewCell
            cell2.imageVie.image = UIImage(named:dataInfo.mediumImageID)
            
            cell2.episodeName.text = dataInfo.name
            cell2.episodeID.text = " Season: \(dataInfo.season) Episode: \(dataInfo.number)"
          cell2.episodeName.textColor = .black
            cell2.episodeID.textColor = .black
            cell2.backgroundColor = .gray
            
            return cell2
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "Detailed") as? DetailedViewController {
           viewController.gameOfThrones = allGOTSeasons[indexPath.section][indexPath.row]

            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
extension ViewController:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    isSearching = true
    guard let searchedEpisode = searchBar.text else {
    return
    }
    if segmentedControl.selectedSegmentIndex == 0 {
    // then search by episode name
    filteredEpisodes = GOTEpisode.filterBySearchWord(searchWord: searchedEpisode)
    } else {
    filteredEpisodes = GOTEpisode.filterBySummary(summarySearchWord: searchedEpisode)
    }
    if searchedEpisode == "" {
    isSearching = false
    tableView.reloadData()
    }
    }
}

