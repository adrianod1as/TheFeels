//
//  Encodable+Ext.swift
//  Domain
//
//  Created by Adriano Dias on 27/09/20.
//

import SwiftyJSON

extension Encodable {

    public var data: Data? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        return data
    }

    public var json: JSON {
        guard let jsonFromData = JSON.nonNullableJson(data: data) else {
            return .null
        }
        return jsonFromData
    }

    public var rawObject: [String: Any]? {
        return json.dictionaryObject
    }

}
