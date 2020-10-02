//
//  UIView+Ext.swift
//  Common
//
//  Created by Adriano Dias on 22/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit

public extension UIView {

    static var identifier: String {
        return String(describing: self)
    }

    func fill(_ view: UIView, constant: CGFloat = 0, safe: Bool = true) {
        if safe {
            self.leftSafeAnchor.constraint(equalTo: view.leftSafeAnchor, constant: constant).isActive = true
            self.rightSafeAnchor.constraint(equalTo: view.rightSafeAnchor, constant: constant).isActive = true
            self.topSafeAnchor.constraint(equalTo: view.topSafeAnchor, constant: constant).isActive = true
            self.bottomSafeAnchor.constraint(equalTo: view.bottomSafeAnchor, constant: constant).isActive = true
        } else {
            self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant).isActive = true
            self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: constant).isActive = true
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true
        }
    }

    var leftSafeAnchor: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.leftAnchor
    }

    var rightSafeAnchor: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.rightAnchor
    }

    var topSafeAnchor: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.topAnchor
    }

    var bottomSafeAnchor: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.bottomAnchor
    }
}
