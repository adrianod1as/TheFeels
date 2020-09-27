//
//  DependencyManufacturing.swift
//  DI
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Swinject

public protocol DependencyManufacturing: AnyObject {

    init(resolver: Resolver)
}
