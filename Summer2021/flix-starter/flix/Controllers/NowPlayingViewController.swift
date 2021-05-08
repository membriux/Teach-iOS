//
//  ViewController.swift
//  flix
//
//  Created by Memo on 5/8/21.
//

import UIKit
import AlamofireImage
import MBProgressHUD

class NowPlayingViewController: UIViewController {

    @IBOutlet weak var MovieTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var movies: [Movie] = []
    let refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieTableView.dataSource = self
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
        MoviesHelper.getMovies() { (movies) in
            guard let movies = movies else {
                return
            }
            self.movies = movies
            self.MovieTableView.reloadData()
        }
    }

    
 
}

extension NowPlayingViewController: UITableViewDelegate, UITableViewDataSource {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = MovieTableView.indexPath(for: cell) {
            let movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie

        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MovieTableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        let movie = movies[indexPath.row]
        
        cell.movie = movie
        
        return cell
    }
    
    
    @objc func refreshControlAction(_ refreshControl: UIRefreshControl) {
//        activityIndicator.startAnimating()
        movies = []
        MovieTableView.separatorStyle = .none
        MovieTableView.reloadData()
        
        MoviesHelper.pageNumber += 1
        
        
        MoviesHelper.getMovies() { (movies) in
            guard let movies = movies else {
               return
            }
            self.movies = movies
            self.MovieTableView.reloadData()
            self.refreshControl.endRefreshing()
            self.activityIndicator.stopAnimating()
            self.MovieTableView.separatorStyle = .singleLine
        }
    }
    
    
}



