//
//  ViewController.swift
//  tumblerLab
//
//  Created by Memo on 1/10/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

// –––––    Comment    –––––

import UIKit

class PhotosViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        getPosts()
        
    }
    
    func getPosts() {
        API.getPosts() { (posts) in
            if let posts = posts {
                self.posts = posts
                self.tableView.reloadData()
            }
        }
    }
    
}


extension PhotosViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    // –––––    TODO: Configure number of rows    –––––
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Code here
        
    }
    
    
    // –––––    TODO: Configure CellForRowAt    –––––
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Code here
        
        
    }

 
}

