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
        
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Initiliazers
    var restaurantsArray: [Restaurant] = []
    
    
    // ––––– TODO: Create Search Bar
    let searchController = UISearchController(searchResultsController: nil)
    
    
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
        
    }
    
    
    // ––––– TODO: Configure cell to use [Movie] array instead of [[String:Any]]
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create Restaurant Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        // Set cell's restaurant
        cell.r = restaurantsArray[indexPath.row]
        return cell
    }

}

