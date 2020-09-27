//
//  ErrorStub.swift
//  DomainTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation

struct ErrorStub: LocalizedError {

    let failureReason: String?
    let errorDescription: String?
}
