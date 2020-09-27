//
//  UINavigationController+Ext.swift
//  Common
//
//  Created by Adriano Dias on 23/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit

public extension UINavigationController {

    func asTranslucentWithImageNavigationController() {
        self.navigationBar.asTranslucentWithImageNavigationBar()
    }
}

public extension UINavigationBar {

    func asTranslucentWithImageNavigationBar() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
        self.backgroundColor = .clear
//        self.backIndicatorImage = Asset.back.image.alwaysTemplate
//        self.backIndicatorTransitionMaskImage = Asset.back.image.alwaysTemplate
        self.tintColor = .white
        let font = FontFamily.RubikMedium.regular.font(size: UIScreen.isLarge ? 20 : 16)
        self.titleTextAttributes = [.foregroundColor: UIColor.white, .font: font]
    }

    func setTransparency(status: Bool, backgroundColor: UIColor = .white) {
        self.isTranslucent = status
        self.backgroundColor = status ? .clear : backgroundColor
    }
}
