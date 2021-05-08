//
//  SuperheroViewController.swift
//  flix
//
//  Created by Memo on 5/8/21.
//

import UIKit

class SuperheroViewController: UIViewController {

    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var movies: [Movie] = []
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        
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
            self.collectionView.reloadData()
            
        }
    }


}


extension SuperheroViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        if let indexPath = collectionView.indexPath(for: cell) {
            let movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let movie = movies[indexPath.item]
        
        cell.movie = movie
        
        return cell
    }
    
    @objc func refreshControlAction(_ refreshControl: UIRefreshControl) {
        activityIndicator.startAnimating()
        movies = []
        collectionView.reloadData()
        
        MoviesHelper.pageNumber += 1
        MoviesHelper.getMovies() { (movies) in
            guard let movies = movies else {
                return
            }
            self.movies = movies
            self.collectionView.reloadData()
            self.refreshControl.endRefreshing()
            self.activityIndicator.stopAnimating()
            
        }
    }
    
    
}

