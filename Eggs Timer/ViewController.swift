//
//  ViewController.swift
//  Eggs Timer
//
//  Created by Aleksandra Asichka on 2023-01-25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let eggsTimer = ["Soft": 30, "Medium": 40, "Hard": 70]
    var secondRemaining = 0
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
    }

    @IBAction func boilEgg(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0
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
            progressBar.progress = 1.0 / Float(secondRemaining)
            print(progressBar.progress)
            secondRemaining -= 1
        } else {
            titleLabel.text = "Eggs are Ready!"
        }
    }
}

