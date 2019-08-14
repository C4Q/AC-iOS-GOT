//
//  GOTDetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Levi Davis on 8/13/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class GOTDetailViewController: UIViewController {
    
    var gotEpisode: GOTEpisode!

    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var seasonLabel: UILabel!
    
    @IBOutlet weak var episodeLabel: UILabel!
    
    @IBOutlet weak var runtimeLabel: UILabel!
    
    @IBOutlet weak var airdateLabel: UILabel!
    
    @IBOutlet weak var summaryField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view.
    }
    
    private func setUpViews() {
        seasonLabel.text = gotEpisode.name
        episodeLabel.text = String(gotEpisode.number)
        runtimeLabel.text = String(gotEpisode.runtime)
        airdateLabel.text = String(gotEpisode.airdate)
        summaryField.text = gotEpisode.summary
        detailImage.image = gotEpisode.getImage()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
