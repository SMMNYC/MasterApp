//
//  SplashViewController.swift
//  masterapp
//
//  Created by SciMedMedia on 12/4/14.
//  Copyright (c) 2014 scimedmedia. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var timer = NSTimer.scheduledTimerWithTimeInterval(4.0, target: self, selector: Selector("update"), userInfo: nil, repeats: false)
    }
    
    func update() {
        performSegueWithIdentifier("LogonViewSegue", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
