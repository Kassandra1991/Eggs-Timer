//
//  ViewController.swift
//  Eggs Timer
//
//  Created by Aleksandra Asichka on 2023-01-25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let eggsTimer = ["Soft": 300, "Medium": 420, "Hard": 720]
    var player: AVAudioPlayer!
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func boilEgg(_ sender: UIButton) {
        
        timer.invalidate()
        secondsPassed = 0
        titleLabel.text = "How do you like your eggs?"
        progressBar.progress = 0
        guard let hardness = sender.titleLabel?.text else {
            return
        }
        guard let eggTimer = eggsTimer[hardness] else {
            return
        }
        totalTime = eggTimer
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(progressBar.progress)
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        guard let url = url else {
            return
        }
        player = try! AVAudioPlayer(contentsOf: url)
        player.play()
    }
}

