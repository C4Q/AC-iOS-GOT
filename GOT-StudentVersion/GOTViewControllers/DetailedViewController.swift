//
//  Detailed.swift
//  GOT-StudentVersion
//
//  Created by Phoenix McKnight on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit
class DetailedViewController:UIViewController {
    @IBOutlet weak var imageViewDetailed: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSeason: UILabel!
    @IBOutlet weak var labelTextField: UITextView!
    @IBOutlet weak var labelEpisode: UILabel!
    @IBOutlet weak var labelRunTime: UILabel!
    @IBOutlet weak var labelAirDate: UILabel!
    var gameOfThrones:GOTEpisode!
    func setUpViews() {
        labelName.text = gameOfThrones.name
        labelSeason.text = "Season: \(gameOfThrones.season)"
        labelAirDate.text = gameOfThrones.airdate
        labelEpisode.text = "Episode: \(gameOfThrones.number)"
        labelRunTime.text = "Runtime: \(gameOfThrones.runtime) minutes"
        imageViewDetailed.image = UIImage(named:"\(gameOfThrones.originalImageID)")
        labelTextField.text = gameOfThrones.summary
    }
    func changeUIcolors() {
        labelName.textColor = .black
        labelSeason.textColor = .black
        labelAirDate.textColor = .black
        labelEpisode.textColor = .black
        labelRunTime.textColor = .black
        labelTextField.textColor = .black
        view.backgroundColor = .darkGray
        labelTextField.backgroundColor = .darkGray
    }
    override func viewDidLoad() {
        super .viewDidLoad()
        setUpViews()
        changeUIcolors()
      

    }
}
