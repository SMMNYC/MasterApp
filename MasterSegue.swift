//
//  PokerSegue.swift
//  pokeratlastable
//
//  Created by SciMedMedia on 11/2/14.
//  Copyright (c) 2014 Overlay Gaming. All rights reserved.
//

import UIKit

class MasterSegue: UIStoryboardSegue {
    
   //var theID:String!
    var theID=(storyboard:"", screen:"")
   
    
    
    override func perform() {
        
        let tabBarController = self.sourceViewController as ViewController
        let destinationController = self.destinationViewController as UIViewController
        
        var mainView: UIStoryboard!
        mainView = UIStoryboard(name: theID.storyboard, bundle: nil)
        tabBarController.currentViewController =  mainView.instantiateViewControllerWithIdentifier(theID.screen) as? UIViewController
        let viewcontroller : UIViewController =  tabBarController.currentViewController!
        
        let vc1 = viewcontroller as ContenteViewController
        vc1.delegate = tabBarController
        
        
        let inView = viewcontroller.view

        tabBarController.placeholderView.hjrAddView(inView)
    
        
        viewcontroller.didMoveToParentViewController(tabBarController)
        
    }

    
    /*
    
    override func perform() {
        
        let tabBarController = self.sourceViewController as ViewController
        let destinationController = self.destinationViewController as UIViewController
     
        
        
        var mainView: UIStoryboard!
        mainView = UIStoryboard(name: theID.storyboard, bundle: nil)
        //tabBarController.currentViewController =  mainView.instantiateInitialViewController() as? UIViewController
        tabBarController.currentViewController =  mainView.instantiateViewControllerWithIdentifier(theID.screen) as? UIViewController
        
        let viewcontroller : UIViewController =  tabBarController.currentViewController!
        
        
        let vc1 = viewcontroller as ContenteViewController
        vc1.delegate = tabBarController
        
        
        
       
        
        
        
        
        let v1 =  tabBarController.placeholderView.subviews as [UIView]
        if  (v1.count > 0 ) {
            
            let theView: UIView = v1[0] as UIView
            let inView = viewcontroller.view
             tabBarController.placeholderView.addSubview(inView)
            
            var inviewFrame = inView.frame
            inviewFrame.origin.x -= inviewFrame.size.width
            inView.frame = inviewFrame

            
            
            UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveEaseOut, animations: {
                var viewFrame = theView.frame
                viewFrame.origin.x += viewFrame.size.width
                theView.frame = viewFrame
                inviewFrame.origin.x += inviewFrame.size.width
                inView.frame = inviewFrame

                
                }, completion: { finished in
                    println("Transition Complete!")
                    theView.removeFromSuperview()
            })
            
            
        }
        else{
             //tabBarController.placeholderView.addSubview(viewcontroller.view)
            tabBarController.placeholderView.hjrAddView(viewcontroller.view)
        }

       
        // Set autoresizing
        
        
        
        
        /*
        tabBarController.placeholderView.setTranslatesAutoresizingMaskIntoConstraints(false)
        destinationController.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        
        // let horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": destinationController.view])
        let horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": viewcontroller.view])
        
        tabBarController.placeholderView.addConstraints(horizontalConstraint)
        
        //  let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": destinationController.view])
        let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-40-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": viewcontroller.view])
        tabBarController.placeholderView.addConstraints(verticalConstraint)
        
        tabBarController.placeholderView.layoutIfNeeded()
        //destinationController.didMoveToParentViewController(tabBarController)
        */
        
        
        
        
        viewcontroller.didMoveToParentViewController(tabBarController)
        
    }

    */
    
    /*
    
    override func perform() {
     
        let tabBarController = self.sourceViewController as ViewController
        let destinationController = self.destinationViewController as UIViewController
        //var vc:ViewController = ViewController()
        
      
        var mainView: UIStoryboard!
        mainView = UIStoryboard(name: theID.storyboard, bundle: nil)
       //tabBarController.currentViewController =  mainView.instantiateInitialViewController() as? UIViewController
        tabBarController.currentViewController =  mainView.instantiateViewControllerWithIdentifier(theID.screen) as? UIViewController
        
        let viewcontroller : UIViewController =  tabBarController.currentViewController!

      
               let vc1 = viewcontroller as ContenteViewController
                vc1.delegate = tabBarController
      
        

        
        for view in tabBarController.placeholderView.subviews as [UIView] {
            view.removeFromSuperview()
        }
        
        // Add view to placeholder view
       // tabBarController.currentViewController = destinationController
       // tabBarController.placeholderView.addSubview(destinationController.view)
        tabBarController.placeholderView.addSubview(viewcontroller.view)
       
        // Set autoresizing
      
        
        
        
        /*
        tabBarController.placeholderView.setTranslatesAutoresizingMaskIntoConstraints(false)
        destinationController.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        
     
     // let horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": destinationController.view])
        let horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": viewcontroller.view])
       
        tabBarController.placeholderView.addConstraints(horizontalConstraint)
       
      //  let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": destinationController.view])
        let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-40-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": viewcontroller.view])
        tabBarController.placeholderView.addConstraints(verticalConstraint)
     
        tabBarController.placeholderView.layoutIfNeeded()
        //destinationController.didMoveToParentViewController(tabBarController)
        */
     
        
        
        
        viewcontroller.didMoveToParentViewController(tabBarController)

    }
*/
    
}