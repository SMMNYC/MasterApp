//
//  CenterViewController.swift
//  masterapp
//
//  Created by SciMedMedia on 11/22/14.
//  Copyright (c) 2014 scimedmedia. All rights reserved.
//

import UIKit

class CenterViewController: UIViewController {

    var passId = (storyboard: "", screen: "")
    var currentViewController: UIViewController?
    
    @IBOutlet weak var placeholderView: UIView!
    @IBAction func handleCloseBtn(sender: AnyObject) {
       // self.view.removeFromSuperview()
       // removeFromParentViewController()
        
         self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     loadStoryboard ("FullScreenSample", theScreen: "entry");
        // Do any additional setup after loading the view.
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadStoryboard (theBoard:String, theScreen:String){
        var theSegue = theBoard.lowercaseString
        //loadContainer(theSegue)
        //return
        passId.storyboard = theSegue
        passId.screen = theScreen
        var loadSegue="CenterScreenEmbedSegue"
        // if(contains(availableIdentifiers, theSegue)) {
    
        performSegueWithIdentifier(loadSegue, sender: nil)
    
   }


   
}


