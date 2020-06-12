//
//  RestaurantDetailViewController.swift
//  Yelpy
//
//  Created by Memo on 6/11/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantDetailViewController: UIViewController {

    @IBOutlet weak var restaurantImage: UIImageView!
    
    var r: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantImage.af.setImage(withURL: r.imageURL!)
    }
    

}
