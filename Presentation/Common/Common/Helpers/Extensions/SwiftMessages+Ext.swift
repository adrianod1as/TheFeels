//
//  SwiftMessages+Ext.swift
//  Common
//
//  Created by Adriano Dias on 24/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import SwiftMessages

public extension SwiftMessages {

    static func show(error: String) {
        let alert = MessageView.viewFromNib(layout: .cardView)
        alert.configureTheme(.error)
        alert.configureContent(title: String(), body: error)
        alert.button?.isHidden = true
        SwiftMessages.show(view: alert)
    }
}
