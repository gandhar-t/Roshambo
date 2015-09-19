//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Gandhar on 2015-09-10.
//  Copyright © 2015 gandhar. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    let resultDictionary = [1:"You Win", 2:"You Loose", 3: "It's a tie"]
    let imageDictionary = [1:"itsATie", 2: "PaperCoversRock", 3: "RockCrushesScissors", 4: "ScissorsCutPaper"]
    
    var resultValue:Int? = nil
    var imageValue:Int? = nil
    var computerSelection:String? = nil
    
    @IBOutlet weak var resultDisplay: UILabel!
    @IBOutlet weak var imageDisplay: UIImageView!
    
    
    override func viewWillAppear(animated: Bool) {
        if let resultValue = resultValue {
            resultDisplay.text = resultDictionary[resultValue]
        }
        else {
            print("Result not set")
        }
        
        if let imageValue = imageValue {
            imageDisplay.image = UIImage(named: imageDictionary[imageValue]!)
        }
        else {
            print("Image not set")
        }
    }
    
    @IBAction func checkAgainAction(sender: AnyObject) {
        performSegueWithIdentifier("backToGame", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "rollDice" {
            let controller = segue.destinationViewController as!
            ResultViewController
            controller.resultValue = self.resultValue
            controller.imageValue = self.imageValue
            controller.computerSelection = self.computerSelection
        }
    }
}
