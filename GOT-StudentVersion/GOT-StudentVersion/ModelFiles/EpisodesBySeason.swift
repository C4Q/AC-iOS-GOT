//
//  EpisodesBySeason.swift
//  GOT-StudentVersion
//
//  Created by Tia Lendor on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation
// contains all the seasons

struct Series {
    

    static var gotSeason1 = GOTEpisode.allEpisodes.filter( {$0.season == 1})
    static var gotSeason2 = GOTEpisode.allEpisodes.filter( {$0.season == 2})
    static var gotSeason3 = GOTEpisode.allEpisodes.filter( {$0.season == 3})
    static var gotSeason4 = GOTEpisode.allEpisodes.filter( {$0.season == 4})
    static var gotSeason5 = GOTEpisode.allEpisodes.filter( {$0.season == 5})
    static var gotSeason6 = GOTEpisode.allEpisodes.filter( {$0.season == 6})
    static var gotSeason7 = GOTEpisode.allEpisodes.filter( {$0.season == 7})
   
    static var gotArr = [gotSeason1, gotSeason2, gotSeason3, gotSeason4, gotSeason5, gotSeason6, gotSeason7]

}
