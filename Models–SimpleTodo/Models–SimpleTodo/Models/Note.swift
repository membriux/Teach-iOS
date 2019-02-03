//
//  Note.swift
//  Models–SimpleTodo
//
//  Created by Memo on 1/30/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

import Foundation

class Note {
    
    static var allNotes: [Note]!
    
    // TODO: CREATE Note attributes
    // example:
    // var todoTitle: String
    
    var todoTitle: String
    var todoDate: Date
    var todoDescription: String
    
    // TODO: CREATE initializer for Note class
    init(title: String, date: Date, description: String) {
        todoTitle = title
        todoDate = date
        todoDescription = description
    }
    
    
}
