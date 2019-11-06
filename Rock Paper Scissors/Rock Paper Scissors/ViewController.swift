//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by Anshul Singh on 11/5/19.
//  Copyright © 2019 Anchovies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var cpuImage: UIImageView!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    var lastUserChoice = String()
    var doubleLastUserChoice = String()
    
    var winner = String()
    
    func cpuChoiceDecider(lastUserChoice:String, doubleLastUserChoice:String) -> String {
        var result = String()
        if lastUserChoice == doubleLastUserChoice {
            if lastUserChoice == "rock" {
                result = "paper"
            }
            else if lastUserChoice == "paper" {
                result = "scissors"
            }
            else if lastUserChoice == "scissors" {
                result = "rock"
            }
        }
            
        else {
            var randomNumber = arc4random_uniform(2)
            if randomNumber == 0 {
                result = "rock"
            }
            else if randomNumber == 1 {
                result = "paper"
            }
            else {
                result = "scissors"
            }
        }
        
        if result == "rock" {
            cpuImage.image = UIImage (named: "rock")
        }
        else if result == "paper" {
            cpuImage.image = UIImage (named: "paper")
        }
        else if result == "scissors" {
            cpuImage.image = UIImage (named: "scissors")
        }
        return result
    }
    
    func whoWon (userChoice:String, cpuChoice:String) -> String {
        var result = String()
        if userChoice == "rock" {
            if cpuChoice == "rock" {
                result = "Tie"
            }
            else if cpuChoice == "paper" {
                result = "CPU Wins"
            }
            else {
                result = "Player Wins"
            }
        }
        else if userChoice == "paper" {
            if cpuChoice == "rock" {
                result = "Player Wins"
            }
            else if cpuChoice == "paper" {
                result = "Tie"
            }
            else {
                result = "CPU Wins"
            }
        }
        else if userChoice == "scissors" {
            if cpuChoice == "rock" {
                result = "CPU Wins"
            }
            else if cpuChoice == "paper" {
                result = "Player Wins"
            }
            else {
                result = "Tie"
            }
        }
        return result
    }
    
    @IBAction func rock(_ sender: Any) {
        playerImage.image = UIImage (named:"rock")
        doubleLastUserChoice = lastUserChoice
        lastUserChoice = "rock"
        headerLabel.text = whoWon(userChoice: "rock", cpuChoice: cpuChoiceDecider(lastUserChoice: lastUserChoice, doubleLastUserChoice: doubleLastUserChoice))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.headerLabel.text = "Rock Paper Scissors"
            self.playerImage.image = UIImage (named: "loading")
            self.cpuImage.image = UIImage (named: "loading")
        }
    }
    
    @IBAction func paper(_ sender: Any) {
        playerImage.image = UIImage (named:"paper")
        doubleLastUserChoice = lastUserChoice
        lastUserChoice = "paper"
        headerLabel.text = whoWon(userChoice: "paper", cpuChoice: cpuChoiceDecider(lastUserChoice: lastUserChoice, doubleLastUserChoice: doubleLastUserChoice))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.headerLabel.text = "Rock Paper Scissors"
            self.playerImage.image = UIImage (named: "loading")
            self.cpuImage.image = UIImage (named: "loading")
        }
    }
    
    @IBAction func scissors(_ sender: Any) {
        playerImage.image = UIImage (named:"scissors")
        doubleLastUserChoice = lastUserChoice
        lastUserChoice = "scissors"
        headerLabel.text = whoWon(userChoice: "scissors", cpuChoice: cpuChoiceDecider(lastUserChoice: lastUserChoice, doubleLastUserChoice: doubleLastUserChoice))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.headerLabel.text = "Rock Paper Scissors"
            self.playerImage.image = UIImage (named: "loading")
            self.cpuImage.image = UIImage (named: "loading")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
}

