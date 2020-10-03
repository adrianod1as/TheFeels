//
//  TFErrorFilter.swift
//  Networking
//
//  Created by Adriano Dias on 02/10/20.
//

import Domain
import Moya
import OxeNetworking

public class TFErrorFilter: ErrorFilter {

    public init() {}

    public func getDefaultError() -> Error {
        InteractionError.failedRequest(L10n.Error.Description.unexpected)
    }

    public func filter(error: Error) -> Error {
        error
    }

    public func filterForErrors(in result: MoyaDispatcherResult) -> MoyaResult {
        result.result
    }

    public func filterForErrors(in response: MoyaDispatcherResponse) throws -> Response {
        response.moyaResponse
    }

}
