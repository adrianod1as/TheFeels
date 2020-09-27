//
//  UIColor+Ext.swift
//  Common
//
//  Created by Adriano Dias on 24/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit

public extension UIColor {

    func alpha(_ alpha: CGFloat) -> UIColor {
        return self.withAlphaComponent(alpha)
    }
}
