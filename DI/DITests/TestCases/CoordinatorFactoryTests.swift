//
//  CoordinatorFactoryTests.swift
//  DITests
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
import Swinject
@testable import DI

class CoordinatorFactoryTests: XCTestCase {

    private var sut: CoordinatorFactory!
    private let container = Container()
    private let coordinatorFactoryAssembly = CoordinatorFactoryAssembly()
    private let coordinatorsAssembly = CoordinatorsAssembly(navigationController: UINavigationController())
    private let authFlowAssembly = AuthFlowAssembly()

    override func setUp() {
        super.setUp()

        sut = CoordinatorFactory(resolver: container)
        coordinatorFactoryAssembly.assemble(container: container)
        coordinatorsAssembly.assemble(container: container)
        authFlowAssembly.assemble(container: container)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testMakeAuthCoordinator() {
        XCTAssertNotNil(sut.makeAuthCoordinator())
    }
}
