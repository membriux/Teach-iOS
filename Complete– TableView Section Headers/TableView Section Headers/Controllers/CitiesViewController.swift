//
//  ViewController.swift
//  TableView Section Headers
//
//  Created by Memo on 1/11/19.
//  Copyright © 2019 Membriux. All rights reserved.
//


import UIKit

class CitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {

    
    // –––––    TODO: Connect TableView outlet
    @IBOutlet weak var tableView: UITableView!
    
    
    let data = [("Arizona", ["Phoenix"]),
                ("California", ["Los Angeles", "San Francisco", "San Jose", "San Diego"]),
                ("Florida", ["Miami", "Jacksonville"]),
                ("Illinois", ["Chicago"]),
                ("New York", ["Buffalo", "New York"]),
                ("Pennsylvania", ["Pittsburg", "Philadelphia"]),
                ("Texas", ["Houston", "San Antonio", "Dallas", "Austin", "Fort Worth"])]

    
    // Filtered array for UISearchBar
    var filteredData: [(String, [String])]!, searchController: UISearchController!
    
    // Add Header Identifier
    let HeaderViewIdentifier = "TableViewHeaderView"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredData = data
        setupSearchController()
        
        // –––––    TODO: Assign tableView.datasource to VC    –––––
        tableView.dataSource = self
        
        // –––––    TODO: Assign tableView.delegate to VC    –––––
        tableView.delegate = self
        
        // –––––    TODO: Refresh tableView    –––––
        tableView.reloadData()
        
        // Register UITableViewHeaderFooterView
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: HeaderViewIdentifier)

        
    }
    
    
    // ––––– SearchBar Functionality –––––
    
    // Create Search Bar
    func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        // If we are using this same view controller to present the results
        // dimming it out wouldn't make sense. Should probably only set
        // this to yes if using another controller to display the search results.
        searchController.dimsBackgroundDuringPresentation = false
        
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        
        // Sets this view controller as presenting view controller for the search interface
        definesPresentationContext = true

    }
    
    // Update tableview as the user types
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        filteredData = data.filter({ (data: (String, [String])) -> Bool in
            let state = data.0
            return state.localizedCaseInsensitiveContains(text)
            
        })
        if filteredData.count == 0 {
            filteredData = data
        }
        tableView.reloadData()
    }
    

    // –––––    TODO: Add Table View Functions    –––––
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredData.count
    }
    
    // Number of Sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData[section].1.count
    }
    
    // CellforRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
        let citiesInSection = filteredData[indexPath.section].1
        cell.cityLabel.text = citiesInSection[indexPath.row]
        return cell
    }
    
    // Height for section headers
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    // Content of each section header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderViewIdentifier)
        headerView!.textLabel!.text = filteredData[section].0
        
        
        // ––––– The longer way –––––
        
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
//        headerView.backgroundColor = UIColor(white: 0.95, alpha: 0.9)
//
//        // Profile picture
//        let profileView = UIImageView(frame: CGRect(x: 10, y: 16, width: 30, height: 30))
//        profileView.clipsToBounds = true
//        profileView.layer.cornerRadius = 15;
//        profileView.layer.borderColor = UIColor(white: 0.7, alpha: 0.8).cgColor
//        profileView.layer.borderWidth = 1;
//
//        // Set the avatar
//        headerView.addSubview(profileView)
//
//        // Add a UILabel for the date here
//        // Use the section number to get the right URL
//        let label = UILabel(frame: CGRect(x: 55, y: 20, width: 200, height: 30))
//        label.textAlignment = NSTextAlignment.left
//        label.font = UIFont(name: "Avenir", size: 17.0)
//        label.text = data[section].0
//        headerView.addSubview(label)
    
        return headerView
    }
    
  

}

