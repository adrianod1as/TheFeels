//
//  FileReading.swift
//  Storage
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation

public protocol FileReading {

    func get<T: Decodable>(_ type: T.Type, fileName: String) -> T?
}
