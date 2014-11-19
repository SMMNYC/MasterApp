    //
//  ProfileViewController.swift
//  masterapp
//
//  Created by SciMedMedia on 11/12/14.
//  Copyright (c) 2014 scimedmedia. All rights reserved.
//

import UIKit
import Snappy

class ProfileKViewController: ContenteViewController {
    
    
    var viewLabel: String = ""{
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

    
    
    
    
    @IBAction func test(sender: AnyObject) {
        let padding = UIEdgeInsetsMake(0, 0, 0, 0)
        
        
        let embedView=profileHolder1.subviews[0] as UIView
        
        
        embedView.snp_makeConstraints { make in
            make.edges.equalTo(embedView.superview!).with.insets(padding)
            return // this return is a fix for implicit returns in Swift and is only required for single line constraints
        }
        

    }
    
    @IBOutlet weak var profileHolder1: HJREmbedView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let theStoryboard=profileHolder1.storyboard
        let theScreen=profileHolder1.screen
        var mainView: UIStoryboard!
        mainView = UIStoryboard(name:theStoryboard, bundle: nil)
      //  parentController.currentViewController =  mainView.instantiateViewControllerWithIdentifier("entry") as? UIViewController
        let viewcontroller : UIViewController =  mainView.instantiateViewControllerWithIdentifier(theScreen) as UIViewController
       // let vc1 = viewcontroller as ContenteViewController
        //vc1.delegate = parentController
        
        let inView = viewcontroller.view
        
      //  parentController.placeholderView.hjrAddView(inView)

        // Do any additional setup after loading the view.
        profileHolder1.hjrEmbedView(inView)
    */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func navTest(sender: AnyObject) {
        navToView("home", theScreen: "Screen_2")
    }
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
