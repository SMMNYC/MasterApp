//
//  ProfileViewController.swift
//  masterapp
//
//  Created by SciMedMedia on 11/12/14.
//  Copyright (c) 2014 scimedmedia. All rights reserved.
//

import UIKit


class ContenteViewController: UIViewController {
       var delegate:ContentViewControllerDelegate? = nil
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navToView(theView:String, theScreen:String){
        if (delegate != nil) {
            delegate!.navToView(theView, theScreen:theScreen)
        }

    }
    
      }
