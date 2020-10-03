//
//  TFResultHandler.swift
//  Networking
//
//  Created by Adriano Dias on 02/10/20.
//

import Moya
import Domain
import OxeNetworking

public class TFResultHandler: ResultHandler {

    internal weak var coordinator: SignOutSceneCoordinating?

    public init(coordinator: SignOutSceneCoordinating?) {
        self.coordinator = coordinator
    }

    public func handleRequest(response: Response?, completion: @escaping GenericCompletion<Void>) {
        completion(.success(()))
    }

    public func handleRequest(error: Error?, completion: @escaping GenericCompletion<Void>) {
        guard let interactionError = error as? InteractionError else {
            completion(.success(()))
            return
        }
        switch interactionError {
        case .expiredUserSession:
            handleExpiredUserSession()
            completion(.success(()))
        default:
            completion(.success(()))
        }
    }

    private func handleExpiredUserSession() {
        coordinator?.didSignOut()
    }
}
