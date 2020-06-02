//
//  ViewController.swift
//  Flix
//
//  Created by Memo on 10/8/18.
//  Copyright © 2018 Membriux. All rights reserved.
//

import UIKit
import AlamofireImage
import MBProgressHUD

class NowPlayingViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var MovieTableView: UITableView!
    @IBOutlet weak var movieSearchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var movies: [Movie] = []
    var filteredMovies: [Movie] = []
    let refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieTableView.dataSource = self
        movieSearchBar.delegate = self
        
        MovieTableView.rowHeight = UITableView.automaticDimension
        MovieTableView.estimatedRowHeight = 50
        
    
        setupRefreshControl()
        getMovies()

    }
    
    func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControl.Event.valueChanged)
        MovieTableView.insertSubview(refreshControl, at: 0)
    }
    
    func getMovies() {
        // Show loading animation using MBProgressHUD
//        MBProgressHUD.showAdded(to: self.view, animated: true)
        MoviesHelper.getMovies() { (movies) in
            guard let movies = movies else {
                return
            }
            self.movies = movies
            self.filteredMovies = self.movies
            self.MovieTableView.reloadData()
//            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    // Search bar functionality
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredMovies = searchText.isEmpty ? movies : movies.filter { (movie: Movie) -> Bool in
            // If dataItem matches the searchText, return true to include it
            let title = movie.title
            return title.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        MovieTableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.movieSearchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        movieSearchBar.showsCancelButton = false
        movieSearchBar.text = ""
        movieSearchBar.resignFirstResponder()
        filteredMovies = movies
        MovieTableView.reloadData()
    }
    
 
}

extension NowPlayingViewController: UITableViewDelegate, UITableViewDataSource {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = MovieTableView.indexPath(for: cell) {
            let movie = filteredMovies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie

        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MovieTableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        let movie = filteredMovies[indexPath.row]
        
        cell.movie = movie
        
        return cell
    }
    
    
    @objc func refreshControlAction(_ refreshControl: UIRefreshControl) {
//        activityIndicator.startAnimating()
        movies = []
        filteredMovies = []
        MovieTableView.separatorStyle = .none
        MovieTableView.reloadData()
        
        MoviesHelper.pageNumber += 1
        
        
        MoviesHelper.getMovies() { (movies) in
            guard let movies = movies else {
               return
            }
            self.movies = movies
            self.filteredMovies = self.movies
            self.MovieTableView.reloadData()
            self.refreshControl.endRefreshing()
            self.activityIndicator.stopAnimating()
            self.MovieTableView.separatorStyle = .singleLine
        }
    }
    
    
}


