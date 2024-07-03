import UIKit

extension UIView {
    
    func commonParent(with otherView: UIView) -> UIView? {
        var ancestor: UIView? = self
        
        //Traverse the parent chain of the first view
        while ancestor != nil {
            var secondAncestor: UIView? = otherView
            
            // check if the current ancestor is a common ancestor
            while secondAncestor != nil {
                if ancestor == secondAncestor {
                    return ancestor
                }
                
                secondAncestor = secondAncestor?.superview
            }
            
            ancestor = ancestor?.superview
        }
        
        // no common ancestor found
        return nil
        
    }
    
    func commonParentRecursive(with otherView:UIView) -> UIView? {
        
        // helper function to get the set of ancestors of a view
        func ancestors(of view: UIView) -> Set<UIView> {
            var ancestors = Set<UIView>()
            var currentView: UIView? = view.superview
            while let ancestor = currentView {
                ancestors.insert(ancestor)
                currentView = ancestor.superview
            }
            return ancestors
        }
        
        let ancestors1 = ancestors(of: self)
        let ancestors2 = ancestors(of: otherView)
        
        for ancestor in ancestors1 {
            if ancestors2.contains(ancestor) {
                return ancestor
            }
        }
        
        return nil
    }
}

let view1 = UIView()
view1.tag = 1
let view2 = UIView()
view2.tag = 2
let view3 = UIView()
view1.addSubview(view2)
view3.tag = 3
view1.addSubview(view3)
let commonParent = view2.commonParentRecursive(with: view3)
print("common Paret : \(String(describing: commonParent?.tag))")
