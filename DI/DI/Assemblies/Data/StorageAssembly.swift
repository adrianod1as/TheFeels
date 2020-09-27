//
//  StorageAssembly.swift
//  DI
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Swinject
import AppData
import Storage

class StorageAssembly: Assembly {

    private let service: String
    private let accessGroup: String

    init(service: String = String(), accessGroup: String = String()) {
        self.service = service
        self.accessGroup = accessGroup
    }

    func assemble(container: Container) {
        assembleStorage(for: container)
        assembleDatasources(for: container)
    }

    internal func assembleStorage(for container: Container) {
    }

    internal func assembleDatasources(for container: Container) {
    }
}
