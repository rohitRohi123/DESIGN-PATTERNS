//
//  UIView+Extension.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 07/09/22.
//

import UIKit

extension UIView {
    func loadNib(with name: String)-> UIView? {
        return Bundle.main.loadNibNamed(name, owner: self)?.first as? UIView
    }
    
}

extension UIApplication {
    func applicationTopViewController(callback:@escaping (UIViewController?)-> Void){
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        
        DispatchQueue.main.async {
            let window = keyWindow
            let vc = window?.topViewController()
            
            callback(vc)
        }
        
         
        
    }
    
}

extension UIWindow {
    func topViewController() -> UIViewController? {
        var top = self.rootViewController
        while true {
            if let presented = top?.presentedViewController {
                top = presented
            } else if let nav = top as? UINavigationController {
                top = nav.visibleViewController
            } else if let tab = top as? UITabBarController {
                top = tab.selectedViewController
            } else {
                break
            }
        }
        return top
    }
    
    var isTabbarLoaded: Bool {
        var top = self.rootViewController
        while true {
            if let presented = top?.presentedViewController {
                top = presented
            } else if let nav = top as? UINavigationController {
                top = nav.visibleViewController
            } else if let _ = top as? UITabBarController {
                return true
            } else {
                return false
            }
        }
        
    }

}
