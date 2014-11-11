//
//  MenuViewController.swift
//  masterapp
//
//  Created by SciMedMedia on 11/11/14.
//  Copyright (c) 2014 scimedmedia. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
let tableData = ["Home","Profile","Schedule", "Book A Room", "People", "Maps", "Guides", "Learning", "Programs", "Catalog", "Forum","Community", "Feed", "Events"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return self.tableData.count;
    }
    
    func tableView(tableView: UITableView!,
        cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
       
        
        var cell = tableView.dequeueReusableCellWithIdentifier("MenuCell") as? UITableViewCell
        
        cell?.textLabel?.text = tableData[indexPath.row]
        
       // var imageName = UIImage(named: tableDatatableDatatableData[indexPath.row])
        var cellName = tableData[indexPath.row]
        var iconName = getIconName(cellName)
         var imageName = UIImage(named:iconName)
        cell?.imageView?.image = imageName
        
        return cell!
    }

    
    
    let aString = "She was a soul stripper. She took my heart!"
    let chars: [Character] = ["a", "e", "i"]

    func getIconName (cellName:String) ->String{
        var theName=cellName.lowercaseString
     
        theName  = theName.replace(" ", withString:"")
        return "\(theName)_icon"
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
