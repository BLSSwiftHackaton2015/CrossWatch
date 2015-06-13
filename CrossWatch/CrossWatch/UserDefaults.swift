//
//  UserDefaults.swift
//  CrossWatch
//
//  Created by Grzegorz Pawlowicz on 13.06.2015.
//  Copyright (c) 2015 Grzegorz Pawlowicz. All rights reserved.
//

import UIKit

class UserDefaults: NSObject {
   
    static func sendWorkout(workout: Workout){
        
        if var workoutsArray = getWorkouts() {
            workoutsArray.append(workout)
            let data = NSKeyedArchiver.archivedDataWithRootObject(workoutsArray)
            NSUserDefaults.standardUserDefaults().setObject(data, forKey: "WorkoutArray")
            return
        } else {
            var workoutsArray = [workout]
            let data = NSKeyedArchiver.archivedDataWithRootObject(workoutsArray)
            NSUserDefaults.standardUserDefaults().setObject(data, forKey: "WorkoutArray")
            return
        }
    }
    
    static func sendWorkouts(workoutsArray: Array<Workout>) {
        for workout in workoutsArray {
            sendWorkout(workout)
        }
    }
    
    static func getWorkouts() -> Array<Workout>? {
        let data = NSUserDefaults.standardUserDefaults().valueForKey("WorkoutArray") as! NSData
        var workoutsArray = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [Workout]
        
        return workoutsArray
    }
    
}
