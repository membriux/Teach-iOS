//
//  SuperherViewController.swift
//  Flix
//
//  Created by Memo on 11/15/18.
//  Copyright © 2018 Membriux. All rights reserved.
//

import UIKit

class SuperheroViewController: UIViewController, UISearchBarDelegate {

    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var movies: [Movie] = []
    var filteredMovies: [Movie] = []
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        searchBar.delegate = self
        
        setLayout()
        getMovies()
        setupRefreshControl()
        
        
    }
    
    func setLayout() {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        
        let cellsPerLine: CGFloat = 2
        let interItemSpacingTotal = layout.minimumInteritemSpacing * (cellsPerLine - 1)
        let width = collectionView.frame.size.width / cellsPerLine - interItemSpacingTotal / cellsPerLine
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
    }
    
    func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControl.Event.valueChanged)
        collectionView.insertSubview(refreshControl, at: 0)
    }
    
    func getMovies() {
        MoviesHelper.getMovies() { (movies) in
            guard let movies = movies else {
                return
            }
            self.movies = movies
            self.filteredMovies = self.movies
            self.collectionView.reloadData()
            
        }
    }
    
    
    // Search bar functionality
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredMovies = searchText.isEmpty ? movies : movies.filter { (movie: Movie) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return movie.title.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        collectionView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = false
        self.searchBar.text = ""
        self.searchBar.resignFirstResponder()
        filteredMovies = movies
        collectionView.reloadData()
    }
    


}


extension SuperheroViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        if let indexPath = collectionView.indexPath(for: cell) {
            let movie = filteredMovies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredMovies.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let movie = filteredMovies[indexPath.item]
        
        cell.movie = movie
        
        return cell
    }
    
    @objc func refreshControlAction(_ refreshControl: UIRefreshControl) {
        activityIndicator.startAnimating()
        movies = []
        filteredMovies = []
        collectionView.reloadData()
        
        MoviesHelper.pageNumber += 1
        MoviesHelper.getMovies() { (movies) in
            guard let movies = movies else {
                return
            }
            self.movies = movies
            self.filteredMovies = self.movies
            self.collectionView.reloadData()
            self.refreshControl.endRefreshing()
            self.activityIndicator.stopAnimating()
            
        }
    }
    
    
}

