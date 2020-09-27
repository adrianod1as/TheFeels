//
//  UIViewController+Ext.swift
//  Common
//
//  Created by Adriano Dias on 24/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import NVActivityIndicatorView

public protocol UDTAnimatorViewable: NVActivityIndicatorViewable {

    func udtStartAnimating()
    func udtStopAnimating()
}

public extension UDTAnimatorViewable where Self: UIViewController {

    func udtStartAnimating() {
        startAnimating(type: .ballSpinFadeLoader, color: ColorName.twitterBlue)
    }

    func manage(isLoading: Bool) {
        if isLoading {
            udtStartAnimating()
        } else {
            udtStopAnimating()
        }
    }

    func udtStopAnimating() {
        stopAnimating()
    }
}
