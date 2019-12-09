//
//  ViewController.swift
//  alerts
//
//  Created by Maksym Bachynskyi on 02.12.2019.
//  Copyright © 2019 Maksym Bachynskyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func runAler(_ sender: UIButton) {
        presentAler()
    }
    
    private func presentAler() {
        let alert = UIAlertController(
            title: "Hello",
            message: "Message",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: "Ok",
            style: .default
        ))
        
        present(alert, animated: true)
    }

}

