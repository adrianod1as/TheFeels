//
//  Enforcer.swift
//  Domain
//
//  Created by Adriano Dias on 10/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

struct Enforcer<Value> {

    let value: Value
    let validations: [Validation<Value>]

    func enforce() -> ValidationResult {
        return validations
                .map({ $0.isValid(value: value) })
                .filter({ $0.failure != nil }).first ?? .success(())
    }
}
