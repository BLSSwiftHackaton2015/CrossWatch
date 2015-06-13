//
//  InterfaceController.swift
//  CrossWatch WatchKit Extension
//
//  Created by Grzegorz Pawlowicz on 13.06.2015.
//  Copyright (c) 2015 Grzegorz Pawlowicz. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var workoutTime: WKInterfaceLabel!
    @IBOutlet weak var workoutName: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.workoutName.setTextColor(UIColor.redColor())
        self.workoutTime.setTextColor(UIColor.greenColor())


        
        if let workouts: [Workout] = NSUserDefaults.standardUserDefaults().valueForKey("WorkoutArray") as?[Workout] {
            self.workoutName.setText(workouts.first?.name)
            self.workoutTime.setText(String(stringInterpolationSegment: workouts.first?.time))
        }
    }

    override func willActivate() {
        super.willActivate()
        if let workouts: [Workout] = NSUserDefaults.standardUserDefaults().valueForKey("WorkoutArray") as?[Workout] {
            self.workoutName.setText(workouts.first?.name)
            self.workoutTime.setText(String(stringInterpolationSegment: workouts.first?.time))
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
