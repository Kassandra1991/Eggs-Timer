//
//  ViewController.swift
//  Eggs Timer
//
//  Created by Aleksandra Asichka on 2023-01-25.
//

import UIKit

class ViewController: UIViewController {

    let eggsTimer = ["Soft": 5, "Medium": 7, "Hard": 12]

    @IBAction func boilEgg(_ sender: UIButton) {
        guard let hardness = sender.titleLabel?.text else {
            return
        }
        if let eggsTimer = eggsTimer[hardness] {
            print(eggsTimer)
        }
    }
}

