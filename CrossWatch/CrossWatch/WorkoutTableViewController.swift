//
//  WorkoutTableViewController.swift
//  CrossWatch
//
//  Created by Grzegorz Pawlowicz on 13.06.2015.
//  Copyright (c) 2015 Grzegorz Pawlowicz. All rights reserved.
//

import UIKit

class WorkoutTableViewController: UITableViewController {

    var workoutArray: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupWorkout()
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("checkFirstRow"), userInfo: nil, repeats: true)
    }

    func setupWorkout() {

    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = workoutArray?.count {
            return count
        } else {
            return 0
        }
    }
    func checkFirstRow() {
        self.tableView.dequeueReusableCellWithIdentifier("workoutCell", forIndexPath: <#NSIndexPath#>)
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("WorkoutCell", forIndexPath: indexPath) as! WorkoutTableViewCell
        
        if let work: Workout = workoutArray?.objectAtIndex(indexPath.row) as? Workout {
            cell.nameWorkout.text = work.name
            cell.timeWorkout.text = String(stringInterpolationSegment: work.time)
        }
    
        return cell
    }

}
