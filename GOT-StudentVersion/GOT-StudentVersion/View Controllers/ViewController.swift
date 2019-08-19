

import UIKit

class ViewController: UIViewController {
    
    //MARK: -- Outlet & imported Variables
    @IBOutlet var gotTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    var got = GOTEpisode.allSeasons
    var gotEpisodes = GOTEpisode.allEpisodes
    var isSearching = false
    var gotSeachResults:[GOTEpisode] {
        get{
            guard let gotSearchString = gotSearchString else {
                return gotEpisodes
            } //this filters searches through the searchString and makes sure its not empty else returns gotEpisodes
            guard gotSearchString != "" else {
                return gotEpisodes
            }
            
            if let gotScoptTitles = searchBar.scopeButtonTitles {
                let currentScopeIndex = searchBar.selectedScopeButtonIndex
                
                switch gotScoptTitles[currentScopeIndex]{
                case "Summary":
                    return gotEpisodes.filter({$0.summary.lowercased().replacingOccurrences(of: " ", with: "").contains(gotSearchString.lowercased().replacingOccurrences(of: " ", with: ""))})
                case "Episode":
                    return gotEpisodes.filter({$0.name.lowercased().replacingOccurrences(of: " ", with: "").contains(gotSearchString.lowercased().replacingOccurrences(of: " ", with: ""))})
                default:
                    return gotEpisodes
                }
            }
            return gotEpisodes
        }
    }
    
    var gotSearchString:String? = nil {
        didSet {
            self.gotTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotTableView.delegate = self
        gotTableView.dataSource = self
        searchBar.delegate = self
    }
}

extension ViewController: UITableViewDataSource{
    //MARK: -- Table View Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        
        let numberOfSec = isSearching ? 1 : got.count
        return numberOfSec
    }
    //This code goes into the [[GOTEpisode]], grabs each section starting from index 0, and grabs the classification string and returns it to be displayed in the title header
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let headerTitle = isSearching ? "" : "Season \(got[section][0].season)"
        return headerTitle
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let numberOfRow = isSearching ? gotSeachResults.count : got[section].count
        return numberOfRow
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GOTID") as! GotTableViewCell
        
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "GOTID2") as! GotTableViewCell
        
        let info = isSearching ? gotSeachResults[indexPath.row] : got[indexPath.section][indexPath.row]
      
        cell.gotName.text = "\( info.name)"
        cell.gotName.font = UIFont(name: "Papyrus", size: 14)
        cell.gotName.textColor = .white
        cell.seasonAndEpisode.text = "S:\( info.season) E: \(info.number)"
        cell.seasonAndEpisode.textColor = .white
        cell.gotImageView.image = UIImage(named: info.mediumImageID)
        
        cell2.gotName.text = "\( info.name)"
        cell2.gotName.font = UIFont(name: "Papyrus", size: 14)
        cell2.gotName.textColor = .white
        cell2.seasonAndEpisode.text = "S:\( info.season) E: \(info.number)"
        cell2.seasonAndEpisode.textColor = .white
        cell2.gotImageView.image = UIImage(named: info.mediumImageID)
        
        if info.season % 2 == 1{
            return cell
        }else {
            return cell2
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .black
    }
    //MARK: -- Table View Delgates
    //sets the height of the sections
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150)
    }
    
    //function to pass data from one tableView Controller to another tableView Controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if let detailViewControler = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController{
            
            let info = isSearching ? gotSeachResults[indexPath.row] : got[indexPath.section][indexPath.row]
            // this line passes the model to the second view controller and allows the second view controller tro figure out what it needs to assign to its attritubes
            detailViewControler.gotEpisode = info
            
            self.navigationController?.pushViewController(detailViewControler, animated: true)
        }
    }
}

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
