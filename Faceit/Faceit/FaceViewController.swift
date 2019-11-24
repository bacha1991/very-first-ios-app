//
//  ViewController.swift
//  Faceit
//
//  Created by Maksym Bachynskyi on 20.11.2019.
//  Copyright © 2019 Maksym Bachynskyi. All rights reserved.
//

import UIKit

class FaceViewController: VCLLoggingViewController {

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            let handler = #selector(FaceView.changeScale(byReactingTo:))
            let pinchRecognizer = UIPinchGestureRecognizer(target: faceView, action: handler)
            faceView.addGestureRecognizer(pinchRecognizer)
            
            let tapHandler = #selector(toggleEyes(byReactingTo:))
            let tapRecognizer = UITapGestureRecognizer(target: self, action: tapHandler)
            tapRecognizer.numberOfTouchesRequired = 1
            faceView.addGestureRecognizer(tapRecognizer)
            
            let swipeUpRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(incHappines))
            swipeUpRecognizer.direction = .up
            faceView.addGestureRecognizer(swipeUpRecognizer)
            
            let swipeDownRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(decHappines))
            swipeDownRecognizer.direction = .down
            faceView.addGestureRecognizer(swipeDownRecognizer)
            
            updateUI()
        }
    }
    
    var expression = FacialExpression(eyes: .open, mouth: .grin) {
        didSet {
            updateUI()
        }
    }
    
    @objc func incHappines() {
        expression = expression.happier
    }
    
    @objc func decHappines() {
        expression = expression.sadder
    }
    
    @objc func toggleEyes(byReactingTo tapRecognizer: UITapGestureRecognizer) {
        if tapRecognizer.state == .ended {
            let eyes: FacialExpression.Eyes = (expression.eyes == .closed) ? .open : .closed
            expression = FacialExpression(eyes: eyes, mouth: expression.mouth)
        }
    }
    
    private func updateUI() {
        switch expression.eyes {
            case .open:
                faceView?.eyesOpen = true
            case .closed:
                faceView?.eyesOpen = false
            case .squinting:
                faceView?.eyesOpen = false
        }
        faceView?.mouseCurvature = mouthCurvatuers[expression.mouth] ?? 0
    }
    
    private let mouthCurvatuers = [FacialExpression.Mouth.grin: 0.5, .frown: -1.0, .smile: 1]
    
}

