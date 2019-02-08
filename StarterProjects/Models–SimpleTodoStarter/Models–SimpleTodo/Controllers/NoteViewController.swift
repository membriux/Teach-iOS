//
//  NoteViewController.swift
//  Models–SimpleTodo
//
//  Created by Memo on 1/30/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    
    @IBOutlet weak var noteTitle: UITextField!
    @IBOutlet weak var noteDate: UITextField!
    @IBOutlet weak var noteDescription: UITextView!
    
    // Alert controller to display errors in case input fields are empty
    let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
    let dismissAction = UIAlertAction(title: "Dismiss", style: .default)
    
    var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDatePickers()
        
    }
    
    
    
    // ––––– TODO: Add functionality to add note and go back to AllNotesViewController
    @IBAction func addNote(_ sender: Any) {
        if inputsNotEmpty() {
         // –– Your code here ––
            
            
            
            
            
            resetFields()
        }
    }
    

    
    func inputsNotEmpty() -> Bool {
        alertController.addAction(dismissAction)
        if noteTitle.text == "" {
            showInvalid(field: "Title Error")
            return false
        } else if noteDate.text == ""  {
            showInvalid(field: "Date Error")
            return false
        } else if noteDescription.text == "" {
            showInvalid(field: "Description Error")
            return false
        } else { return true }
        
    }
    
    
    func showInvalid(field: String) {
        alertController.title = "\(field)"
        alertController.message =  "This field cannot be empty."
        present(alertController, animated: true)
    }
    
    
    func resetFields() {
        noteTitle.text = ""
        noteDate.text = ""
        noteDescription.text = ""
    }
    
    
    
    // ––––– DatePicker Helper Setup ––––––
    
    func configureDatePickers() {
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(NoteViewController.dateChanged(datePicker:)), for: .valueChanged)
        noteDate.inputView = datePicker
    }
    
    // Changes the text while the date is being picked
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.noteDate
        noteDate.text = dateFormatter.string(from: datePicker.date)
    }

    
    
    
}
