//
//  filterBySeason.swift
//  GOT-StudentVersion
//
//  Created by Angela Garrovillas on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation
func filterBySeason(got: [GOTEpisode], season: Int) -> [GOTEpisode] {
    return got.filter({$0.season == season})
}

