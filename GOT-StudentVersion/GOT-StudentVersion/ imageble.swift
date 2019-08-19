//
//   imageble.swift
//  GOT-StudentVersion
//
//  Created by Kary Martinez on 8/19/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation
import UIKit

protocol imageble {
    var imageName: String {get}
    func getImage() -> UIImage
}
