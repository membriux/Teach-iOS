//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // –––––– TODO: Initialize restaurantsArray
    var restaurantsArray: [Restaurant] = []
    
    
    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell)
    // ––––– TODO: Next, place TableView outlet here
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // ––––– TODO: Add tableView initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        getData()
    }
    
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
    func getData() {
        API.getFoodData() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            self.restaurantsArray = restaurants
            self.tableView.reloadData()
        }
    }

}

// ––––– TableView Functionality –––––
extension ViewController {
    
    
    // How many cells there will be
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
        
    }
    
    // What type of cell it is
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create Restaurant Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        // Get individual restaurant
        let r: Restaurant = restaurantsArray[indexPath.row]
        
        // Paste data to cell labels
        cell.nameLabel.text = r.name
        cell.categoryLabel.text = r.mainCategory
        cell.ratingLabel.text = "Rating: " + String(r.rating)
        cell.reviewsLabel.text = "Reviews: " + String(r.reviews)
        
        cell.restaurantImage.af.setImage(withURL: r.imageURL!)
        cell.restaurantImage.layer.cornerRadius = 10
        cell.restaurantImage.clipsToBounds = true
        
        return cell
    }

}

