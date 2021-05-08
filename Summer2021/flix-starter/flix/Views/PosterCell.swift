//
//  PosterCell.swift
//  flix
//
//  Created by Memo on 5/8/21.
//

import UIKit
import AlamofireImage

class PosterCell: UICollectionViewCell {
    
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie! {
        didSet {
            if movie.posterUrl != nil {
                posterImageView.af.setImage(withURL: movie.posterUrl!)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}

