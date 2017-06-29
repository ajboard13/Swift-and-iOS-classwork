//
//  ViewController.swift
//  Stopwatch
//
//  Created by Student on 5/4/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let stopwatch = Stopwatch()
    
    @IBAction func startButton(_ sender: UIButton) {
        print("starting stopwatch")
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateElapsedTimeLabel(timer:)), userInfo: nil, repeats: true)
        stopwatch.start()
    }
    
    func updateElapsedTimeLabel(timer: Timer) {
        if stopwatch.isRunning {
            elapsedTimeLabel.text = stopwatch.elapsedTimeAsString
        } else {
            timer.invalidate()
        }
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        print(stopwatch.elapsedTime)
        stopwatch.stop()
    }
    
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

