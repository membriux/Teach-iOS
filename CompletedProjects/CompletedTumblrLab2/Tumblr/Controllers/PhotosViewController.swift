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

class PhotosViewController: UIViewController  {
    
    
    @IBOutlet weak var tableView: UITableView!

    var posts: [[String: Any]] = []
    
    var selectedImage: UIImage!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getPosts()
        
    }
    
    // Get posts from Tumblr API
    func getPosts() {
        API.getPosts() { (posts) in
            if let posts = posts {
                self.posts = posts
                self.tableView.reloadData()
            }
        }
    }

    
    // Pass image to detail viewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Let know which viewcontroller we're passing data to
        let photoDetailsVC = segue.destination as! PhotoDetailsViewController

        // Get cell that was tapped
        let cell = sender as! PhotosTableViewCell
        
        // Get image from cell
        let image = cell.photoImageView.image
        
        // Pass image from selected cell to desired VC
        photoDetailsVC.image = image
    }
    
    
}

extension PhotosViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Basic TableViewFunctionality: Num of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Basic TableViewFunctionality: Cell for row at
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell") as! PhotosTableViewCell
        let post = posts[indexPath.section]

        let url = API.getImageURL(post: post)
        cell.photoImageView.af_setImage(withURL: url)
        
        return cell
    }
    
    // Modify what happens to selected cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }
    
    
    // Height for Section Headers
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    // HeaderView for each cell
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        headerView.backgroundColor = UIColor(white: 1, alpha: 0.9)
        
        // Profile picture
        let profileView = UIImageView(frame: CGRect(x: 10, y: 16, width: 30, height: 30))
        profileView.clipsToBounds = true
        profileView.layer.cornerRadius = 15;
        profileView.layer.borderColor = UIColor(white: 0.7, alpha: 0.8).cgColor
        profileView.layer.borderWidth = 1;
        
        // Set the avatar
        profileView.af_setImage(withURL: URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/avatar")!)
        headerView.addSubview(profileView)
        
        // Add a UILabel for the date here
        // Use the section number to get the right URL
        
        let label = UILabel(frame: CGRect(x: 55, y: 24, width: 200, height: 21))
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont(name: "Avenir-Light", size: 17.0)
        let post = posts[section]
        let timeStamp = post["timestamp"] as! Double
        
        label.text = DateUtil.formatPostTime(to: "MMM d, yyyy, h:mm a", from: timeStamp)
        headerView.addSubview(label)
        
        return headerView
        
    }
    
  
    
    
}

