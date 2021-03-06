//
//  DetailsViewController.swift
//  flix
//
//  Created by Memo on 5/8/21.
//


import UIKit
import AlamofireImage


//enum MovieKeys {
//    static let title = "title"
//    static let releaseDate = "release_date"
//    static let overview = "overview"
//    static let backdropPath = "backdrop_path"
//    static let posterPath = "poster_path"
//}


class DetailViewController: UIViewController {

    
    @IBOutlet weak var backDropImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setMovieDetails()
        
    }
    
    
    func setMovieDetails() {
        titleLabel.text = movie.title
        releaseDateLabel.text = movie?.releaseDate
        overviewLabel.text = movie.overview
        let baseURL = "https://image.tmdb.org/t/p/w500"
        
        setBackdropImage(movie: movie, baseURL: baseURL)
        setPosterImage(movie: movie, baseURL: baseURL)
        self.navigationItem.title = movie.title
    }
    
    
    func setBackdropImage(movie: Movie, baseURL: String) {
        if movie.backdropUrl != nil {
            backDropImage.af.setImage(withURL: movie.backdropUrl!)
        }
    }
    
    
    func setPosterImage(movie: Movie, baseURL: String) {
        if movie.posterUrl != nil {
            posterImage.af.setImage(withURL: movie.posterUrl!)
            posterImage.layer.masksToBounds = true
            posterImage.layer.borderWidth = 2
            posterImage.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    
    


}
