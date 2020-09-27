//
//  Numbers+Ext.swift
//  Domain
//
//  Created by Adriano Dias on 27/09/20.
//

public extension Array where Element == Int {

    var string: String {
        return self.map({ String($0) }).joined()
    }

}
