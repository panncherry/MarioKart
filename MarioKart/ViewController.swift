//
//  ViewController.swift
//  MarioKart
//
//  Created by Pann Cherry on 3/17/19.
//  Copyright © 2019 TechBloomer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var kart0ImageView: UIImageView!
    @IBOutlet weak var kart1ImageView: UIImageView!
    @IBOutlet weak var kart2ImageView: UIImageView!
    var startingPointKartView0 = CGPoint()
    var startingPointKartView1 = CGPoint()
    var startingPointKartView2 = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startingPointKartView0 = kart0ImageView.center
        startingPointKartView1 = kart1ImageView.center
        startingPointKartView2 = kart2ImageView.center
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func didPanKartView(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        print("Location: x: \(location.x), y: \(location.y)")
        let kartView = sender.view!
        kartView.center = location
    }
    
    @IBAction func didPinchKartView(_ sender: UIPinchGestureRecognizer) {
        let scale = sender.scale
        print("scale: \(scale)")
        let kartView = sender.view!
        kartView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    
    @IBAction func didRotateKartView(_ sender: UIRotationGestureRecognizer) {
        let rotation = sender.rotation
        print("rotation: \(rotation)")
        let kartView = sender.view!
        kartView.transform = CGAffineTransform(rotationAngle: rotation)
    }
    
    
    @IBAction func didTapKartView(_ sender: UITapGestureRecognizer) {
        print("Double tap recognized")
        let kartView = sender.view!
        kartView.center.x += 50
        UIView.animate(withDuration: 0.8) {
            // Closure body
            kartView.center.x += 50
        }
    }
    
    
    @IBAction func didLongPressBackground(_ sender: UILongPressGestureRecognizer) {
        UIView.animate(withDuration: 0.8) {
            self.kart0ImageView.center = self.startingPointKartView0
            self.kart1ImageView.center = self.startingPointKartView1
            self.kart2ImageView.center = self.startingPointKartView2
            self.kart0ImageView.transform = CGAffineTransform.identity
            self.kart1ImageView.transform = CGAffineTransform.identity
            self.kart2ImageView.transform = CGAffineTransform.identity
        }
        
    }
}

