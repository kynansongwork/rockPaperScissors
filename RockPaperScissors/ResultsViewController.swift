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
    
    static func computerChoice() -> Weapon {
        //has to be within the enum to be called by it.
        let weapons = ["Rock", "Paper", "Scissors"]
        //Putting enum values into an array
        let pick = Int(arc4random_uniform(3))
        //pick is a random int ranging from 0 to 3. Needs to be converted to an int.
        return Weapon(rawValue: weapons[pick])!
        //returns enum value based on item from weapons array.
    }
}

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var playerMove: UIImageView!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var opponentMove: UIImageView!
    
    var userChoice: Weapon!
    var computerMove: Weapon = Weapon.computerChoice()
    //Has to be cast to call the function.
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        displayPlayerResult()
        gameResult()
        print("computer: \(computerMove)")
    }
    
    @IBAction func goBack() {
        dismiss(animated: true, completion: nil)
    }
    
//    func displayPlayerResult() {
//        if userChoice == .Rock {
//            playerMove.image = UIImage(named: "Rock")
//        } else if userChoice == .Scissors {
//            playerMove.image = UIImage(named: "Scissors")
//        } else if userChoice == .Paper {
//            playerMove.image = UIImage(named: "Paper")
//        }
//    }
    
//    func gameResult() {
//        if (userChoice == computerMove) {
//            result.text = "draw"
//        } else if (userChoice == .Rock && computerMove != .Paper) {
//            result.text = "Rock beats \(computerMove)"
//        } else if (userChoice == .Paper && computerMove != .Scissors) {
//            result.text = "Paper beats \(computerMove)"
//        } else if (userChoice == .Scissors && computerMove != .Rock) {
//            result.text = "Scissors beats \(computerMove)"
//        } else {
//            result.text = "You lose to \(computerMove)"
//        }
//        
//    }
    
    //writing it as a switch case, based on solution.
    
    func gameResult() {
        switch (userChoice!, computerMove) {
        case let (user, computer) where user == computer:
            result.text = "It is a draw"
            playerMove.image = UIImage(named: userChoice.rawValue)
            opponentMove.image = UIImage(named: computerMove.rawValue)
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper): //Laying out all the different win cases.
            result.text = "Well done, \(userChoice.rawValue) beats \(computerMove.rawValue)."
            playerMove.image = UIImage(named: userChoice.rawValue)
            opponentMove.image = UIImage(named: computerMove.rawValue)
        default:
            result.text = "You lose, \(computerMove.rawValue) beats \(userChoice.rawValue)."
            playerMove.image = UIImage(named: userChoice.rawValue)
            opponentMove.image = UIImage(named: computerMove.rawValue)
        }
        
        
    }
    


    
}
