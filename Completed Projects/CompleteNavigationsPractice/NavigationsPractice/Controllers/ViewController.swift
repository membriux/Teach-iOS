//
//  ViewController.swift
//  NavigationsPractice
//
//  Created by Memo on 1/17/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var photo: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailsViewController
        
        detailVC.photoPassed = self.photo.image
        
    }

    @IBAction func showDetail(_ sender: Any) {
        performSegue(withIdentifier: "show", sender: nil)
        
    }
    

}

