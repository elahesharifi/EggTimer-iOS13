//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var progreeBarView: UIProgressView!
    
    let eggTimes = ["Soft":3, "Medium":4, "Hard":7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!

    @IBAction func hardnessSelected(_ sender: UIButton) {

        timer.invalidate() //set timer with 0 amount that every time selected or we can say reset it
        let hardness = sender.currentTitle! //Soft , Medium , Hard
        totalTime = eggTimes[hardness]!
        progreeBarView.progress = 0.0
        secondsPassed = 0
        statusLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
       
    }
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            progreeBarView.progress = Float(secondsPassed) / Float(totalTime)
           
        }else {
            timer.invalidate()
            statusLabel.text = "Done!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                        player = try! AVAudioPlayer(contentsOf: url!)
                        player.play()
            
        }
    }
}

