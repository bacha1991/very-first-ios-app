//
//  ViewController.swift
//  test
//
//  Created by Maksym Bachynskyi on 10.11.2019.
//  Copyright © 2019 Maksym Bachynskyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var isMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if isMiddleOfTyping {
            let textCurrentlyInDisplay = display!.text!
            display!.text = textCurrentlyInDisplay + digit
        } else {
            display!.text = digit
            isMiddleOfTyping = true
        }
    }
    
    var dispalyValue: Double {
        get {
            return Double(display.text!)!
        }
        
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain: CalBrain = CalBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if isMiddleOfTyping {
            brain.setOperand(dispalyValue)
            isMiddleOfTyping = false
        }
        if let mathSymbol = sender.currentTitle {
            brain.performOperation(mathSymbol)
        }
        if let result = brain.result {
           dispalyValue = result
        }
    }
}

