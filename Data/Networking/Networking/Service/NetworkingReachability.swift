//
//  NetworkingReachability.swift
//  Networking
//
//  Created by Adriano Dias on 13/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Alamofire

public protocol NetworkingReachability {

    var isReachable: Bool { get }
}

extension NetworkReachabilityManager: NetworkingReachability { }
