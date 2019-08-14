//
//  SortyedEpisodesBySeason.swift
//  GOT-StudentVersion
//
//  Created by Mr Wonderful on 8/10/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class sortedBySeason{
    var allSeasons: [[GOTEpisode]]
    
    init(){
        let season1 = GOTEpisode.allEpisodes.filter({$0.season == 1})
        let season2 = GOTEpisode.allEpisodes.filter({$0.season == 2})
        let season3 = GOTEpisode.allEpisodes.filter({$0.season == 3})
        let season4 = GOTEpisode.allEpisodes.filter({$0.season == 4})
        let season5 = GOTEpisode.allEpisodes.filter({$0.season == 5})
        let season6 = GOTEpisode.allEpisodes.filter({$0.season == 6})
        let season7 = GOTEpisode.allEpisodes.filter({$0.season == 7})
        allSeasons = [season1, season2, season3, season4, season5, season6, season7]
    }
}

