//
//  Workout.swift
//  CrossWatch
//
//  Created by Patronage on 13.06.2015.
//  Copyright (c) 2015 Grzegorz Pawlowicz. All rights reserved.
//

import Foundation

class Workout: NSObject, NSCoding{
    let name: String
    var time: NSTimeInterval
    var timer: NSTimer?
//    var type: TypeOfWorkout
//    
//    enum TypeOfWorkout {
//        case workout
//        case rest
//    }
    
    required convenience init(coder decoder: NSCoder) {
        self.init(name: decoder.decodeObjectForKey("name") as! String, time: decoder.decodeObjectForKey("time") as! NSTimeInterval)
        
    }
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey:"name")
        aCoder.encodeObject(time, forKey:"time")
    }
    
    init(name: String, time: NSTimeInterval){
        self.name = name
        self.time = time
//        self.type = TypeOfWorkout.workout
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
    
//    func setWorkoutType(type: TypeOfWorkout){
//        self.type = type
//    }
}
