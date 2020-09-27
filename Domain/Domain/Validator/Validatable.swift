//
//  Validatable
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation

public typealias ValidationResult = Result<Void, Error>

internal protocol Validatable {

    associatedtype Failure: Error
    var validations: [ValidationResult] { get }
}

internal extension Validatable {

    var failures: [Error] {
        return validations.compactMap({ $0.failure })
    }

    var isValid: Bool {
        return failures.isEmpty
    }

}

public extension ValidationResult {

    var isValid: Bool {
        return failure == nil && success != nil
    }
}
