//
//  WorkoutTableViewController.swift
//  CrossWatch
//
//  Created by Grzegorz Pawlowicz on 13.06.2015.
//  Copyright (c) 2015 Grzegorz Pawlowicz. All rights reserved.
//

import UIKit

class WorkoutTableViewController: UITableViewController {

    var workoutArray: [Workout] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareArray()
        self.tableView.reloadData()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        if let workouts: [Workout] = NSUserDefaults.standardUserDefaults().valueForKey("WorkoutArray") as?[Workout] {
            self.workoutArray = workouts
        } else {
            NSUserDefaults.standardUserDefaults().setValue([], forKey: "WorkoutArray")
        }
        prepareArray()
    }
    
    func prepareArray() {
        var workout = Workout(name: "a", time: 10)
        workout.startTimer()
        workoutArray.append(workout)
        
    }

    func checkFirstRow() {
        if (workoutArray.count > 0) {
            if (workoutArray[0].time == 0) {
                workoutArray.removeAtIndex(0)
            }
        }
        self.tableView.reloadData()

    }
    
    func startTimer() {
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("checkFirstRow"), userInfo: nil, repeats: true)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.workoutArray.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("WorkoutCell", forIndexPath: indexPath) as! WorkoutTableViewCell
       
            cell.nameWorkout.text = workoutArray[indexPath.row].name
            cell.timeWorkout.text = String(stringInterpolationSegment: workoutArray[indexPath.row].time)
    
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath == NSIndexPath(forRow: 0, inSection: 0)) {
            self.startTimer()
        }
    }

}


