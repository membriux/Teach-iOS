//
//  ViewController.swift
//  paypal
//
//  Created by Memo on 5/17/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

import UIKit
import BraintreeDropIn
import Braintree


class ViewController: UIViewController {
    
    
    
    var clientToken: String!
    var btClient: BTAPIClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getClient()
        setupGateway()
    }

    
    func setupGateway() {
        return
    }
    
    func getClient() {
        API.fetchClientToken() { (clientToken) in
            self.clientToken = clientToken
            self.btClient = BTAPIClient(authorization: self.clientToken)
            
            
            self.showDropIn(clientTokenOrTokenizationKey: self.clientToken)
        }
    }

    func showDropIn(clientTokenOrTokenizationKey: String) {
        let request =  BTDropInRequest()
        let dropIn = BTDropInController(authorization: clientTokenOrTokenizationKey, request: request)
        { (controller, result, error) in
            if (error != nil) {
                print("ERROR")
            } else if (result?.isCancelled == true) {
                print("CANCELLED")
            } else if result != nil {
                // Use the BTDropInResult properties to update your UI
                // result.paymentOptionType
                // result.paymentMethod
                // result.paymentIcon
                // result.paymentDescription
            }
            controller.dismiss(animated: true, completion: nil)
        }
        self.present(dropIn!, animated: true, completion: nil)
    }

}

