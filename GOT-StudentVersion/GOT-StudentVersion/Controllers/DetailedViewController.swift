//
//  DetailedViewController.swift
//  GOT-StudentVersion
//
//  Created by Kary Martinez on 8/19/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    
    var currentSeason: GOTEpisode!
    
    @IBOutlet weak var DescriptionText: UITextView!
    @IBOutlet weak var DetailedImage: UIImageView!
    
    override func viewDidLoad() {
        
        DescriptionText.text = currentSeason.summary
        DetailedImage.image = currentSeason.getImage()
        super.viewDidLoad()
        
    }
}

