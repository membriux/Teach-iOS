//
//  PhotoDetailsViewController.swift
//  Tumblr
//
//  Created by Memo on 1/17/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    
    @IBOutlet weak var postImage: UIImageView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postImage.image = image
    }
    

}
