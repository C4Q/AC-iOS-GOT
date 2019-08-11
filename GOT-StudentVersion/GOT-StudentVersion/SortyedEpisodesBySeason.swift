//
//  SortyedEpisodesBySeason.swift
//  GOT-StudentVersion
//
//  Created by Mr Wonderful on 8/10/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class sortedBySeason{
    var season1 = [GOTEpisode]()
    var season2 = [GOTEpisode]()
    var season3 = [GOTEpisode]()
    var season4 = [GOTEpisode]()
    var season5 = [GOTEpisode]()
    var season6 = [GOTEpisode]()
    var season7 = [GOTEpisode]()
    
    func Sorting() -> [[GOTEpisode]]{
        
        var result:[[GOTEpisode]] = [[]]
        
        for eachSeason in GOTEpisode.allEpisodes{
            if eachSeason.season == 1{
                season1.append(eachSeason)
            }else if eachSeason.season == 2{
                season2.append(eachSeason)
            }else if eachSeason.season == 3{
                season3.append(eachSeason)
            }else if eachSeason.season == 4{
                season4.append(eachSeason)
            }else if eachSeason.season == 5{
                season5.append(eachSeason)
            }else if eachSeason.season == 6{
                season6.append(eachSeason)
            }else if eachSeason.season == 7{
                season7.append(eachSeason)
            }
        }
        result.append(season1)
        result.append(season2)
        result.append(season3)
        result.append(season4)
        result.append(season5)
        result.append(season6)
        result.append(season7)
        
        
        
        return result
    }
}

