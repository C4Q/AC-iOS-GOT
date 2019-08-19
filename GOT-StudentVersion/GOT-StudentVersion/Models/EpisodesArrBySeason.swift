//
//  EpisodesArrBySeason.swift
//  GOT-StudentVersion
//
//  Created by Angela Garrovillas on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation
var gotSeason1 = filterBySeason(got: GOTEpisode.allEpisodes, season: 1)
var gotSeason2 = filterBySeason(got: GOTEpisode.allEpisodes, season: 2)
var gotSeason3 = filterBySeason(got: GOTEpisode.allEpisodes, season: 3)
var gotSeason4 = filterBySeason(got: GOTEpisode.allEpisodes, season: 4)
var gotSeason5 = filterBySeason(got: GOTEpisode.allEpisodes, season: 5)
var gotSeason6 = filterBySeason(got: GOTEpisode.allEpisodes, season: 6)
var gotSeason7 = filterBySeason(got: GOTEpisode.allEpisodes, season: 7)

var arrOfSeasonsData = [gotSeason1,gotSeason2,gotSeason3,gotSeason4,gotSeason5,gotSeason6,gotSeason7]

func filterForSearchResult(arr: [GOTEpisode], string: String) -> [GOTEpisode] {
    var newArrOfArr: [GOTEpisode] = []
    for ep in arr {
        if ep.name.lowercased().contains(string.lowercased()) {
            newArrOfArr.append(ep)
        }
    }
    return newArrOfArr
}

func makeArrofSeasons(allEp: [GOTEpisode], seasons: Int) -> [[GOTEpisode]] {
    var newArrOfArr = [[GOTEpisode]]()
    for seasonNum in 1...seasons {
        var season = [GOTEpisode]()
        for ep in allEp {
            if ep.season == seasonNum {
                season.append(ep)
            }
        }
        newArrOfArr.append(season)
    }
    return newArrOfArr
}
