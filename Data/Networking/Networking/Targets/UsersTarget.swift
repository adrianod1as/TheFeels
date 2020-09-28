//
//  UsersTarget.swift
//  Networking
//
//  Created by Adriano Dias on 28/09/20.
//

import OxeNetworking
import Moya
import Domain

public enum UsersTarget {
    case lookup(username: String)
}

extension UsersTarget: TwitterApiFriendly {

    public var api: String {
        return "users"
    }

    public var version: String {
        return 1.1.description
    }

    public var path: String {
        switch self {
        case .lookup:
            return "\(version)/\(api)/lookup.json"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .lookup:
            return .get
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .lookup(let username):
            return .requestParameters(parameters: ["screen_name": username], encoding: URLEncoding.default)
        }
    }
}
