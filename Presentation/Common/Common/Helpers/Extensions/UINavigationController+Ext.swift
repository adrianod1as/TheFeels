//
//  UINavigationController+Ext.swift
//  Common
//
//  Created by Adriano Dias on 23/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit

public extension UINavigationController {

    func asTranslucent() {
        navigationBar.asTranslucent()
    }

    func asTheFeels() {
        navigationBar.asTheFeels()
    }
}

public extension UINavigationBar {

    func asTheFeels() {
        self.tintColor = ColorName.twitterBlue
        self.backgroundColor = ColorName.twitterBlack
        self.isTranslucent = false
        self.barTintColor = ColorName.twitterBlack
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        let font = FontFamily.RubikMedium.regular.font(size: UIScreen.isLarge ? 20 : 16)
        self.titleTextAttributes = [.foregroundColor: UIColor.white, .font: font]
    }

    func asTranslucent() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
        self.backgroundColor = .clear
        self.tintColor = ColorName.twitterBlue
        let font = FontFamily.RubikMedium.regular.font(size: UIScreen.isLarge ? 20 : 16)
        self.titleTextAttributes = [.foregroundColor: UIColor.white, .font: font]
    }

    func setTransparency(status: Bool, backgroundColor: UIColor = .white) {
        self.isTranslucent = status
        self.backgroundColor = status ? .clear : backgroundColor
    }
}
