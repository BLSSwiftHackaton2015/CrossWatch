//
//  Workout.swift
//  CrossWatch
//
//  Created by Patronage on 13.06.2015.
//  Copyright (c) 2015 Grzegorz Pawlowicz. All rights reserved.
//

import Foundation

class Workout: NSObject{
    let name: String
    var time: NSTimeInterval
    var timer: NSTimer?
    
    init(name: String, time: NSTimeInterval){
        self.name = name
        self.time = time
    }
    
    func startTimer(){
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("revokeWorkoutTime"), userInfo: nil, repeats: true)
    }
    
    func revokeWorkoutTime() {
        if (self.time > 0) {
            self.time -= NSTimeInterval(1.0)
        }
        else{
            self.timer?.invalidate()
        }
    }
}
