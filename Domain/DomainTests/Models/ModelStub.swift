//
//  ModelStub.swift
//  DomainTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
@testable import Domain

struct ModelStub: Validatable {

    let validations: [ValidationResult]

    enum Failure: LocalizedError {
        case some(String)

        public var failureReason: String? {
            return L10n.Error.Title.ops
        }

        public var errorDescription: String? {
            switch self {
            case .some(let message):
                return message
            }
        }
    }
}
