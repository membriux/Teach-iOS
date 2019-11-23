//
//  PhotosViewController.swift
//  Tumblr
//
//  Created by Memo on 10/4/18.
//  Copyright © 2018 Membriux. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class PhotosViewController: UIViewController {

    
    
    // Create Outlet of tableview and the posts variable
    
    @IBOutlet weak var photoTableView: UITableView!
    
    var posts: [[String: Any]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoTableView.delegate = self
        photoTableView.dataSource = self
        
        
        getPosts()
    }
    
    
    // –––––– TODO: Get posts from APIs.swift
    func getPosts() {
        API.getPosts() { (posts) in
            if let posts = posts {
                self.posts = posts
                self.photoTableView.reloadData()
            }
        }
    }
    
}

extension PhotosViewController: UITableViewDelegate, UITableViewDataSource {
    
    // How many rows (in this case cells) to have on the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    // What content is going to be displayed on the cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell") as! PhotosTableViewCell
        
        let post = posts[indexPath.row]
        // Get url image from API
        let url = API.getImageURL(post: post)
        // Place image onto cell
        cell.photoImage.af_setImage(withURL: url)
        
        return cell
    }
    
    
    
    
    
}

