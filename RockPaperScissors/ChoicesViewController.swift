//
//  ChoicesViewController.swift
//  RockPaperScissors
//
//  Created by Kynan Song on 23/04/2018.
//  Copyright © 2018 Kynan Song. All rights reserved.
//

import UIKit

class ChoicesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Programmatic button selection
    
    @IBAction func rockButton(_ sender: UIButton) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        controller.userChoice = getUserChoice(sender)
        //sender can't be any, needs to be a UIButton here.
        print(getUserChoice(sender))
        
        present(controller, animated: true, completion: nil)
    }
    
    //Code and segue
    
    @IBAction func paperButton(_ sender: UIButton) {
        performSegue(withIdentifier: "playGame", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "playGame" {
            let controller = segue.destination as! ResultsViewController
            
            controller.userChoice = getUserChoice(sender as! UIButton)
        }

    }

    
    func getUserChoice(_ sender: UIButton) -> Weapon {
        let weapon = sender.title(for: UIControlState())!
        return Weapon(rawValue: weapon)! //gets the string of the enum
    }
    
    
    
    
    
}

