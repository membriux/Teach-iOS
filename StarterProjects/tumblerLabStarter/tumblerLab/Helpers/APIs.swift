//
//  APIs.swift
//  tumblerLab
//
//  Created by Memo on 1/10/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

import Foundation



// –––––    API Call for Tumblr Posts    ––––

struct API {
    
    // Gets the posts json data and returns it converted as a dictionary
    static func getPosts(completion: @escaping ([[String: Any]]?) -> Void) {
        // Network request snippet
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print(dataDictionary)
                
                var posts: [[String: Any]] = []
                
                
                // Get the posts and return them
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                posts = responseDictionary["posts"] as! [[String: Any]]
                
                return completion(posts)
            
            }
        }
        task.resume()}
    
    
}
