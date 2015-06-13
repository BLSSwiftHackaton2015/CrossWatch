//
//  addWorkoutViewController.swift
//  CrossWatch
//
//  Created by Grzegorz Pawlowicz on 13.06.2015.
//  Copyright (c) 2015 Grzegorz Pawlowicz. All rights reserved.
//

import UIKit

class AddWorkoutViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var intervalsLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var workoutField: UITextField!
    @IBOutlet weak var restField: UITextField!
    @IBOutlet weak var intervalsField: UITextField!
    @IBOutlet weak var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        workoutField.delegate = self
        restField.delegate = self
        intervalsField.delegate = self
        
        nameField.tag = 1
        workoutField.tag = 2
        restField.tag = 3
        intervalsField.tag = 4
        
        workoutField.keyboardType = UIKeyboardType.NumberPad
        restField.keyboardType = UIKeyboardType.NumberPad
        intervalsField.keyboardType = UIKeyboardType.NumberPad
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
        })
    }

    @IBAction func addWorkouts(sender: AnyObject) {
        if count(workoutField.text) == 5 {
            
            if let intervals:Int = intervalsField.text.toInt() {
                saveWorkouts(intervals)
                
            } else {
                saveWorkouts(1)
            }
            
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
            })
        }
    }
    
    func saveWorkouts(intervals: Int) {
        
        var workoutsArray = Array<Workout>()
        
        var workout:Workout
        var rest:Workout
        
        for i in 1...intervals {
            workout = Workout(name: "\(nameField.text) \(i)", time: createTimeFromTextField(workoutField))
            workoutsArray.append(workout)
            if !restField.text.isEmpty {
                rest = Workout(name: "Rest \(i)", time: createTimeFromTextField(restField))
                workoutsArray.append(rest)
            }
        }
        UserDefaults.sendWorkouts(workoutsArray)
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        let timeFieldsArray = [2,3]
        if contains(timeFieldsArray, textField.tag) {
            let countOfDigits = count(textField.text)
            if countOfDigits == 0{
                return
            }
            else if countOfDigits == 1 {
                textField.text = "0\(textField.text):00"
                return
            }
            else if countOfDigits == 2 {
                textField.text = "\(textField.text):00"
                return
            }
            else if countOfDigits < 5 {
                let missingZeros = 5 - countOfDigits
                for i in 1...missingZeros {
                    textField.text = "\(textField.text)0"
                }
            }
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let timeFieldsArray = [2,3]
        if string != "" {
            if contains(timeFieldsArray, textField.tag) {
                if count(textField.text) == 1 {
                    textField.text = "\(textField.text)\(string):"
                    return false
                }
                if count(textField.text) == 3 && string.toInt() > 5 {
                    return false
                }
                if count(textField.text) == 5 {
                    return false
                }
            }
            
            if textField.tag == 4 && count(textField.text) > 1{
                return false
            }
            
            if textField.tag == 1 && count(textField.text) > 11 {
                return false
            }
        }
        
        return true
    }
    
    func createTimeFromTextField(textField: UITextField) -> NSTimeInterval {
        
        let minutesRange = Range(start: textField.text.startIndex, end: advance(textField.text.startIndex, 2))
        let secondsRange = Range(start: advance(textField.text.startIndex, 3), end: advance(textField.text.startIndex, 5))
        
        let minutes = textField.text.substringWithRange(minutesRange)
        let seconds = textField.text.substringWithRange(secondsRange)
        
        let wholeSeconds:Int = (minutes.toInt()! * 60) + seconds.toInt()!
        
        return NSTimeInterval(wholeSeconds)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
