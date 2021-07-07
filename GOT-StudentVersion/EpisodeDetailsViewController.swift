
import UIKit

class EpisodeDetailsViewController: UIViewController {

  @IBOutlet weak var detailImage: UIImageView!
  @IBOutlet weak var detailTitle: UILabel!
  @IBOutlet weak var detailSeason: UILabel!
  @IBOutlet weak var detailEpisode: UILabel!
  @IBOutlet weak var detailRuntime: UILabel!
  @IBOutlet weak var detailAirdate: UILabel!
  @IBOutlet weak var detailSummary: UILabel!
  
  var selectedEpisode: GOTEpisode!
  
    override func viewDidLoad() {
        super.viewDidLoad()
       setUpViews()
      self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fullThrone.png")!)
    }
  
  private func setUpViews() {
    detailTitle.text = selectedEpisode.name
    detailSeason.text = "Season: \(selectedEpisode.season)"
    detailEpisode.text = "Episode: \(selectedEpisode.number)"
    detailRuntime.text = "RunTime: \(selectedEpisode.runtime)"
    detailAirdate.text = "Date: \(selectedEpisode.airdate)"
    detailSummary.text = selectedEpisode.summary
    detailImage.image = UIImage(named: selectedEpisode.originalImageID)
  }
  
}

