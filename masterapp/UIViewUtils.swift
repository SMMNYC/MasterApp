import UIKit

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
   
}


