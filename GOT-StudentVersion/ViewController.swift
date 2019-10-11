
import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
  

  @IBOutlet weak var GOTTableView: UITableView!

  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "SEASON \(section + 1)"
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return GOTEpisode.allSeasons[section].count
  }

  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section % 2 {
    case 0:
      let cell = GOTTableView.dequeueReusableCell(withIdentifier: "oddSeason", for: indexPath) as! EpisodeTableViewCell
      let episode = GOTEpisode.allSeasons[indexPath.section][indexPath.row]
      cell.episodeTitleLabel.text = episode.name
      cell.seasonEpisodeLabel.text = "S: \(indexPath.section + 1) E: \(episode.number)"
      cell.episodeImageView.image = episode.getImage()
      cell.episodeTitleLabel?.textColor = UIColor.white
      cell.seasonEpisodeLabel?.textColor = UIColor.white
      cell.backgroundView = UIImageView(image: UIImage(named: "blueThrone.png"))
      return cell
    default:
      let cell = GOTTableView.dequeueReusableCell(withIdentifier: "evenSeason", for: indexPath) as! EpisodeTableViewCell
      let episode = GOTEpisode.allSeasons[indexPath.section][indexPath.row]
      cell.episodeTitleLabel.text = episode.name
      cell.seasonEpisodeLabel.text = "S: \(indexPath.section + 1) E: \(episode.number)"
      cell.episodeImageView.image = episode.getImage()
      cell.episodeTitleLabel?.textColor = UIColor.white
      cell.seasonEpisodeLabel?.textColor = UIColor.white
      cell.backgroundView = UIImageView(image: UIImage(named: "redThrone.png"))
      return cell
    }
  }
    
    
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }


   func numberOfSections(in tableView: UITableView) -> Int {
    return 7
  }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      GOTTableView.delegate = self
      GOTTableView.dataSource = self
    }

  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let tappedEpisode: EpisodeTableViewCell = sender as? EpisodeTableViewCell {
      if segue.identifier == "EpisodeDetailViewSeque" || segue.identifier == "EvenEpisodeSegue" {
        let episodeDetailViewController: EpisodeDetailsViewController = segue.destination as! EpisodeDetailsViewController
        let sectionIndexPath = GOTTableView.indexPathForSelectedRow!.section
        let cellIndexPath = GOTTableView.indexPathForSelectedRow!.row
        let episode = GOTEpisode.allSeasons[sectionIndexPath][cellIndexPath]
        episodeDetailViewController.selectedEpisode = episode
      }
    }
  }
  

}

