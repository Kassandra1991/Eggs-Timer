//
//  ViewController.swift
//  Eggs Timer
//
//  Created by Aleksandra Asichka on 2023-01-25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func boilEgg(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else {
            return
        }
        switch buttonTitle {
        case "Soft":
            print(Constants.softTime)
        case "Medium":
            print(Constants.mediumTime)
        case "Hard":
            print(Constants.hardTime)
        default:
            break
        }
        print(buttonTitle)
    }
}

