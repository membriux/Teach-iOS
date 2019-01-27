//
//  DetailsViewController.swift
//  NavigationsPractice
//
//  Created by Memo on 1/22/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    
    
    var photoPassed: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photo.image = photoPassed
        
        
    }
    


}
