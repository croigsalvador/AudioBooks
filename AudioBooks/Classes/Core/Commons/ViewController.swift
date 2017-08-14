//
//  ViewController.swift
//  AudioBooks
//
//  Created by Carlos Roig on 14/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController
{
    
    public func addChild(viewController: UIViewController, toView: UIView? = nil) {
        let view: UIView = toView ?? self.view
        
        self.addChildViewController(viewController)
        viewController.willMove(toParentViewController: self)
        view.addSubview(viewController.view)
        viewController.didMove(toParentViewController: self)
    }
    
    /**
     Removes a view controller from the hierarchy
     */
    public func removeFromParent() {
        self.willMove(toParentViewController: nil)
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
    
}
