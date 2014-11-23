//
//  FullViewController.swift
//  masterapp
//
//  Created by SciMedMedia on 11/22/14.
//  Copyright (c) 2014 scimedmedia. All rights reserved.
//

import UIKit

class FullViewController: ContenteViewController {
  var passId = (storyboard: "", screen: "")
    
    @IBOutlet weak var placeholderView: UIView!
       var currentViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
// passId=delegate.p
        //Todo get from sqgue
       // loadStoryboard ("FullScreenSample", theScreen: "entry");
        loadStoryboard (self.passId.storyboard, theScreen: self.passId.screen);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleCloseBtn(sender: AnyObject) {
         self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func loadStoryboard (theBoard:String, theScreen:String){
        var theSegue = theBoard.lowercaseString
        //loadContainer(theSegue)
        //return
        passId.storyboard = theSegue
        passId.screen = theScreen
        var loadSegue="FullScreenEmbedSegue"
       // if(contains(availableIdentifiers, theSegue)) {
            
            performSegueWithIdentifier(loadSegue, sender: nil)
            
       // }
        
    }


}
