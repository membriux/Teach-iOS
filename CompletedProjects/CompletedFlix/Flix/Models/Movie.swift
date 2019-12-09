//
//  Movie.swift
//  Flix
//
//  Created by Memo on 12/15/18.
//  Copyright © 2018 Membriux. All rights reserved.
//

import Foundation




class Movie {
    
    var title: String
    var posterUrl: URL?
    var posterPath: String
    var backdropPath: String
    var backdropUrl: URL?
    var overview: String
    var releaseDate: String
    let baseURL = "http://image.tmdb.org/t/p/w500"
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        posterPath = dictionary["poster_path"] as? String ?? "No poster path"
        posterUrl = URL(string: baseURL + posterPath) ?? nil
        backdropPath = dictionary["backdrop_path"] as? String ?? "No backdrop path"
        backdropUrl = URL(string: baseURL + backdropPath) ?? nil
        overview = dictionary["overview"] as? String ?? "No overview"
        releaseDate = dictionary["release_date"] as? String ?? "No release date"
    }
    
    
    
    
}
