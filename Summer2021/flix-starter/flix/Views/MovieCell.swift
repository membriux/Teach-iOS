//
//  MovieCell.swift
//  flix
//
//  Created by Memo on 5/8/21.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    var movie: Movie! {
        didSet {
            if movie.posterUrl != nil {
                movieImage.af.setImage(withURL: movie.posterUrl!)
            }
            movieTitle.text = movie.title
            movieOverview.text = movie.overview
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
