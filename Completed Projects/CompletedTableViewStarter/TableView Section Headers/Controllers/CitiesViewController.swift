//
//  ViewController.swift
//  TableView Section Headers
//
//  Created by Memo on 1/11/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // ––––– TODO: Connect TableView outlet
    @IBOutlet weak var tableView: UITableView!
    
    
    let data = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
                "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
                "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
                "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
                "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ––––– TODO: Assign tableView.datasource to VC
        tableView.dataSource = self
        
        // ––––– TODO: Assign tableView.delegate to VC
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        // ––––– TODO: Refresh tableView
        self.tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cityDetailVC = segue.destination as! CityDetailsViewController
        
        let cell = sender as! CityCell
        
        cityDetailVC.city = cell.cityLabel.text
        cityDetailVC.state = cell.stateLabel.text
    }
    

    // –––––  TODO: Add Table View Protocol Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
        let cityState = data[indexPath.row].components(separatedBy: ", ")
        cell.cityLabel.text = cityState.first
        cell.stateLabel.text = cityState.last
        return cell
    }
}

