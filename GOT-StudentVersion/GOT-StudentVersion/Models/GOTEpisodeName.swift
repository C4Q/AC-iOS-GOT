//
//  GOTEpisodeName.swift
//  GOT-StudentVersion
//
//  Created by Mr Wonderful on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation

struct EpisodeNames {

    func  putNameOfEpisodesInAnArray() ->[String]{
        var namesOfGotEpisodes:[String] = []
        
        for season in GOTEpisode.allEpisodes{
            namesOfGotEpisodes.append(season.name)
        }
        return namesOfGotEpisodes
    }
    
}
