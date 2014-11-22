//
//  protocols.swift
//  masterapp
//
//  Created by SciMedMedia on 11/14/14.
//  Copyright (c) 2014 scimedmedia. All rights reserved.
//

import Foundation
protocol MenuViewControllerDelegate{
    func handleMenuChoice(controller: MenuViewController, theChoice:String)
}


protocol ContentViewControllerDelegate{
    func navToView(theView:String, theScreen:String)
    func navToCenterView(theView:String, theScreen:String)
    func navToFullView(theView:String, theScreen:String)

}

protocol CenterViewControllerDelegate{
    func closeCenter()
}