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
    
    let getDictForInfo = ["give" : "info"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.workoutName.setTextColor(UIColor.redColor())
        self.workoutTime.setTextColor(UIColor.greenColor())
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("checkTime"), userInfo: nil, repeats: true)
    }
    
    

    override func willActivate() {
        super.willActivate()
        openParentAppForInfo(getDictForInfo)
    }
    
    private func openParentAppForInfo(Dict: [String: String]) {
        WKInterfaceController.openParentApplication(getDictForInfo) {
            (replyDictionary, error) -> Void in
            
            print("siedem")
            
            if let castedResponseDictionary = replyDictionary as? [String: String],
                responseMessage = castedResponseDictionary["message"]
            {
                println(responseMessage)
                print("osiem")
            }
        }
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    func checkTime() {
    }
}
