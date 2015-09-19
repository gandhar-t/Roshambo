//
//  GameViewController.swift
//  Roshambo
//
//  Created by Gandhar on 2015-09-10.
//  Copyright © 2015 gandhar. All rights reserved.
//

import Foundation
import UIKit

class GameViewController: UIViewController {
    
    @IBAction func rockSelected(sender: AnyObject) {
        let (imageIndex, resultIndex, computerSelection) = self.imageAndResultFinder("rock")
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ResultVC") as! ResultViewController
        vc.imageValue = imageIndex
        vc.resultValue = resultIndex
        vc.computerSelection = computerSelection
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func paperSelected(sender: AnyObject) {
        let (imageIndex, resultIndex, computerSelection) = self.imageAndResultFinder("paper")
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ResultVC") as! ResultViewController
        vc.imageValue = imageIndex
        vc.resultValue = resultIndex
        vc.computerSelection = computerSelection
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "rollDice" {
            let (imageIndex, resultIndex, computerSelection) = self.imageAndResultFinder("scissor")
            let controller = segue.destinationViewController as! ResultViewController
            controller.imageValue = imageIndex
            controller.resultValue = resultIndex
            controller.computerSelection = computerSelection
        }
    }
    
    func imageAndResultFinder(userSelection: String) -> (Int,Int,String) {
        /*
        imageIndex:
        1 -> Tie
        2 -> P > R
        3 -> R > S
        4 -> S > P
        
        resultIndex:
        1 -> W
        2 -> L
        3 -> T
        */
        
        let possibleSelectedStates = ["rock", "paper", "scissor"]
        let computerSelection = possibleSelectedStates[Int(arc4random_uniform(UInt32(possibleSelectedStates.count)))]
        
        switch userSelection {
        case "rock":
            switch computerSelection {
            case "rock":
                return (1,3,"rock")
            case "paper":
                return (2,2,"paper")
            case "scissor":
                return (3,1,"scissor")
            default:
                print("Computer selection not recognized")
                return (0,0,"nil")
            }
        case "paper":
            switch computerSelection {
            case "rock":
                return (2,1,"rock")
            case "paper":
                return (1,3,"paper")
            case "scissor":
                return (4,2,"scissor")
            default:
                print("Computer selection not recognized")
                return (0,0,"nil")
            }
        case "scissor":
            switch computerSelection {
            case "rock":
                return (3,2,"rock")
            case "paper":
                return (4,1,"paper")
            case "scissor":
                return (1,3,"scissor")
            default:
                print("Computer selection not recognized")
                return (0,0,"nil")
            }
        default:
            print("User selection not recognized")
            return (0,0,"nil")
        }
    }
}
