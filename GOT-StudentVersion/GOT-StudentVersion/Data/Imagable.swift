//
//  Imagable.swift
//  GOT-StudentVersion
//
//  Created by Levi Davis on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation
import UIKit

protocol Imageable {
    var imageName: String {get}
    func getImage() -> UIImage
}
