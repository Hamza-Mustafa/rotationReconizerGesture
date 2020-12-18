//
//  ViewController.swift
//  rotationReconizerGesture
//
//  Created by Hamza Mustafa on 18/12/2020.
//

import UIKit

class ViewController: UIViewController {

    // Measure the relative rotation of two fingers on the screen, and use that motion to rotate your content.
    
    @IBOutlet var rotationGesture: UIRotationGestureRecognizer!
    @IBOutlet weak var myImage: UIImageView!
    
    var roatation: CGAffineTransform?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.roatation = myImage.transform
    }

    @IBAction func rotationGestureTapped(_ sender: Any) {
        guard let gestureView = rotationGesture.view else {
            return
        }
        gestureView.transform = gestureView.transform.rotated(by: rotationGesture.rotation)
        rotationGesture.rotation = 0
        
        if rotationGesture.state == .began {
            print("rotation begins")
        }
        
        if rotationGesture.state == .changed {
            print("changing")
        }
    
        if rotationGesture.state == .ended {
            print("ended")
            UIView.animate(withDuration: 0.5) {
                self.myImage.transform = self.roatation!
            }
        }
    }
}
