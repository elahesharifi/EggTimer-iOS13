//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var progreeBarView: UIProgressView!
    
    let eggTimes = ["Soft":3, "Medium":4, "Hard":7]
    var secondRemaining = 60
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
       
        progreeBarView.progress = 1.0
        timer.invalidate() //set timer with 0 amount that every time selected or we can say reset it
        
        let hardness = sender.currentTitle! //Soft , Medium , Hard
        secondRemaining = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
       
    }
    @objc func updateTimer(){
        if secondRemaining > 0 {
            print("\(secondRemaining) seconds.")
            secondRemaining -= 1
        }else{
            timer.invalidate()
            statusLabel.text = "Done!"
            
        }
    }

}

