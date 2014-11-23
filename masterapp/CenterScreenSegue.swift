
import UIKit

class CenterScreenSegue: UIStoryboardSegue {
    
    //var theID:String!
    var theID=(storyboard:"", screen:"")
    
    
    
    override func perform() {
        
        let parentController = self.sourceViewController as CenterViewController
        
        //db?
        //  let destinationController = self.destinationViewController as UIViewController
        
        var mainView: UIStoryboard!
        //todo get from prepareforsegue
     // theID.storyboard = "CenterSample"
     // theID.screen = "entry"
        theID = parentController.passId;
        
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


