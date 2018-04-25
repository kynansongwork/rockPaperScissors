//
//  ResultsViewController.swift
//  RockPaperScissors
//
//  Created by Kynan Song on 23/04/2018.
//  Copyright © 2018 Kynan Song. All rights reserved.
//

import UIKit

enum Weapon: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
}

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var playerMove: UIImageView!
    
    var userChoice: Weapon!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayPlayerResult()
    }
    
    @IBAction func goBack() {
        dismiss(animated: true, completion: nil)
    }
    
    func displayPlayerResult() {
        if userChoice == .Rock {
            playerMove.image = UIImage(named: "rock")
        } else if userChoice == .Scissors {
            playerMove.image = UIImage(named: "scissors")
        } else if userChoice == .Paper {
            playerMove.image = UIImage(named: "paper")
        }
        
    }
    
}
