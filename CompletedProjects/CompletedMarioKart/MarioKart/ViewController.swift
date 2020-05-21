//
//  ViewController.swift
//  MarioKart
//
//  Created by Memo on 3/4/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var kartView0: UIImageView!
    @IBOutlet weak var kartView1: UIImageView!
    @IBOutlet weak var kartView2: UIImageView!
    
    // Variable to store initial position of karts
    var startingPointKartView0 = CGPoint()
    var startingPointKartView1 = CGPoint()
    var startingPointKartView2 = CGPoint()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Store initial position of karts to the center of where they started
        startingPointKartView0 = kartView0.center
        startingPointKartView1 = kartView1.center
        startingPointKartView2 = kartView2.center
    
    }

    // Move karts
    @IBAction func didPanKartView(_ sender: UIPanGestureRecognizer) {
        // Location of where the Pan is touching
        let location = sender.location(in: view)
        // Access kart that is touched
        let kartView = sender.view!
        // Change location of kartview
        kartView.center = location
    }
    
    // Resize karts
    @IBAction func didPinchKartView(_ sender: UIPinchGestureRecognizer) {
        // Access the scale property using the pinch
        let scale = sender.scale
        // Access the kartView
        let kartView = sender.view!
        // Change size of kartView
        kartView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    // Rotate karts
    @IBAction func didRotateKartView(_ sender: UIRotationGestureRecognizer) {
        // Access rotation property
        let rotation = sender.rotation
        // Access kartView
        let kartView = sender.view!
        // Rotate kartView
        kartView.transform = CGAffineTransform(rotationAngle: rotation)
    }
    
    
    // Make karts race
    @IBAction func didTapKartView(_ sender: UITapGestureRecognizer) {
        let kartView = sender.view!
        UIView.animate(withDuration: 0.8) {
            kartView.center.x += 400
        }
    }
    
    // Reset position of Karts
    @IBAction func didLongPress(_ sender: UILongPressGestureRecognizer) {
        
        UIView.animate(withDuration: 0.8) {
            self.kartView0.center = self.startingPointKartView0
            self.kartView1.center = self.startingPointKartView1
            self.kartView2.center = self.startingPointKartView2
            
            self.kartView0.transform = CGAffineTransform.identity
            self.kartView1.transform = CGAffineTransform.identity
            self.kartView2.transform = CGAffineTransform.identity
        }
    }
    

}

