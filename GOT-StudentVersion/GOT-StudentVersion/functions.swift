//
//  functions.swift
//  GOT-StudentVersion
//
//  Created by EricM on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation
import  UIKit

class Functions{
    
    func rows(_ a: Int) -> Int{
        switch a{
        case 0:
            return GOTEpisode.num1.count
        case 1:
            return GOTEpisode.num2.count
        case 2:
            return GOTEpisode.num3.count
        case 3:
            return GOTEpisode.num4.count
        case 4:
            return GOTEpisode.num5.count
        case 5:
            return GOTEpisode.num6.count
        case 6:
            return GOTEpisode.num7.count
        default:
            return 0
        }
    }
    
    func title(_ a: Int) -> String? {
        switch a{
        case 0:
            return "Season 1"
        case 1:
            return "Season 2"
        case 2:
            return "Season 3"
        case 3:
            return "Season 4"
        case 4:
            return "Season 5"
        case 5:
            return "Season 6"
        case 6:
            return "Season 7"
        default:
            return "not a season"
        }
    }
}
