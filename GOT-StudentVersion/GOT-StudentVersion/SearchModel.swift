//
//  SearchModel.swift
//  GOT-StudentVersion
//
//  Created by Richard Crichlow on 11/5/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit

class CustomSearch {
    var searchBarString = ""
    var allEpisodes = GOTEpisode.allEpisodes
    
    func searchByTitle(searchTerm: String) {
        var searchResults: [GOTEpisode]
        for episode in allEpisodes {
            if episode.name.contains(searchTerm) {
                
            }
        }
    }
    
    func searchByDescription(searchTerm: String) {
        var searchResults: [GOTEpisode]
        for episode in allEpisodes {
            if episode.summary.contains(searchTerm) {
                
            }
        }
    }
    
    
    
    
    
    
    
    
}














