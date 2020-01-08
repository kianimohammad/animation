//
//  ViewController.swift
//  animation
//
//  Created by Mohammad Kiani on 2020-01-07.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    
    // create a timer
    var timer = Timer()
    
    var counter = 0
    var isAnimating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func fadeIn(_ sender: UIButton) {
        imageView.alpha = 0
        UIView.animate(withDuration: 2) {
            self.imageView.alpha = 1
        }
    }
    
    @IBAction func slideIn(_ sender: UIButton) {
        imageView.center = CGPoint(x: imageView.center.x - 500, y: imageView.center.y)
        UIView.animate(withDuration: 2) {
            self.imageView.center = CGPoint(x: self.imageView.center.x + 500, y: self.imageView.center.y)
        }
    }
    @IBAction func grow(_ sender: UIButton) {
        let width = imageView.frame.size.width
        let height = imageView.frame.size.height
        
        let  x = imageView.frame.origin.x
        let y = imageView.frame.origin.y
        
        imageView.frame = CGRect(x: x, y: y, width: 0, height: 0)
        UIView.animate(withDuration: 2) {
            self.imageView.frame = CGRect(x: x, y: y, width: width, height: height)
        }
    }
    @IBAction func play(_ sender: UIButton) {
        /*
        if isAnimating {
            timer.invalidate()
            playBtn.setTitle("Play", for: [])
            isAnimating = false
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(animate), userInfo: nil, repeats: true)
            playBtn.setTitle("Stop", for: [])
            isAnimating = true
        }
         */
        
        // the other way to animate images
        imageView.animationImages = [
            UIImage(named: "frame_0_delay-0.1s.gif")!,
            UIImage(named: "frame_1_delay-0.1s.gif")!,
            UIImage(named: "frame_2_delay-0.1s.gif")!,
            UIImage(named: "frame_3_delay-0.1s.gif")!,
            UIImage(named: "frame_4_delay-0.1s.gif")!,
            UIImage(named: "frame_5_delay-0.1s.gif")!
        ]
        imageView.animationDuration = 1
        // infinite loop
        imageView.animationRepeatCount = 0
        if isAnimating {
            imageView.stopAnimating()
            playBtn.setTitle("Play", for: [])
            isAnimating = false
        } else {
            imageView.startAnimating()
            playBtn.setTitle("Stop", for: [])
            isAnimating = true
        }
        
        
    }
    
    @objc func animate () {
        
        imageView.image = UIImage(named: "frame_\(counter)_delay-0.1s.gif")
        counter += 1
        if counter  == 6 {
            counter = 0
        }
    }
}

