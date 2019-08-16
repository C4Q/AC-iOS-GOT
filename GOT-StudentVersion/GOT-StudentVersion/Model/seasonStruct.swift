//
//  seasonStruct.swift
//  GOT-StudentVersion
//
//  Created by Phoenix McKnight on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation
class Seasons {
    var allEpisode:[[GOTEpisode]]
    init() {
    let seasonOne:[GOTEpisode] = GOTEpisode.allEpisodes.filter({$0.season == 1})
    let seasonTwo:[GOTEpisode] = GOTEpisode.allEpisodes.filter({$0.season == 2})
    let seasonThree:[GOTEpisode] = GOTEpisode.allEpisodes.filter({$0.season == 3})
    let seasonFour:[GOTEpisode] = GOTEpisode.allEpisodes.filter({$0.season == 4})
    let seasonFive:[GOTEpisode] = GOTEpisode.allEpisodes.filter({$0.season == 5})
    let seasonSix:[GOTEpisode] = GOTEpisode.allEpisodes.filter({$0.season == 6})
    let seasonSeven:[GOTEpisode] = GOTEpisode.allEpisodes.filter({$0.season == 7})
    
  allEpisode = [seasonOne,seasonTwo,seasonThree,seasonFour,seasonFive,seasonSix,seasonSeven]
    
}
}
