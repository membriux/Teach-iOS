//
//  ViewController.swift
//  Models–SimpleTodo
//
//  Created by Memo on 1/30/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

import UIKit

class AllNotesViewController: UIViewController {
    
    @IBOutlet weak var notesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add protocol functionality of tableView to view controller
        notesTableView.delegate = self
        notesTableView.dataSource = self
        
        // Add dynamic cell height for each cell 
        notesTableView.rowHeight = UITableView.automaticDimension
        notesTableView.estimatedRowHeight = 50
        

        notesTableView.reloadData()
    }
    
    
    @IBAction func addNote(_ sender: Any) {
        performSegue(withIdentifier: "CreateNote", sender: self)
    }
    
    @IBAction func refresh(_ sender: Any) {
        print(Note.allNotes)
        notesTableView.reloadData()
    }
    
}

extension AllNotesViewController: UITableViewDataSource, UITableViewDelegate {
    
    // TODO: CONFIGURE tableView functionality
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Code here
        return Note.allNotes.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Code
        let cell = notesTableView.dequeueReusableCell(withIdentifier: "NoteCell") as! NoteCell
        let note = Note.allNotes[indexPath.row]
        cell.note = note
        return cell
        
    }
    
    
    
    
}

