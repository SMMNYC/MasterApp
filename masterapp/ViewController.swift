//
//  ViewController.swift
//  masterapp
//
//  Created by SciMedMedia on 11/7/14.
//  Copyright (c) 2014 scimedmedia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MenuViewControllerDelegate {
    var passId:String!
     var expanded=false
   var currentViewController: UIViewController?
    var leadingConstraint: NSLayoutConstraint!
    var availableIdentifiers = ["homeSegue","profileSegue", "scheduleSegue", "peopleSegue"]
    @IBOutlet weak var placeholderView: UIView!
     //@IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
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
       initPositionMenu()
       
      loadStoryboard ("home")

      // performSegueWithIdentifier("homeSegue", sender: nil)
        // Do any additional setup after loading the view, typically from a nib.
       // handleMenuChoice (new AnyObject()  theChoice: "home")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func initPositionMenu(){
          self.view.layoutIfNeeded()
       // var w: CGFloat = 0 - UIScreen.mainScreen().bounds.size.width
        var w: CGFloat  = 0 - menuViewContainer.frame.width

      //  w = -375.0
        var newConstraint = NSLayoutConstraint(item: menuViewContainer, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1.0, constant: w)
        self.view.addConstraint(newConstraint)
         self.view.layoutIfNeeded()
          leadingConstraint = newConstraint
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(contains(availableIdentifiers, segue.identifier)) {
                       placeholderView.userInteractionEnabled=true
                    }
        if segue.identifier == "menuSegue"{
            let vc = segue.destinationViewController as MenuViewController
            vc.delegate = self
        }
        else{
            var segRef = segue as MasterSegue
            segRef.theID=passId

        }
        
    }
    
    func loadStoryboard (theBoard:String){
        var theSegue = "\(theBoard.lowercaseString)Segue"
        passId = "\(theSegue)Storyboard"
        var loadSegue="Segue1"
        if(contains(availableIdentifiers, theSegue)) {
            
            performSegueWithIdentifier(loadSegue, sender: nil)
            //println("in Delegate \(theChoice)!")
            
        }

    }
    func handleMenuChoice(controller: MenuViewController, theChoice:String) {
        loadStoryboard(theChoice)
    }
    

}

