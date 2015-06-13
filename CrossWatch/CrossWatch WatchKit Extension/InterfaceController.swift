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

    @IBOutlet weak var workoutName: WKInterfaceLabel!
    
    @IBOutlet weak var workoutTime: WKInterfaceLabel!

    let getDictForInfo = ["give" : "info"]
    let playSound = ["play" : "sound"]
    var timer: NSTimer?
    var response: Workout?
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.workoutName.setTextColor(UIColor.redColor())
        self.workoutTime.setTextColor(UIColor.greenColor())
        
    }
    
    

    override func willActivate() {
        super.willActivate()
        openParentAppForInfo(getDictForInfo)
    }
    
    private func openParentAppForInfo(Dict: [String: String]) {
        WKInterfaceController.openParentApplication(getDictForInfo) {
            (replyDictionary, error) -> Void in
                        
            if let castedResponseDictionary = replyDictionary as? [String: String],
                responseName = castedResponseDictionary["name"]
            {
                if (responseName != "") {
                    var responseTime = castedResponseDictionary["time"]
                    var time = NSString(string: responseTime!)
                    self.response = Workout(name: responseName, time: time.doubleValue)
                    self.response?.startTimer()
                    self.updateView()
                } else {
                    self.response = Workout(name: "Finish", time: 0)
                    self.updateView()
                    self.timer?.invalidate()
                }
            }
        }
    }

    @IBAction func buttonTap() {
        openParentAppForInfo(getDictForInfo)
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("decreaseTime"), userInfo: nil, repeats: true)
    }
    
    func updateView() {
        if let workout = self.response {
            self.workoutName.setText(workout.name)
            self.workoutTime.setText(String(stringInterpolationSegment: Int(workout.time)))
        }
    }
    
    func decreaseTime() {
        if let time = self.response?.time {
            if (time == 0) {
                openParentAppForInfo(getDictForInfo)
            } else if (time == 3) {
                openParentAppForInfo(playSound)
            }
        }
        self.updateView()
    }
}
