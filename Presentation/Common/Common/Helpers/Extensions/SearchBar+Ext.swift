//
//  SearchBar+Ext.swift
//  Common
//
//  Created by Adriano Dias on 03/10/20.
//

import UIKit

public extension UISearchController {

    func setTFStyle() {
        searchBar.setTFStyle()
    }
}

public extension UISearchBar {

    func setTFStyle() {
        layoutIfNeeded()
        tintColor = ColorName.twitterBlue
        backgroundColor = .clear
        barTintColor = ColorName.twitterBlue
        backgroundImage = UIImage()
        isTranslucent = true
        sizeToFit()
        textField?.font = FontFamily.Rubik.regular.font(size: 16)
        UITextField
            .appearance(whenContainedInInstancesOf: [UISearchBar.self])
            .defaultTextAttributes = [.foregroundColor: UIColor.white]
        textField?.backgroundColor = ColorName.twitterBlack

    }

    var textField: UITextField? {
        if #available(iOS 13.0, *) {
            return searchTextField
        }
        return value(forKey: L10n.UISearchBar.searchField) as? UITextField
    }

}
