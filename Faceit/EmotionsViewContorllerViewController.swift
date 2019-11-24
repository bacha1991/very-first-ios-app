//
//  EmotionsViewContorllerViewController.swift
//  Faceit
//
//  Created by Maksym Bachynskyi on 24.11.2019.
//  Copyright © 2019 Maksym Bachynskyi. All rights reserved.
//

import UIKit

class EmotionsViewContorllerViewController: UIViewController {
 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destiantionViewController = segue.destination
        if let navigationController = destiantionViewController as? UINavigationController {
            destiantionViewController = navigationController.visibleViewController ?? destiantionViewController
        }
        if let faceViewController = destiantionViewController as? FaceViewController,
            let id = segue.identifier,
            let expression = emotionalDoctionary[id] {
            faceViewController.expression = expression
            faceViewController.navigationItem.title = (sender as? UIButton)?.currentTitle
        }
    }
    
    private let emotionalDoctionary: Dictionary<String, FacialExpression> = [
        "sad": FacialExpression(eyes: .closed, mouth: .frown),
        "happy": FacialExpression(eyes: .open, mouth: .smile),
    ]
}
