//
//  Episodes_By_Season.swift
//  GOT-StudentVersion
//
//  Created by Jocelyn Boyd on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation

func filterSeasonsBy(episode: [GOTEpisode], andSeasonNum: Int) -> [GOTEpisode] { return episode.filter( {$0.season == andSeasonNum} )
}
