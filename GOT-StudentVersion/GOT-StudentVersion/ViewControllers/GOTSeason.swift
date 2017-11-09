//
//  GOTSeason.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/9/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation


class GOTSeason {
    let seasonNum: Int
    let episodes: [GOTEpisode]
    
    init(seasonNum: Int, episodes: [GOTEpisode]) {
        self.seasonNum = seasonNum
        self.episodes = episodes
    }
    class func seasonsUsingEpisodes(episodes: [GOTEpisode]) -> [GOTSeason] {
        var seasonsDictionary = [Int: [GOTEpisode]]()
        
        for episode in episodes {
            let seasonNum = episode.season
            var seasonEpisodes: [GOTEpisode] = seasonsDictionary[seasonNum] ?? []
            seasonEpisodes.append(episode)
            seasonsDictionary[seasonNum] = seasonEpisodes
        }
        let seasons: [GOTSeason] = seasonsDictionary.map({ keyValue in
            let sortedEpisodes = keyValue.value
                .sorted(by: { ep1, ep2 in
                    return ep1.number < ep2.number
            })
            
            return GOTSeason(seasonNum: keyValue.key,
                             episodes: sortedEpisodes)
        })
        
        return seasons.sorted(by: { (season1, season2) -> Bool in
            return season1.seasonNum < season2.seasonNum
        })
    }
}




