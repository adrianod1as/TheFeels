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
    case search(username: String)
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
        case .search:
            return "\(version)/\(api)/search.json"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .search:
            return .get
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .search(let username):
            return .requestParameters(parameters: ["q": username], encoding: URLEncoding.default)
        }
    }

    public var specificHeaderTypes: [HeaderSpecifying] {
        []
    }
}
