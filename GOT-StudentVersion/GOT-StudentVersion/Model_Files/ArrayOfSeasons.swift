//
//  ArrayOfSeasons.swift
//  GOT-StudentVersion
//
//  Created by Jocelyn Boyd on 8/16/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation

func makeArrayofArrays(from gameOfThronesEps: [GOTEpisode]) -> [[GOTEpisode]] {
  
  var arrayOfArrays = [[GOTEpisode]]()
  
  for i in 1...7 {
    
    let thisArray = filterSeasonsBy(episode: gameOfThronesEps, andSeasonNum: i)
    arrayOfArrays.append(thisArray)
    
  }
  return arrayOfArrays
}
