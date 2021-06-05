//
//  ViewController.swift
//  NewApp
//
//  Created by radix on 05/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var timer = Timer()
    var counter: Int = 0
    var seconds: Int = 0
    var minutes: Int = 0
    var hours: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        label.text = "\(String(format: "%02d", hours)):\(String(format: "%02d", minutes)):\(String(format: "%02d", seconds))"
    
    }

    @IBAction func startTimer(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if(seconds == 59) {
            if (minutes == 59) {
                hours += 1
                minutes = 0
                seconds = 0
            } else {
                minutes += 1
                seconds = 0
            }
        } else {
            seconds += 1
        }
        if seconds < 10 { }
        label.text = "\(String(format: "%02d", hours)):\(String(format: "%02d", minutes)):\(String(format: "%02d", seconds))"
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func restartTimer(_ sender: Any) {
        timer.invalidate()
        hours = 0
        minutes = 0
        seconds = 0
        label.text = "\(String(format: "%02d", hours)):\(String(format: "%02d", minutes)):\(String(format: "%02d", seconds))"
    }
    
}

