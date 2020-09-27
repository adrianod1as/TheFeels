//
//  UIApplication+Ext.swift
//  Common
//
//  Created by Adriano Dias on 25/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit

public extension UIApplication {

    /// Switch current root view controller with a new view controller.
    ///
    /// - Parameters:
    ///   - viewController: new view controller.
    ///   - animated: set to true to animate view controller change _(default is true)_.
    ///   - duration: animation duration in seconds _(default is 0.5)_.
    ///   - options: animataion options _(default is .transitionFlipFromRight)_.
    ///   - completion: optional completion handler called when view controller is changed.
    func switchRootViewController(to viewController: UIViewController, animated: Bool = true, duration: TimeInterval = 0.5,
                                  options: UIView.AnimationOptions = .transitionFlipFromRight,
                                  completion: (() -> Void)? = nil) {
        guard let window = self.windows.first else {
            return
        }
        window.switchRootViewController(to: viewController, animated: animated,
                                        duration: duration, options: options, completion: completion)
    }

}
