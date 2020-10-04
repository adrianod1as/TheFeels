//
//  SentimentTarget.swift
//  Networking
//
//  Created by Adriano Dias on 04/10/20.
//

import OxeNetworking
import Moya
import Domain

public enum SentimentTarget {
    case analyze(text: String)
}

extension SentimentTarget: SentimApiFriendly {

    public var api: String {
        return "api"
    }

    public var version: String {
        return "v1"
    }

    public var path: String {
        switch self {
        case .analyze:
            return "\(api)/\(version)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .analyze:
            return .post
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .analyze(let text):
            return .requestParameters(parameters: ["text": text], encoding: JSONEncoding.default)
        }
    }
}
