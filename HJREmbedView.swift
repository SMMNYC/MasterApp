//
//  HJREmbedView.swift
//  masterapp
//
//  Created by SciMedMedia on 11/18/14.
//  Copyright (c) 2014 scimedmedia. All rights reserved.
//

import UIKit

class HJREmbedView: UIView {
 var storyboard: String = ""{
        willSet
        {
           // println("About to set status to:  \(viewLabel)")
        }
        didSet
        {
          //if viewLabel != oldValue
           // {
               // postNewStatusNotification()
           // }
        }
    }

    var screen: String = ""{
        willSet
        {
            // println("About to set status to:  \(viewLabel)")
        }
        didSet
        {
            // setTranslatesAutoresizingMaskIntoConstraints(false)
            
            // let theStoryboard=profileHolder1.storyboard
            // let theScreen=profileHolder1.screen
            var mainView: UIStoryboard!
            mainView = UIStoryboard(name:storyboard, bundle: nil)
            //  parentController.currentViewController =  mainView.instantiateViewControllerWithIdentifier("entry") as? UIViewController
            let viewcontroller : UIViewController =  mainView.instantiateViewControllerWithIdentifier(screen) as UIViewController
            // let vc1 = viewcontroller as ContenteViewController
            //vc1.delegate = parentController
            
            let inView = viewcontroller.view
            
            //  parentController.placeholderView.hjrAddView(inView)
            
            // Do any additional setup after loading the view.
            self.hjrEmbedView(inView)        }
        
        
         }
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

   
}




