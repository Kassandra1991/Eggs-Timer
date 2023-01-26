//
//  ViewController.swift
//  Eggs Timer
//
//  Created by Aleksandra Asichka on 2023-01-25.
//

import UIKit

class ViewController: UIViewController {

    let eggsTimer = ["Soft": 300, "Medium": 420, "Hard": 720]

    var secondRemaining = 60

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func boilEgg(_ sender: UIButton) {
        guard let hardness = sender.titleLabel?.text else {
            return
        }
        guard let eggTimer = eggsTimer[hardness] else {
            return
        }
        secondRemaining = eggTimer
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        if secondRemaining > 0 {
            print("\(secondRemaining) seconds")
            secondRemaining -= 1
        }
    }
}

