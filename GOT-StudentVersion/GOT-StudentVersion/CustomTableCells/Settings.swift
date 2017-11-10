//
//  Settings.swift
//  GOT-StudentVersion
//
//  Created by C4Q on 11/8/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
enum TextCase:String {
    case lower, upper, capital
}

struct Settings {
    static var numberOfRows: Int = 0
    static var alternatingCell: Bool = false
    static var red:Float = 1
    static var green:Float = 1
    static var blue:Float = 1
    static var currentFont:String = "Arial"
    static var textCase: TextCase = .lower
    static var fonts = ["ArialMT", "Sans Serif", "Times New Roman-Bold", "HelveticaNeue-Bold", "AlNile-Bold", "AmericanTypewriter", "AppleColorEmoji", "AppleSDGothicNeo-SemiBold", "AvenirNextCondensed-Bold", "Bodoni Ornaments", "Zapfino"]
    static var fontSizes = Array(1...30)
    static var fontSize = 14
}
