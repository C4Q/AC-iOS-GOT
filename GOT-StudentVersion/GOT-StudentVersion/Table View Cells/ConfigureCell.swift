//
//  Table View Methods.swift
//  GOT-StudentVersion
//
//  Created by Masai Young on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit

protocol Configurable {}

extension Configurable where Self: GOTImageTableViewCell {
    
    func configureCell(with episode: GOTEpisode) {
        self.titleLabel.text = episode.name
        self.seasonLabel.text = "S:\(episode.season) E:\(episode.number)"
        self.episodeImageView.image = UIImage(named: episode.originalImageID)
    }
}



