//
//  Images.swift
//  GOT-StudentVersion
//
//  Created by Ian Cervone on 8/12/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation
import UIKit

protocol Images {
  var imageName: String{get}
  func getImage() -> UIImage
}
