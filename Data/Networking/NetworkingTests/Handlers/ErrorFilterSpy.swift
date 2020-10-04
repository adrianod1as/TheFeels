//
//  ErrorFilterSpy.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 03/10/20.
//

import OxeNetworking
import Moya
@testable import Domain
@testable import Networking

class ErrorFilterSpy: ErrorFilter {

    var getDefaultErrorCalled = false
    var filterErrorCalled = false
    var filterForErrorsInResultCalled = false
    var filterForErrorsInResponseCalled = false

    func getDefaultError() -> Error {
        getDefaultErrorCalled.toggle()
        return InteractionError.failedRequest(Networking.L10n.Error.Description.unexpected)
    }

    func filter(error: Error) -> Error {
        filterErrorCalled.toggle()
        return error
    }

    func filterForErrors(in result: MoyaDispatcherResult) -> MoyaResult {
        filterForErrorsInResultCalled.toggle()
        return result.result
    }

    func filterForErrors(in response: MoyaDispatcherResponse) throws -> Response {
        filterForErrorsInResponseCalled.toggle()
        return response.moyaResponse
    }
}
