//
//  YelpStars.swift
//  Yelpy
//
//  Created by Memo on 5/27/20.
//  Copyright © 2020 memo. All rights reserved.
//

import Foundation
import UIKit

// To call image
struct Stars {
    
    static let dict = [
        0: Stars.zero,
        1: Stars.one,
        1.5: Stars.oneHalf,
        2: Stars.two,
        2.5: Stars.twoHalf,
        3: Stars.three,
        3.5: Stars.threeHalf,
        4: Stars.four,
        4.5: Stars.fourHalf,
        5: Stars.five
    ]
    
    
    static var zero = UIImage(named: "regular_0")
    static var one = UIImage(named: "regular_1")
    static var oneHalf = UIImage(named: "regular_1_half")
    static var two = UIImage(named: "regular_2")
    static var twoHalf = UIImage(named: "regular_2_half")
    static var three = UIImage(named: "regular_3")
    static var threeHalf = UIImage(named: "regular_3_half")
    static var four = UIImage(named: "regular_4")
    static var fourHalf = UIImage(named: "regular_4_half")
    static var five = UIImage(named: "regular_5")
    
        
}
