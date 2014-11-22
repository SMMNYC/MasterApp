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
        
        let parentController = self.sourceViewController as ViewController
    //db?
        //  let destinationController = self.destinationViewController as UIViewController
        
        var mainView: UIStoryboard!
        mainView = UIStoryboard(name: theID.storyboard, bundle: nil)
        parentController.currentViewController =  mainView.instantiateViewControllerWithIdentifier(theID.screen) as? UIViewController
        let viewcontroller : UIViewController =  parentController.currentViewController!
        let vc1 = viewcontroller as ContenteViewController
        vc1.delegate = parentController
        
        let inView = viewcontroller.view

        parentController.placeholderView.hjrAddView(inView)
    
        //db?
        //viewcontroller.didMoveToParentViewController(tabBarController)
        
    }

       
}