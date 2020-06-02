//
//  NoteCell.swift
//  Models–SimpleTodo
//
//  Created by Memo on 1/30/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var todoTitle: UILabel!
    @IBOutlet weak var todoDate: UILabel!
    @IBOutlet weak var todoDescription: UILabel!
    
    var note: Note! {
        didSet {
            todoTitle.text = note.todoTitle
            todoDate.text = note.todoDate
            todoDescription.text = note.todoDescription
            
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
