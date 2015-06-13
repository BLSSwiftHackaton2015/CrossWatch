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

        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("addWorkout"))
        
        self.navigationItem.setRightBarButtonItem(addButton, animated: false)
        self.tableView.reloadData()
        
        UserDefaults.sendNewWorkoutArray(workoutArray)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        if let workouts = UserDefaults.getWorkouts() {
            workoutArray = workouts
        }
        tableView.reloadData()
    }
    
    func checkFirstRow() {
        if (workoutArray.count > 0) {
            if (workoutArray[0].time == 0) {
                workoutArray.removeAtIndex(0)
                UserDefaults.sendNewWorkoutArray(workoutArray)
            }
        }
        if let workout = workoutArray.first {
            workout.startTimer()
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
        
            cell.timeWorkout.text = timeToString(workoutArray[indexPath.row].time)
        
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath == NSIndexPath(forRow: 0, inSection: 0)) {
            
        }
    }

    func addWorkout(){
        self.performSegueWithIdentifier("addWorkout", sender: nil)
    }
    
    func timeToString(time: NSTimeInterval) -> String {
        
        var ti = Int(time)
        var seconds = ti % 60
        var minutes = (ti / 60) % 60
        
        if seconds == 0 {
            return "\(minutes):00"
        }
        return "\(minutes):\(seconds)"
    }
}



