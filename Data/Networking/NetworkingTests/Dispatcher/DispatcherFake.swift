//
//  DispatcherFake.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 13/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import OxeNetworking
import Moya
import RxSwift
@testable import Domain
@testable import Networking

class DispacherFake: ReactiveCompatible, RxDispatcher {

    let environment: Environment
    private let responseData: Data

    init(data: Data?) {
        self.responseData = data ?? Data()
        self.environment = Environment(type: EnvironmentType.development, fixturesType: FixturesType.none)
    }

    convenience init(model: Codable) {
        self.init(data: model.data)
    }

    func call(endpoint: TargetType, completion: @escaping Completion) {
        completion(.success(Response(statusCode: 200, data: responseData)))
    }
}
