//
//  PokerSegue.swift
//  pokeratlastable
//
//  Created by SciMedMedia on 11/2/14.
//  Copyright (c) 2014 Overlay Gaming. All rights reserved.
//

import UIKit

class MasterSegue: UIStoryboardSegue {
    
   var theID:String!
    
    override func perform() {
     
        let tabBarController = self.sourceViewController as ViewController
        let destinationController = self.destinationViewController as UIViewController
        //var vc:ViewController = ViewController()
        
      
var mainView: UIStoryboard!
mainView = UIStoryboard(name: theID, bundle: nil)
let viewcontroller : UIViewController = mainView.instantiateInitialViewController() as UIViewController


        
        for view in tabBarController.placeholderView.subviews as [UIView] {
            view.removeFromSuperview()
        }
        
        // Add view to placeholder view
        tabBarController.currentViewController = destinationController
       // tabBarController.placeholderView.addSubview(destinationController.view)
        tabBarController.placeholderView.addSubview(viewcontroller.view)

        
        // Set autoresizing
        tabBarController.placeholderView.setTranslatesAutoresizingMaskIntoConstraints(false)
        destinationController.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        
     
     // let horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": destinationController.view])
        let horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": viewcontroller.view])
       
        tabBarController.placeholderView.addConstraints(horizontalConstraint)
       
      //  let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": destinationController.view])
        let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": viewcontroller.view])
        tabBarController.placeholderView.addConstraints(verticalConstraint)
      
        tabBarController.placeholderView.layoutIfNeeded()
        //destinationController.didMoveToParentViewController(tabBarController)
        viewcontroller.didMoveToParentViewController(tabBarController)

    }
    
}