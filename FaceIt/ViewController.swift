//
//  ViewController.swift
//  FaceIt
//
//  Created by siddharth bhalla on 8/23/17.
//  Copyright © 2017 sb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var faceView: FaceView! {
        didSet {
            updateUI()
        }
    }
    
    var expression = FacialExpression(eyes: .open, mouth: .grin) {
        didSet {
            updateUI()
        }
    }
    
   	private func updateUI() {
        if faceView != nil {
            switch expression.eyes {
            case .open: faceView.eyesOpen = true
            case .closed: faceView.eyesOpen = false
            case .squinting: faceView.eyesOpen = false
            }
            faceView.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
        }
    }
    
    let mouthCurvatures =
        [FacialExpression.Mouth
         .grin:0.5,
         .frown:-1.0,
         .smile:1.0,
         .neutral:0.0,
         .smirk:-0.5
        ]
    
}
