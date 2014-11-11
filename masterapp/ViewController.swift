//
//  ViewController.swift
//  masterapp
//
//  Created by SciMedMedia on 11/7/14.
//  Copyright (c) 2014 scimedmedia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     var expanded=false
  
     @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
     @IBOutlet weak var menuViewContainer: UIView!
    @IBAction func menuButtonPress(sender: AnyObject) {
      
         var w: CGFloat!
         self.expanded = !(self.expanded)
        
        if (self.expanded){
            w = 0
        }
        else{
    
            w  = 0 - menuViewContainer.frame.width
            
        }
        
        var newConstraint = NSLayoutConstraint(item: menuViewContainer, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1.0, constant: w)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseOut , animations: {
            self.view.removeConstraint(self.leadingConstraint)
            self.view.addConstraint(newConstraint)
            self.view.layoutIfNeeded()
            }, completion: nil)

        
            leadingConstraint = newConstraint
           }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

