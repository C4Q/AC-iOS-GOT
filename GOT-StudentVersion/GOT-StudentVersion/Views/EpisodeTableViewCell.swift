
import UIKit

class EpisodeTableViewCell: UITableViewCell {

  
  @IBOutlet weak var episodeImageView: UIImageView!
  
  @IBOutlet weak var episodeTitleLabel: UILabel!
  
  @IBOutlet weak var seasonEpisodeLabel: UILabel!
  
  
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
