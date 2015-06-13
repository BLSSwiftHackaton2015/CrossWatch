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
        
        workoutField.keyboardType = UIKeyboardType.NumbersAndPunctuation
        restField.keyboardType = UIKeyboardType.DecimalPad
        intervalsField.keyboardType = UIKeyboardType.DecimalPad
        
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
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
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
