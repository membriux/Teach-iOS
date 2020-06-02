//
//  Movies.swift
//  Flix
//
//  Created by Memo on 10/13/18.
//  Copyright © 2018 Membriux. All rights reserved.
//

import Foundation


struct MoviesHelper {
    
    static var pageNumber: Int = 1

    static func getMovies(completion: @escaping ([Movie]?) -> Void) {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US&page=\(pageNumber)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movieDictionary = dataDictionary["results"] as! [[String: Any]]
                var movies: [Movie] = []
                for dictionary in movieDictionary {
                    let movie = Movie.init(dictionary: dictionary)
                    movies.append(movie)
                }
                
                
                return completion(movies)
            }
        }
        task.resume()
    }
    
    static func getPopular(completion: @escaping ([Movie]?) -> Void) {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US&page=\(pageNumber)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movieDictionary = dataDictionary["results"] as! [[String: Any]]
                var movies: [Movie] = []
                for dictionary in movieDictionary {
                    let movie = Movie.init(dictionary: dictionary)
                    movies.append(movie)
                }
                
                
                return completion(movies)
            }
        }
        task.resume()
    }
    
    
    static func getImageURL(of movie: [String: Any]) -> URL? {
        
        guard let imagePath = movie["poster_path"] as? String else {
            return nil
        }
            let baseURL = "http://image.tmdb.org/t/p/w500"
            let imageURL = URL(string: baseURL + imagePath)!
            return imageURL
    }
    
    
}
