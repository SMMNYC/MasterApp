//
//  HomeViewController.swift
//  masterapp
//
//  Created by SciMedMedia on 11/22/14.
//  Copyright (c) 2014 scimedmedia. All rights reserved.
//

import UIKit

class HomeViewController: ContenteViewController {
    @IBOutlet weak var testButton: UIButton!

    @IBAction func testNavToCenter(sender: AnyObject) {
        if (delegate != nil) {
            delegate!.navToCenterView("CenterSample", theScreen: "entry2")
        }
    }
    @IBAction func testNaveToFull(sender: AnyObject) {
        if (delegate != nil) {
            delegate!.navToFullView("FullSample", theScreen: "entry")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
