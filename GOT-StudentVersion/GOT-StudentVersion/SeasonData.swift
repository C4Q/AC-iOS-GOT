//
//  SeasonData.swift
//  GOT-StudentVersion
//
//  Created by Sam Roman on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation
import UIKit


class SeasonData{
    var season1 = [GOTEpisode]()
    var season2 = [GOTEpisode]()
    var season3 = [GOTEpisode]()
    var season4 = [GOTEpisode]()
    var season5 = [GOTEpisode]()
    var season6 = [GOTEpisode]()
    var season7 = [GOTEpisode]()
    
    func Sort() -> [[GOTEpisode]]{
        
        var all:[[GOTEpisode]] = [[]]
        
        for i in GOTEpisode.allEpisodes{
            if i.season == 1{
                season1.append(i)
            }else if i.season == 2{
                season2.append(i)
            }else if i.season == 3{
                season3.append(i)
            }else if i.season == 4{
                season4.append(i)
            }else if i.season == 5{
                season5.append(i)
            }else if i.season == 6{
                season6.append(i)
            }else if i.season == 7{
                season7.append(i)
            }
        }
        all.append(season1)
        all.append(season2)
        all.append(season3)
        all.append(season4)
        all.append(season5)
        all.append(season6)
        all.append(season7)
        
        
        
        return all
    }
}
