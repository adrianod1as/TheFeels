//
//  Validation.swift
//  Domain
//
//  Created by Adriano Dias on 10/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public struct Validation<Value> {

    public typealias Predicate = (Value) -> ValidationResult

    private let predicate: Predicate

    public init(predicate: @escaping Predicate) {
        self.predicate = predicate
    }

    public func isValid(value: Value) -> ValidationResult {
        return self.predicate(value)
    }

}
