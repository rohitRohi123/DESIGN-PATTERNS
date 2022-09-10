//  Created by Rohit Chauhan on 12/08/22.

import Foundation
import UIKit

public enum ConstraintsType: CaseIterable {
    public static var allCases: [ConstraintsType] = []
    
    case leading(Double), trailing(Double), top(Double), bottom(Double)
    
}

public protocol ViewConstraintsProtocol: ConstraintsProtocol {
    func addConstraints(with constraintType: [ConstraintsType],
                             for view: UIView,
                             with otherView: UIView)
    
}

public protocol SuperViewRelationConstraintProtocol {
    func addConstraintsToSuperView(for: UIView, and constraintTypes: [ConstraintsType])
    
}

public protocol ConstraintsProtocol {
    func topConstraint(for view: UIView,
                          with otherView: UIView,
                                  constant: Double)-> NSLayoutConstraint
    func bottomConstraint(for view: UIView,
                          with otherView: UIView,
                                  constant: Double)-> NSLayoutConstraint
    func leadingConstraint(for view: UIView,
                           with otherView: UIView,
                                  constant: Double)-> NSLayoutConstraint
    func trailingConstraint(for view: UIView,
                            with otherView: UIView,
                                  constant: Double)-> NSLayoutConstraint
}

public protocol SafeAreaProtocol {
    func appSafeAreaInsets()-> UIEdgeInsets?
    
}

extension ViewConstraintsProtocol {
    public func addConstraints(with constraintTypes: [ConstraintsType],
                             for view: UIView,
                        with otherView: UIView) {
        var constraints: [NSLayoutConstraint] = []
        
        for constraintType in constraintTypes {
            switch constraintType {
            case .leading(let double):
                let leadingCons = self.leadingConstraint(for: view, with: otherView, constant: double)
                constraints.append(leadingCons)
                
            case .trailing(let double):
                constraints.append(self.trailingConstraint(for: view, with: otherView, constant: double))
                
            case .top(let double):
                constraints.append(self.topConstraint(for: view, with: otherView, constant: double))
                
            case .bottom(let double):
                constraints.append(self.bottomConstraint(for: view, with: otherView, constant: double))
            }
            
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

//MARK: SuperViewRelationConstraintProtocol
extension SuperViewRelationConstraintProtocol {
    public func addConstraintsToSuperView(for view: UIView, and constraintTypes: [ConstraintsType]) {
        let views: Dictionary<String, Any> = ["view": view]
        var matrics: Dictionary<String, Any> = [:]
        
        var viewConstraints: [NSLayoutConstraint] = []
        
        for constraintType in constraintTypes {
            switch constraintType {
                case .leading(let double):
                    matrics["leadingPadding"] = double
                let leadingConsStr = "H:|-leadingPadding-[view]"
                let leadingCons = NSLayoutConstraint.constraints(withVisualFormat: leadingConsStr, metrics: matrics, views: views)
                viewConstraints += leadingCons
                
                case .trailing(let double):
                    matrics["trailingPadding"] = double
                    let trailingConsStr = "H:[view]-trailingPadding-|"
                    let trailingCons = NSLayoutConstraint.constraints(withVisualFormat: trailingConsStr, metrics: matrics, views: views)
                   viewConstraints += trailingCons
               
                case .top(let double):
                    matrics["topPadding"] = double
                    let topConsStr = "V:|-topPadding-[view]"
                    let topCons = NSLayoutConstraint.constraints(withVisualFormat: topConsStr, metrics: matrics, views: views)
                    viewConstraints += topCons
                
                case .bottom(let double):
                    matrics["bottomPadding"] = double
                    let bottomConsStr = "V:[view]-bottomPadding-|"
                    let bottomCons = NSLayoutConstraint.constraints(withVisualFormat: bottomConsStr, metrics: matrics, views: views)
                    viewConstraints += bottomCons
                
            }
            
        }
        
        NSLayoutConstraint.activate(viewConstraints)
    }
    
}

//MARK: - ConstraintsProtocol
extension ConstraintsProtocol {
    public func topConstraint(for view: UIView,
                       with otherView: UIView,
                                  constant: Double)-> NSLayoutConstraint {
        return view.topAnchor.constraint(equalTo: otherView.topAnchor, constant: constant)
    }
    
    public func bottomConstraint(for view: UIView,
                          with otherView: UIView,
                             constant: Double)-> NSLayoutConstraint {
        return view.bottomAnchor.constraint(equalTo: otherView.bottomAnchor, constant: constant)
    }
    
    public func leadingConstraint(for view: UIView,
                           with otherView: UIView,
                              constant: Double)-> NSLayoutConstraint {
        return view.leadingAnchor.constraint(equalTo: otherView.leadingAnchor, constant: constant)
    }
    
    public func trailingConstraint(for view: UIView,
                               with otherView: UIView,
                               constant: Double)-> NSLayoutConstraint {
        return view.trailingAnchor.constraint(equalTo: otherView.trailingAnchor, constant: constant)
    }
    
}

//MARK: - Safe Area Insets
extension SafeAreaProtocol {
    public func appSafeAreaInsets()-> UIEdgeInsets? {
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.first
            return window?.safeAreaInsets
        }
        
        if #unavailable(iOS 13.0) {
            let window = UIApplication.shared.keyWindow
            return window?.safeAreaInsets
        }
        
        return nil
    }
}


public struct LayoutEngine: ViewConstraintsProtocol, SafeAreaProtocol, SuperViewRelationConstraintProtocol {
    public init() {}
}
