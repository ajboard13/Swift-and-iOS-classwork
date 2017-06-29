//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by Student on 5/4/17.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation

class Stopwatch{
    private var startTime: NSDate?
    
    var elapsedTime: TimeInterval {
        if let startTime = self.startTime{
            return -startTime.timeIntervalSinceNow
        } else {
            return 0
        }
    }
    
    
    func start() {
        startTime = NSDate()
    }
    
    func stop() {
        startTime = nil
    }
    
    var isRunning: Bool {
        return startTime != nil
    }
    
    var elapsedTimeAsString: String {
        return String(format:"%02d:%02d.%d",Int(elapsedTime / 60), Int(elapsedTime.truncatingRemainder(dividingBy: 60)), Int((elapsedTime*10).truncatingRemainder(dividingBy: 10)))
    }
    
}
