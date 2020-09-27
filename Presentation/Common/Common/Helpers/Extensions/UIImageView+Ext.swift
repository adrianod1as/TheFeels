//
//  UIImageView+Ext.swift
//  Common
//
//  Created by Adriano Dias on 22/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit

public extension UIImageView {

    func set(concontentsOf url: URL?, completion: (() -> Void)?) {
        guard let url = url else {
            assertionFailure(L10n.Resolver.SafelyResolve.preconditionFailure(URL.self))
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
                completion?()
            }
        }
    }
}
