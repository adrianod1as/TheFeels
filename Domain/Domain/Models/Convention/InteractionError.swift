//
//  InteractionError.swift
//  Domain
//
//  Created by Adriano Dias on 27/09/20.
//

public enum InteractionError: Error {
    case invalidInput(String)
    case failedRequest(String)
    case connectionProblem(String)
    case noInternetConnection(String)
    case expiredUserSession(String)
    case resourceNotFound(String)
    case none
}

extension InteractionError: LocalizedError {

    public var failureReason: String? {
        L10n.Error.Title.ops
    }

    public var errorDescription: String? {
        switch self {
        case .invalidInput(let message), .failedRequest(let message), .connectionProblem(let message),
             .resourceNotFound(let message), .noInternetConnection(let message), .expiredUserSession(let message):
            return message
        default:
            return String()
        }
    }
}
