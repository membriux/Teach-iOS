//
//  CityCell.swift
//  TableView Section Headers
//
//  Created by Memo on 1/11/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

// –––––    Comment    –––––

import UIKit

class CityCell: UITableViewCell {

    // –––––  TODO: Connect the cityName Label 
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
