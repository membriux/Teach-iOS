//
//  CityDetailsViewController.swift
//  TableView Section Headers
//
//  Created by Memo on 1/27/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

import UIKit
import WebKit

class CityDetailsViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var city: String!
    var state: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.startAnimating()
        
        city = city!.replacingOccurrences(of: " ", with: "+")
        state = state!.replacingOccurrences(of: " ", with: "+")
        let search = city + "+" + state
        
        let webView = WKWebView(frame: CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.view.addSubview(webView)
        let url = URL(string: "https://www.google.com/maps/place/\(search)")

        print(url!)
        
        webView.load(URLRequest(url: url!))
        
        activityIndicator.stopAnimating()
    }
    


}
