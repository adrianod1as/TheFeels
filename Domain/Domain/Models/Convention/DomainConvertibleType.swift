//
//  DomainConvertibleType.swift
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation

public protocol DomainConvertible {

    associatedtype DomainType

    var asDomain: DomainType { get }
}

extension DomainConvertible where DomainType: Decodable, Self: Encodable {

    var asDomain: DomainType {
        guard let data = self.data, let model = data.decode(DomainType.self) else {
            fatalError()
        }
        return model
    }
}
