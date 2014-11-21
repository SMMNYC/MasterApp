//
//  ViewController.swift
//  masterapp
//
//  Created by SciMedMedia on 11/7/14.
//  Copyright (c) 2014 scimedmedia. All rights reserved.
//

import UIKit
import Snappy

class ViewController: UIViewController, MenuViewControllerDelegate, ContentViewControllerDelegate {
    var passId = (storyboard: "", screen: "")
    
     var expanded=false
   var currentViewController: UIViewController?
    var leadingConstraint: NSLayoutConstraint!
    var availableIdentifiers = ["home","profile", "schedule", "people", "maps","bookaroom","guides", "learning", "programs", "catalog", "forum","community", "feed", "events"]
    //["Home","Profile","Schedule", "Book A Room", "People", "Maps", "Guides", "Learning", "Programs", "Catalog", "Forum","Community", "Feed", "Events"]
    @IBOutlet weak var placeholderView: UIView!
    
    @IBOutlet weak var placeholderContainer: UIView!
     //@IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    
    /*
    @IBAction func testAnim(sender: AnyObject) {
       
        let v1 = placeholderView.subviews as [UIView]
        if  (v1.count > 0 ) {
        
            let theView: UIView = v1[0] as UIView
            theView.alpha = 0.9
               let padding = UIEdgeInsetsMake(300, 0, 0, 0)
            
            
            
            
            theView.snp_makeConstraints { make in
                make.edges.equalTo(theView.superview!).with.insets(padding)
                return // this return is a fix for implicit returns in Swift and is only required for single line constraints
            }
            
                  }
    
       
        
       // for view in placeholderView.subviews as [UIView] {
           // view.alpha = 0.5
            
        //}

    }
*/


    
    @IBOutlet weak var contentContainer: UIView!
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
        
        UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveEaseOut , animations: {
            self.view.removeConstraint(self.leadingConstraint)
            self.view.addConstraint(newConstraint)
            self.view.layoutIfNeeded()
            }, completion: { finished in
                self.leadingConstraint = newConstraint

        })

        
                      }
   
    override func viewDidLoad() {
        super.viewDidLoad()
       initPositionMenu()
     
       loadStoryboard ("home", theScreen:"entry")

     
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
        
        if(contains(availableIdentifiers, segue.identifier!)) {
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
    
    func navToView(theView:String, theScreen:String){
        loadStoryboard (theView, theScreen:theScreen)
    }
    func loadContainer (theBoard:String){
        /*
        for view in contentContainer.subviews as [UIView] {
            view.removeFromSuperview()
        }
        
        
        var mainView: UIStoryboard!
        mainView = UIStoryboard(name: theBoard, bundle: nil)
        var viewcontroller : UIViewController = mainView.instantiateInitialViewController() as UIViewController
        currentViewController=viewcontroller
        contentContainer.addSubview(viewcontroller.view)
       viewcontroller.view.userInteractionEnabled=true
        contentContainer.userInteractionEnabled=true
         viewcontroller.didMoveToParentViewController(self)
*/
        
        let tabBarController = self as ViewController
        
        var mainView: UIStoryboard!
        mainView = UIStoryboard(name: theBoard, bundle: nil)
        currentViewController =  mainView.instantiateInitialViewController() as UIViewController
       
        
        
        
        for view in placeholderView.subviews as [UIView] {
            view.removeFromSuperview()
        }
        
        // Add view to placeholder view
        // tabBarController.currentViewController = destinationController
        // tabBarController.placeholderView.addSubview(destinationController.view)
        placeholderContainer.addSubview(currentViewController!.view)
        
        // Set autoresizing
     
        
        tabBarController.placeholderView.layoutIfNeeded()
        //destinationController.didMoveToParentViewController(tabBarController)
        currentViewController!.didMoveToParentViewController(self)

    }
    
    func loadStoryboard (theBoard:String, theScreen:String){
        var theSegue = theBoard.lowercaseString
        //loadContainer(theSegue)
       //return
        passId.storyboard = theSegue
        passId.screen = theScreen
        var loadSegue="Segue1"
        if(contains(availableIdentifiers, theSegue)) {
            
            performSegueWithIdentifier(loadSegue, sender: nil)
                        
        }

    }
    func handleMenuChoice(controller: MenuViewController, theChoice:String) {
        var theCleanedChoice=theChoice.replace(" ", withString:"")
        loadStoryboard(theCleanedChoice, theScreen:"entry")
    }
    

}

