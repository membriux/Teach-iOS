//
//  PosterCell.swift
//  Flix
//
//  Created by Memo on 11/15/18.
//  Copyright © 2018 Membriux. All rights reserved.
//

import UIKit
import AlamofireImage

class PosterCell: UICollectionViewCell {
    
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie! {
        didSet {
            if movie.posterUrl != nil {
                posterImageView.af_setImage(withURL: movie.posterUrl!)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
