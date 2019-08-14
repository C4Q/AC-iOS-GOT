//
//  SortyedEpisodesBySeason.swift
//  GOT-StudentVersion
//
//  Created by Mr Wonderful on 8/10/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class sortedBySeason{
    var season1 = GOTEpisode.allEpisodes.filter({$0.season == 1})
    var season2 = GOTEpisode.allEpisodes.filter({$0.season == 2})
    var season3 = GOTEpisode.allEpisodes.filter({$0.season == 3})
    var season4 = GOTEpisode.allEpisodes.filter({$0.season == 4})
    var season5 = GOTEpisode.allEpisodes.filter({$0.season == 5})
    var season6 = GOTEpisode.allEpisodes.filter({$0.season == 6})
    var season7 = GOTEpisode.allEpisodes.filter({$0.season == 7})
    
   func Sorting() -> [[GOTEpisode]]{
        let amountOfSeasons = [season1, season2, season3, season4, season5, season6, season7]
        return amountOfSeasons
    }
}

