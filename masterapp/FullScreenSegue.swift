
import UIKit

class FullScreenSegue: UIStoryboardSegue {
    
    //var theID:String!
    var theID=(storyboard:"", screen:"")
    
    
    
    override func perform() {
        
        let parentController = self.sourceViewController as FullViewController
      
        //db?
        //  let destinationController = self.destinationViewController as UIViewController
        
        var mainView: UIStoryboard!
        //todo get from prepareforsegue
        theID.storyboard = "FullSample"
        theID.screen = "entry"
        mainView = UIStoryboard(name: theID.storyboard, bundle: nil)
        let t = mainView.instantiateViewControllerWithIdentifier(theID.screen) as? UIViewController
        
        parentController.currentViewController = t
        let viewcontroller : UIViewController =  parentController.currentViewController!
     
       // let vc1 = viewcontroller as ContenteViewController
      //  vc1.delegate = parentController
        
        let inView = viewcontroller.view
        
        parentController.placeholderView.hjrAddView(inView)
        
    }
    
    
}