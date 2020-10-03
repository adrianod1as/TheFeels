//
//  DomainAssembly.swift
//  DI
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Swinject
import Domain

class DomainAssembly: Assembly {

    func assemble(container: Container) {
        container.autoregister(SearchUserByNameUseCaseable.self,
                               initializer: SearchUserByNameUseCase.init)
    }
}
