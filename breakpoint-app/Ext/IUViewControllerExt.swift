//
//  IUViewControllerExt.swift
//  breakpoint-app
//
//  Created by Denis Rakitin on 2018-08-09.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transiton = CATransition()
        transiton.duration = 0.3
        transiton.type = kCATransitionPush
        transiton.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transiton, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func dismissDetail() {
        let transiton = CATransition()
        transiton.duration = 0.3
        transiton.type = kCATransitionPush
        transiton.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transiton, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
