//
//  Resolver+Ext.swift
//  Common
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Swinject

public extension Resolver {

    func safelyResolve<Service>(_ serviceType: Service.Type) -> Service {
        guard let dependency = resolve(serviceType, name: nil) else {
            preconditionFailure(L10n.Resolver.SafelyResolve.preconditionFailure(serviceType))
        }
        return dependency
    }
}

public extension Container {

    func safelyResolve<Service>(_ serviceType: Service.Type) -> Service {
        guard let dependency = resolve(serviceType, name: nil) else {
            preconditionFailure(L10n.Resolver.SafelyResolve.preconditionFailure(serviceType))
        }
        return dependency
    }
}
