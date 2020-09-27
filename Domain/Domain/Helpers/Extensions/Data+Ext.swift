//
//  Data+Ext.swift
//  Domain
//
//  Created by Adriano Dias on 27/09/20.
//

extension Data {

    public func decode<T: Decodable>(_ decodableType: T.Type) -> T? {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(decodableType, from: self)
            return result
        } catch let error as NSError {
            debugPrint(error.description)
            return nil
        }
    }
}
