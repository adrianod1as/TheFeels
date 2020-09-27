//
//  Loadable.swift
//  Common
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public protocol Loadable: AnyObject {

    func manage(isLoading: Bool)
}
