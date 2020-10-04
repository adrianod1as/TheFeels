//
//  TweetsTarget.swift
//  Networking
//
//  Created by Adriano Dias on 03/10/20.
//

import OxeNetworking
import Moya
import Domain

public enum TweetsTarget {
    case search(username: String)
}

extension TweetsTarget: TwitterApiFriendly {

    public var api: String {
        return "statuses"
    }

    public var version: String {
        return 1.1.description
    }

    public var path: String {
        switch self {
        case .search:
            return "\(version)/\(api)/user_timeline.json"
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
            return .requestParameters(parameters: ["screen_name": username], encoding: URLEncoding.default)
        }
    }
}
