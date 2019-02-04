//
//  Note.swift
//  Models–SimpleTodo
//
//  Created by Memo on 1/30/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

import Foundation

class Note {
    
    // Using a variable
    static var allNotes = [Note]()
    
    // TODO: CREATE Note attributes
    // example: 
    // var todoTitle: String
    
    var todoTitle: String
    var todoDate: String
    var todoDescription: String
    
    // TODO: CREATE initializer for Note class
    init(title: String, date: String, description: String) {
        todoTitle = title
        todoDate = date
        todoDescription = description
    }
    
}
