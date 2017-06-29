//
//  ViewController.swift
//  Clock
//
//  Created by Student on 4/27/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var timeLabel: UILabel!
    
    let clock = Clock()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTimeLabel()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self,
                                                       selector: #selector(ViewController.updateTimeLabel), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func updateTimeLabel() {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        timeLabel.text = formatter.string(from: clock.currentTime as Date)
    }
    
}
