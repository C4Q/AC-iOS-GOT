//
//  GOTEpisdoe.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class GOTEpisode: CustomStringConvertible {
    var description: String {
        return "S: \(season), E: \(number)"
    }
    var descriptionDetailSeasonNumber: String {
        return "Season: \(season)"
    }
    var descriptionDetailEpisodeNumber: String {
        return "Episode: \(number)"
    }
    var descriptionDetailRuntime: String {
        return "Runtime: \(runtime)"
    }
    var descriptionDetailAirtime: String {
        return "Airtime: \(airdate)"
    }
    
    var airdate: String
    var id: Int
    var name: String
    var number: Int
    var season: Int
    var runtime: Int
    var summary: String
    var mediumImageID: String
    var originalImageID: String
    init(airdate: String, id: Int, name: String, number: Int, season: Int, runtime: Int, summary: String, mediumImageID: String, originalImageID: String) {
        self.airdate = airdate
        self.id = id
        self.name = name
        self.number = number
        self.season = season
        self.runtime = runtime
        self.summary = summary
        self.mediumImageID = mediumImageID
        self.originalImageID = originalImageID
    }
    
}
