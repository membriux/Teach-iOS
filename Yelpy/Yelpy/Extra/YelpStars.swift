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
    
    static var zero = UIImage(named: "regular_0")
    
    static var two = UIImage(named: "regular_2")
    static var twoHalf = UIImage(named: "regular_2_half")
    static var three = UIImage(named: "regular_3")
    static var threeHalf = UIImage(named: "regular_3_half")
    static var four = UIImage(named: "regular_4")
    static var fourHalf = UIImage(named: "regular_4_half")
    static var five = UIImage(named: "regular_5")
    
    
    static func setImageFor(stars: Double) -> UIImage {
        switch stars {
        case 2.0:
            return Stars.two!
        case 2.5:
            return Stars.twoHalf!
        case 3.0:
            return Stars.three!
        case 3.5:
            return Stars.threeHalf!
        case 4.0:
            return Stars.four!
        case 4.5:
            return Stars.fourHalf!
        case 5.0:
            return Stars.five!
        
        default:
            return Stars.zero!
        }
    }
    
}
