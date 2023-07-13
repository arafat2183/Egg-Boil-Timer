//
//  ViewController.swift
//  Egg Boil Timer
//
//  Created by Akash Arafat on 2023/07/13.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //    let softTime = 5
    //    let midiumTime = 7
    //    let hardTime = 12
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let eggtime = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        
        let hardness = sender.currentTitle! //Soft, Medium, Hard
        
        totalTime = eggtime[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            let parcentageProgress = Float(secondsPassed) / Float(totalTime)
            
            progressBar.progress = Float(parcentageProgress)
            
            print(parcentageProgress)
            
            
        }else {
            timer.invalidate()
            titleLabel.text = "Done!"
            playSound()
            
        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
}

