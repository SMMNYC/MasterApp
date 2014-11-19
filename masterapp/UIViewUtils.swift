import UIKit
import Snappy

extension UIView{
    
    
    func hjrAddView(inView:UIView)
    {
         self.addSubview(inView)
        if (self.subviews.count == 1){
           
            return
        }
        
        var inviewFrame = inView.frame
        inviewFrame.origin.x -= inviewFrame.size.width
        inView.frame = inviewFrame
        
        let outview:UIView = self.subviews[0] as UIView
        
        
        /*
       self.setTranslatesAutoresizingMaskIntoConstraints(false)
       inView.setTranslatesAutoresizingMaskIntoConstraints(false)
        let v1 =  self.subviews as [UIView]

        
        // let horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": destinationController.view])
        let horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": inView])
        
       self.addConstraints(horizontalConstraint)
        
        //  let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": destinationController.view])
        let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1":inView])
        self.addConstraints(verticalConstraint)
        
       self.layoutIfNeeded()
        //destinationController.didMoveToParentViewController(tabBarController)
*/
        
        

        
        UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveEaseOut, animations: {
            var viewFrame = outview.frame
            viewFrame.origin.x += viewFrame.size.width
            outview.frame = viewFrame
            inviewFrame.origin.x += inviewFrame.size.width
            inView.frame = inviewFrame
            
            
            }, completion: { finished in
                println("Transition Complete!")
                outview.removeFromSuperview()
        })
        

        
    }
    
    func hjrEmbedView(inView:UIView)
    {
        self.addSubview(inView)
        let padding = UIEdgeInsetsMake(0, 0, 0, 0)
        
        
        
        
        inView.snp_makeConstraints { make in
            make.edges.equalTo(inView.superview!).with.insets(padding)
            return // this return is a fix for implicit returns in Swift and is only required for single line constraints
        }
        
    }
   
}



