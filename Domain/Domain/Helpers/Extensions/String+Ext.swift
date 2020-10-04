//
//  String+Ext.swift
//  Domain
//
//  Created by Adriano Dias on 03/10/20.
//

public extension String {

    var wordsBySpace: [String] {
        components(separatedBy: .whitespacesAndNewlines).nonEmpty
    }
}

public extension Array where Element == String {

    var nonEmpty: [Element] {
        filter({ !$0.isEmpty })
    }
}
