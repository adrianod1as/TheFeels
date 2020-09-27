//
//  UIScreen+Ext.swift
//  Common
//
//  Created by Adriano Dias on 22/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit

public extension UIScreen {

    static var width: CGFloat {
        main.bounds.size.width
    }

    static var height: CGFloat {
        main.bounds.size.height
    }

    static var maxLenght: CGFloat {
        max(width, height)
    }

    static var minLenght: CGFloat {
        min(width, height)
    }

    static var isLarge: Bool {
        width > 320
    }
}
