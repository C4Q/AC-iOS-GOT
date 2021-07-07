//
//  GOTModel.swift
//  GOT-StudentVersion
//
//  Created by Luis Calle on 11/5/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class GOTModel {
    
    func makeGOTEpisodesDictionary(GOTEpisodes: [GOTEpisode]) -> [Int : [GOTEpisode]]{
        var allGOTEpisodesBySeason = [Int: [GOTEpisode]]()
        let allGOTEpisodes = GOTEpisode.allEpisodes
        for episode in allGOTEpisodes {
            if let episodesSoFar = allGOTEpisodesBySeason[episode.season-1] {
                var toAddNewEpisode: [GOTEpisode] = episodesSoFar
                toAddNewEpisode.append(episode)
                allGOTEpisodesBySeason.updateValue(toAddNewEpisode, forKey: episode.season-1)
            } else {
                allGOTEpisodesBySeason[episode.season-1] = [episode]
            }
        }
        return allGOTEpisodesBySeason
    }
    
}
